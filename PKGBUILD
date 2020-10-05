# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb-git
_fullname=LibrePCB
pkgver=r2138.cf036e027
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards (git master)"
arch=('x86_64' 'i686')
url="http://librepcb.org/"
license=('GPL')
depends=(
  'desktop-file-utils' 'hicolor-icon-theme' 'qt5-base' 'qt5-svg'
  'quazip' 'polyclipping'
)
makedepends=('git' 'qt5-tools' 'fontobene-qt5')
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
  qmake -r ../librepcb.pro \
    PREFIX="${pkgdir}/usr" \
    CONFIG+=release \
    UNBUNDLE+=quazip \
    UNBUNDLE+=polyclipping \
    UNBUNDLE+=fontobene-qt5

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
