# Maintainer: Shaleen Jain <shaleen(at)jain(dot)sh>

_pkgname=system76
_pkgbase=system76-dkms
pkgname=system76-dkms-git
pkgver=73
pkgrel=1
pkgdesc="The system76 driver kernel module (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/pop-os/system76-dkms"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
source=("system76::git+https://github.com/pop-os/system76-dkms.git#branch=master_bionic"
        'dkms.conf'
        'system76.conf')
md5sums=('SKIP'
         '654623daac5a4c9d69883d7b2b5ddac8'
         '1e988cc5cf05cec741f78fe90f2054d7')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git rev-list --count HEAD
}

package() {
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  # Copy dkms.conf
  install -Dm644 dkms.conf ${install_dir}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}"/dkms.conf

  # Copy sources (including Makefile)
  cp ${_pkgname}/*.c      ${install_dir}/
  cp ${_pkgname}/Makefile ${install_dir}/Makefile

  # Load the module at boot
  install -Dm644 system76.conf ${pkgdir}/etc/modules-load.d/system76.conf
}
