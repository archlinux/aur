# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb
pkgver=1.3.0
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
  'qt6-declarative'
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
  "https://download.librepcb.org/releases/$pkgver/librepcb-$pkgver-source.zip"
  "https://download.librepcb.org/releases/$pkgver/librepcb-$pkgver-source.zip.asc"
)
sha256sums=(
  '0c5313142ab3d689fc998ea432eb86a41d7c010e6dd5a70a633eaba0bcf75845'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/"

  # Remove unbundled libs from source to ensure they're not used
  rm -rf libs/fontobene-qt/
  rm -rf libs/muparser/
  rm -rf libs/polyclipping/
  rm -rf libs/googletest/

  # Remove bundled hoedown, it is not needed on Qt >=5.14
  rm -rf libs/hoedown/

}

build() {
  # Remove build cache
  rm -rf "$srcdir/build"

  # Build
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLIBREPCB_SHARE=/usr/share/librepcb \
    -DQT_MAJOR_VERSION=6 \
    -DUNBUNDLE_FONTOBENE_QT=1 \
    -DUNBUNDLE_MUPARSER=1 \
    -DUNBUNDLE_POLYCLIPPING=1 \
    -DUNBUNDLE_GTEST=1 \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
