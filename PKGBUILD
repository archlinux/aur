# Maintainer: András Czigány <andras dot czigany dot 13 at gmail dot com>

# Based on the 'eea' AUR package by:
## Maintainer: Peter Jirasek <aur@dbs.sk>

_pkgname=eea
pkgname="${_pkgname}-dkms"
pkgver=7.1.9.0
pkgrel=3
arch=('x86_64')
pkgdesc='ESET Endpoint Antivirus Business for Linux'
url='https://www.eset.com/int/business/endpoint-antivirus-linux/'
license=('proprietary')
depends=(
  'dkms'
  'perl'
  'libelf'
  'systemd-libs'
  'openssl-1.0'
)
conflicts=('esets' "${_pkgname}")
install=${_pkgname}.install

_bundle=${_pkgname}u.${arch}.bin
_deb=${_pkgname}-${pkgver}-ubuntu18.${arch}.deb
_kernel_module_dir=/var/opt/eset/${_pkgname}/eventd

# https://www.eset.com/int/business/endpoint-antivirus-linux/download/
source=(
  "https://download.eset.com/com/eset/apps/business/eea/linux/g2/latest/${_bundle}"
  "dkms.conf"
  "dkms_postinst"
  "linux-5.10.patch"
)

sha256sums=('59e6ad38eb3809997e2d5eb91a0195a3c321656f5e8e8c64e61a02a9ac8c922e'
            '0ff7dd79c8811afbc95b121f322bbec4839d7ce7334e5825fa447e3f3ad129e7'
            '29108ffcfd83fc9e1b5cdfd6b7a06143f213466a7bfa0222b07490d04900e641'
            'fb0ce96e2586ff6d41e2d707c8738d3ecc14a5b1072bd8973c7a11af647c2f4d')

prepare() {
  msg2 "Extracting package bundle..."
  tail -n +`awk '/^exit$/ { print NR + 1; exit }' "${_bundle}"` "${_bundle}" | tar -xv ${_deb}
  rm -f ${srcdir}/../${_bundle}

  msg2 "Extracting ${_deb}..."
  bsdtar -xf ${_deb}

  msg2 "Creating ${install}..."
  bsdtar -xf control.tar.gz

  csplit preinst "/### Upgrade ###/" --suppress-matched -f preinst --quiet
  csplit postinst "/### Upgrade & Install ###/" --suppress-matched -f postinst --quiet

  echo "pre_install() {
`sed -e "s/^/\t/g" preinst00`
}

pre_upgrade() {
`sed -e "s/^/\t/g" preinst | sed -e 's/\[ "$1" = "upgrade" ] || \[ "$1" = "2" ]/true/g'`
}

post_install() {
`sed -e "s/^/\t/g" postinst00 | sed -e 's/\[ "$1" = "configure" ] || \[ "$1" = "1" ]/true/g'`
}

post_upgrade() {
`sed -e "s/^/\t/g" postinst | sed -e 's/\[ "$1" = "configure" ] || \[ "$1" = "1" ]/true/g' -e 's/\[ "$1" = "2" ]/false/g' -e 's/\[ "$1" = "configure" ] && \[ -n "$2" ]/true/g'`
}

pre_remove() {
`sed -e "s/^/\t/g" prerm | sed -e 's/\[ "$1" = "upgrade" ] || \[ "$1" = "1" ]/false/g'`
}

post_remove() {
`sed -e "s/^/\t/g" postrm | sed -e 's/\[ "$1" = "upgrade" ] || \[ "$1" = "1" ]/false/g' -e 's/\[ "$1" = "purge" ]/false/g'`

	# remove kernel modules
	rm -rf /lib/modules/**/eset/eea
	rmdir --ignore-fail-on-non-empty /lib/modules/**/eset
}" | sed -e "/#!/d;s/[ \t]*$//" > ${srcdir}/../${install}

}

package() {
  msg2 "Extracting data.tar.gz..."
  bsdtar -xf data.tar.gz -C ${pkgdir}/

  msg2 "Checking file integrity..."
  cd ${pkgdir}
  md5sum ${srcdir}/md5sums --check --quiet
  cd ${srcdir}

  # fix permissions
#  chmod 0755 ${pkgdir}/opt
#  chmod 0755 ${pkgdir}/var
#  chmod 0755 ${pkgdir}/var/log
  chmod 0700 ${pkgdir}/var/log/eset/${_pkgname}/
#  chmod 0755 ${pkgdir}/var/opt
  chmod 0775 ${pkgdir}/var/opt/eset/${_pkgname}/
  chmod 1770 ${pkgdir}/var/opt/eset/${_pkgname}/cache/
  chmod 1770 ${pkgdir}/var/opt/eset/${_pkgname}/cache/data/

  # Patch kernel module to support kernels >=5.10
  chmod 0755 ${pkgdir}/${_kernel_module_dir}
  local i;for i in "${source[@]}";do
    case $i in
      *.patch)
        msg2 "Applying patch ${i}..."
        patch -p1 -d ${pkgdir}/${_kernel_module_dir} -i "${srcdir}/${i}"
    esac
  done

  msg2 "Installing DKMS module..."

  install -Dm644 dkms.conf "${pkgdir}"/${_kernel_module_dir}/dkms.conf
  install -Dm755 dkms_postinst "${pkgdir}"/${_kernel_module_dir}/dkms_postinst

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/${_kernel_module_dir}/dkms.conf

  # Link kernel module sources (including Makefile) to DKMS default
  mkdir "${pkgdir}"/usr/src
  ln -s ${_kernel_module_dir} "${pkgdir}"/usr/src/${_pkgname}-${pkgver}
}
