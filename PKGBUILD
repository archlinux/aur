# Maintainer: András Czigány <andras dot czigany dot 13 at gmail dot com>

# Based on the 'eea' AUR package by:
## Maintainer: Peter Jirasek <aur@dbs.sk>

_pkgname=eea
pkgname="${_pkgname}-dkms"
_pkgver_major=9
pkgver=9.1.4.0
pkgrel=1
arch=('x86_64')
pkgdesc='ESET Endpoint Antivirus Business for Linux (DKMS)'
url='https://www.eset.com/int/business/endpoint-antivirus-linux/'
license=('proprietary')
depends=(
  'dkms>=3.0.2'
  'perl'
  'libelf'
  'systemd-libs'
  'openssl-1.0'
)
conflicts=('esets' "${_pkgname}" "${_pkgname}7-dkms")
install=${_pkgname}.install

_bundle_url=https://download.eset.com/com/eset/apps/business/eea/linux/g2/v${_pkgver_major}/${pkgver}
_bundle_file=eeau.x86_64.bin
_distro=ubuntu18

_deb=${_pkgname}-${pkgver}-${_distro}.${arch}.deb

# https://www.eset.com/int/business/endpoint-antivirus-linux/download/
source=("${_bundle_url}/${_bundle_file}"
  "dkms.conf"
  "dkms_postinst"
)

sha256sums=('54bd3c48a2bfdec11b5db7e2a10ce83b5abe6688d0f4486e647c1da0bc51564a'
            '53df6d50f98792053da2580df7828a06eef34dd066de684a333dd7569b481f93'
            '20539f7116bf44defc2df0f244d8c02722b06b97fe6be8a049c4ecafce2d744c')

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
