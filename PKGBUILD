# Maintainer: Benjamin Mugnier <benjamin.mugnier@bemug.fr>
# Contributor: Benjamin Mugnier <benjamin.mugnier@bemug.fr>

_pkgbase=hid-gamecube-adapter
pkgname=hid-gamecube-adapter-dkms-git
pkgver=r10.a36a63d
pkgrel=1
pkgdesc="A Linux kernel module for the Nintendo Wii U/Mayflash GameCube adapter"
arch=('any')
url="https://github.com/bemug/hid-gamecube-adapter"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}")
source=("git+https://github.com/bemug/hid-gamecube-adapter.git"
        'dkms.conf')
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
