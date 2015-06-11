# Maintainer: jyantis <aur at yantis dot net>

# Based off blackcoin-git-qt by aaron-lebo
# Based off dogecoin-git-qt by gee
# Based off primecoin-qt by Daniel Spies

pkgname=ethercoin-qt-git
pkgver=r3358.6e94e09
_gitname=ethercoin
_binname=ethercoin
pkgrel=2
pkgdesc="Cryptocurrency pegged to Ethereum"
arch=('x86_64' 'i686')
url="http://ethercoin.cc/"
license=('MIT')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/ethercoin/ethercoin.git'  'ethercoin.desktop')
install=$pkgname.install
sha256sums=('SKIP'
            '9e83e2fa233699bf1b9fec0a4108a171ab7945aa9732225c25cbf748cb7787ff')
provides=('ethercoin-qt')
conflicts=('ethercoin-qt')

pkgver() {
  cd ${_gitname}
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_gitname}
  qmake-qt4 ${_binname}-qt.pro
  make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

check(){
  cd ${_gitname}
  make check
}

package() {
  install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

  cd ${_gitname}
  install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 src/qt/res/icons/novacoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}

# vim:set ts=2 sw=2 et:
