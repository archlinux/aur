# Maintainer: Daniel Maslowski <info at orangecms dot org>
_gitname=neopg
pkgname=neopg-git
pkgver=487.fa9054b
pkgrel=1
pkgdesc="The multiversal cryptoengine!"
arch=('i686' 'x86_64')
url="https://github.com/das-labor/neopg"
license=('BSD')
depends=('boost' 'botan' 'curl' 'gettext' 'gnutls' 'libusb' 'sqlite')
makedepends=('git' 'cmake')
provides=('neopg')
source=('git://github.com/das-labor/neopg.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_gitname}/build"
  git submodule update --init
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
}

build() {
  cd "${srcdir}/${_gitname}/build"
  make
}

package()
{
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm 755 lib/libneopg.so "${pkgdir}/usr/lib/libneopg.so"
  cd "${srcdir}/${_gitname}"
  install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/${_gitname}/license.txt"
}
