# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake
pkgver=3.31.0
pkgrel=1
pkgdesc='A cross-platform open-source make system'
arch=('x86_64')
url="https://www.cmake.org/"
license=('custom')
depends=(cppdap
         curl
         expat
         gcc-libs
         glibc
         hicolor-icon-theme
         jsoncpp
         libarchive
         libuv
         ncurses
         rhash
         zlib)
makedepends=(emacs
             git
             nlohmann-json
             python-sphinx
             qt6-base)
optdepends=(
  'make: for unix Makefile generator'
  'ninja: for ninja generator'
  'qt6-base: cmake-gui'
)
source=(git+https://gitlab.kitware.com/cmake/cmake#tag=v$pkgver?signed)
sha512sums=('97902c31c5276f8cf047b78b9e8138384bd7631f2e76226364cb38fcad139d6786f307a8c99c6111591e7daa2973b66757033a48e42d2a5768dcc0f9d0f41d7c')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

build() {
  cd ${pkgname}
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
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/usr/share/doc/cmake/html/_sources
  emacs -batch -f batch-byte-compile "${pkgdir}"/usr/share/emacs/site-lisp/cmake-mode.el
  install -Dm644 Copyright.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
