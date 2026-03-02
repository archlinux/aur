# Maintainer: Thomas Weißschuh <aur t-8ch de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=cmake-legacy
pkgver=3.31.11
pkgrel=1
pkgdesc='A cross-platform open-source make system (legacy release)'
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
makedepends=(git
             nlohmann-json
             python-sphinx
             qt6-base)
optdepends=(
  'make: for unix Makefile generator'
  'ninja: for ninja generator'
  'qt6-base: cmake-gui'
)
source=(git+https://gitlab.kitware.com/cmake/cmake.git#tag=v$pkgver?signed)
sha512sums=('e6febb04f3f466b7d1b32631e5dc1f899e9857b094b2520d69e5a4e9319a5ccbf030e9dee4c1455090e034a594b28df7b90106ab1a198d2580153fa000d599d5')
validpgpkeys=(CBA23971357C2E6590D9EFD3EC8FEF3A7BFB4EDA) # Brad King <brad.king@kitware.com>

build() {
  cd cmake
  ./bootstrap --prefix=/opt/cmake-legacy \
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
  cd cmake
  make DESTDIR="${pkgdir}" install

  rm -r "$pkgdir"/opt/cmake-legacy/share/doc/cmake/html/_sources
  install -Dm644 Copyright.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p "${pkgdir}"/usr/bin/
  ln -sr "${pkgdir}"/opt/cmake-legacy/bin/cmake "${pkgdir}"/usr/bin/cmake-legacy
}
