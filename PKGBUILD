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
pkgver=r3220.8d5a2b1bd
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards (git master)"
arch=('x86_64' 'i686')
url="https://librepcb.org/"
license=('GPL')
depends=(
  'glu'
  'hicolor-icon-theme'
  'muparser'
  'opencascade'
  'polyclipping'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols2'
  'qt5-svg'
  'quazip'
)
makedepends=(
  'git'
  'cmake'
  'pkg-config'
  'qt5-tools'
  'fontobene-qt5'
  'gtest'
)
provides=('librepcb')
conflicts=('librepcb')
source=('git+https://github.com/LibrePCB/LibrePCB')
md5sums=('SKIP')

build() {
  # Temporary build dir
  rm -rf "$srcdir/$_fullname-build"
  (cd "$srcdir/$_fullname" && git fetch)
  git clone --recursive "$srcdir/$_fullname" "$srcdir/$_fullname-build"
  cd "$srcdir/$_fullname-build"

  # Remove unbundled libs from source to ensure they're not used
  rm -rf libs/fontobene-qt5/
  rm -rf libs/muparser/
  rm -rf libs/polyclipping/
  rm -rf libs/quazip/
  rm -rf libs/googletest/

  # Remove bundled hoedown, it is not needed on Qt >=5.14
  rm -rf libs/hoedown/

  # Build
  cd "$srcdir/$_fullname-build"
  mkdir build && cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
    -DLIBREPCB_SHARE=/usr/share/librepcb \
    -DUNBUNDLE_FONTOBENE_QT5=1 \
    -DUNBUNDLE_MUPARSER=1 \
    -DUNBUNDLE_POLYCLIPPING=1 \
    -DUNBUNDLE_QUAZIP=1 \
    -DUNBUNDLE_GTEST=1
  make
}

check() {
  cd "$srcdir/$_fullname-build/build"

  # Run unit tests
  ./tests/unittests/librepcb-unittests
}

package() {
  cd "$srcdir/$_fullname-build/build"
  make install
}

pkgver() {
  cd "$srcdir/$_fullname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
