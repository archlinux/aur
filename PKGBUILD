# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=librepcb-git
_fullname=LibrePCB
pkgver=r2012.96548282f
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards (git master)"
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'qt5-base' 'qt5-svg')
makedepends=('git')
provides=('librepcb')
conflicts=('librepcb')
source=('git+https://github.com/LibrePCB/LibrePCB')
md5sums=('SKIP')

build() {
  # Temporary build dir
  rm -rf "$srcdir/$_fullname-build"
  git clone --recursive "$srcdir/$_fullname" "$srcdir/$_fullname-build"
  cd "$srcdir/$_fullname-build"

  # Prepare
  cd "$srcdir/$_fullname-build"
  mkdir build && cd build
  qmake -r ../librepcb.pro PREFIX="${pkgdir}/usr"

  # Compile
  make
}

package() {
  cd "$srcdir/$_fullname-build/build"
  make install

  # Install development utils
  install -s -m 755 \
    "output/uuid-generator" \
    "${pkgdir}/usr/bin/librepcb-uuid-generator"
}

pkgver() {
  cd "$srcdir/$_fullname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
