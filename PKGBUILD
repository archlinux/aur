# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.23.2
pkgrel=2
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=('curl' 'libarchive' 'hicolor-icon-theme' 'jsoncpp' 'libjsoncpp.so' 'libuv' 'rhash')
makedepends=('qt6-base' 'python-sphinx' 'emacs')
optdepends=('qt6-base: cmake-gui')
source=("https://www.cmake.org/files/v${pkgver%.*}/${pkgname}-${pkgver}.tar.gz"
         wxwidgets-3.2.patch)
sha512sums=('0925adf973d642fd76d4089b61b3882babb0a85050c4c57d5f5f3bd6b17564a9feb0beed236cd636e25f69072fa30b67ea3f80932380b6b6576f2dd78b8e6931'
            '618a529fcd0a5029160fc6ef74439b7cb54ca74d13d52dd6cad005710bf1be263d0bf90bc4becc63a37929ac2f86c51278685e9da93fd82355ac646cb43b356f')

prepare() {
  patch -d $pkgname-$pkgver -p1 < wxwidgets-3.2.patch # Support wxWidgets 3.2
}

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap --prefix=/usr \
    --mandir=/share/man \
    --docdir=/share/doc/cmake \
    --datadir=/share/cmake \
    --sphinx-man \
    --sphinx-html \
    --system-libs \
    --qt-gui \
    --parallel=$(/usr/bin/getconf _NPROCESSORS_ONLN)
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share/doc/cmake/html/_sources
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 Copyright.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
