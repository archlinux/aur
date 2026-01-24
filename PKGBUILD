# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb
pkgver=2.0.0_rc1
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="A free EDA software to develop printed circuit boards"
arch=('x86_64' 'i686')
url="https://librepcb.org/"
license=('GPL-3.0-or-later')
depends=(
  'glu'
  'hicolor-icon-theme'
  'muparser'
  'opencascade'
  'polyclipping'
  'qt6-base'
  'qt6-svg'
)
makedepends=(
  'cmake'
  'pkg-config'
  'qt6-tools'
  'fontobene-qt-qt6'
  'gtest'
  'rust'
  'cargo'
)
source=(
  "https://download.librepcb.org/releases/$_pkgver/librepcb-$_pkgver-source.zip"
  "https://download.librepcb.org/releases/$_pkgver/librepcb-$_pkgver-source.zip.asc"
)
sha256sums=(
  'a43180284ee4c411c5c6d940143c163a701b694a345d46a422bd37d6f5255fdd'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

prepare() {
  cd "$srcdir/$pkgname-$_pkgver/"

  # Remove unbundled libs from source to ensure they're not used
  rm -rf libs/fontobene-qt/
  rm -rf libs/muparser/
  rm -rf libs/polyclipping/
  rm -rf libs/googletest/
}

build() {
  # Remove build cache
  rm -rf "$srcdir/build"

  # Build
  cmake -B build -S "$pkgname-$_pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLIBREPCB_SHARE=/usr/share/librepcb \
    -DUNBUNDLE_FONTOBENE_QT=1 \
    -DUNBUNDLE_MUPARSER=1 \
    -DUNBUNDLE_POLYCLIPPING=1 \
    -DUNBUNDLE_GTEST=1 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
