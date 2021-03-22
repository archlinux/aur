# Maintainer: András Czigány <andras dot czigany dot 13 at gmail dot com>

# Based on the 'eea' AUR package by:
## Maintainer: Peter Jirasek <aur@dbs.sk>

_pkgname=eea
pkgname="${_pkgname}-dkms"
_pkgver_major=7
pkgver=7.1.9.0
pkgrel=7
arch=('x86_64')
pkgdesc='ESET Endpoint Antivirus Business for Linux (DKMS)'
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

_bundle_url=https://download.eset.com/com/eset/apps/business/eea/linux/g2/v${_pkgver_major}/${pkgver}
_bundle_file=eeau.x86_64.bin
_distro=ubuntu18

_deb=${_pkgname}-${pkgver}-${_distro}.${arch}.deb

# https://www.eset.com/int/business/endpoint-antivirus-linux/download/
source=("${_bundle_url}/${_bundle_file}"
  "dkms.conf"
  "dkms_postinst"
  "linux-5.10.patch"
)

sha256sums=('59e6ad38eb3809997e2d5eb91a0195a3c321656f5e8e8c64e61a02a9ac8c922e'
            '0ff7dd79c8811afbc95b121f322bbec4839d7ce7334e5825fa447e3f3ad129e7'
            '29108ffcfd83fc9e1b5cdfd6b7a06143f213466a7bfa0222b07490d04900e641'
            'fb0ce96e2586ff6d41e2d707c8738d3ecc14a5b1072bd8973c7a11af647c2f4d')

_kernel_module_dir=/var/opt/eset/${_pkgname}/eventd

package() {
  msg2 "Extracting data.tar.gz..."
  tail -n +`awk '/^exit$/ { print NR + 1; exit }' "${_bundle_file}"` "${_bundle_file}" |
	bsdtar -xOf - ${_deb} |          # deb from bundle
	bsdtar -xOf - data.tar.gz |      # data.tar.gz from deb
	bsdtar -xf - -C ${pkgdir}/       # package content from data.tar.gz

  msg2 "Checking file integrity..."
  tail -n +`awk '/^exit$/ { print NR + 1; exit }' "${_bundle_file}"` "${_bundle_file}" |
	bsdtar -xOf - ${_deb} |          # deb from bundle
	bsdtar -xOf - control.tar.gz |   # control.tar.gz from deb
	bsdtar -xf - md5sums             # md5sums from control.tar.gz
  cd "${pkgdir}"
  md5sum "${srcdir}"/md5sums --check --quiet
  cd "${srcdir}"

  rm -f ${srcdir}/../${_bundle_file}

  # fix permissions
  chmod 0755 "${pkgdir}"/var
  chmod 0755 "${pkgdir}"/var/log
  chmod 0700 "${pkgdir}"/var/log/eset/${_pkgname}/
  chmod 0775 "${pkgdir}"/var/opt/eset/${_pkgname}/
  chmod 1770 "${pkgdir}"/var/opt/eset/${_pkgname}/cache/
  chmod 1770 "${pkgdir}"/var/opt/eset/${_pkgname}/cache/data/

  # Patch kernel module to support kernels >=5.10
  chmod 0755 "${pkgdir}"/${_kernel_module_dir}
  local i;for i in "${source[@]}";do
    case "$i" in
      *.patch)
        msg2 "Applying patch ${i}..."
        patch -p1 -d "${pkgdir}"/${_kernel_module_dir} -i "${srcdir}/${i}"
    esac
  done

  msg2 "Installing DKMS module..."

  install -Dm644 dkms.conf "${pkgdir}"/${_kernel_module_dir}/dkms.conf
  install -Dm755 dkms_postinst "${pkgdir}"/${_kernel_module_dir}/dkms_postinst

  # Set name and version
  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/${_kernel_module_dir}/dkms.conf

  # Install kernel module sources (including Makefile) to DKMS default
  mkdir -p "${pkgdir}"/usr/src
  cp -r "${pkgdir}"/${_kernel_module_dir} "${pkgdir}"/usr/src/${_pkgname}-${pkgver}

  # Check for existing kernel module in systemd service instead of building it
  sed -e 's|ExecStartPre=.*/check_start.sh|RestartSec=5s\
ExecStartPre=/usr/bin/bash -c "test -f /lib/modules/\`uname -r\`/eset/eea/eset_rtp.ko"|' \
      -i "${pkgdir}"/opt/eset/eea/etc/systemd/eea.service
}
