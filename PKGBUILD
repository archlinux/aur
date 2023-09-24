# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb
pkgver=1.0.0
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A free EDA software to develop printed circuit boards"
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
  'qt5-svg'
  'quazip'
)
makedepends=(
  'cmake'
  'pkg-config'
  'qt5-tools'
  'fontobene-qt5'
  'gtest'
)
source=(
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip"
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip.asc"
)
sha256sums=(
  '1bc57489367c8e0fafe23a88a6677c6c73d8f4cac3f2f9caa2f306dca0e70e0b'
  'SKIP'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

prepare() {
  cd "${srcdir}/librepcb-${_pkgver}/"
}

build() {
  cd "${srcdir}/librepcb-${_pkgver}/"

  # Remove unbundled libs from source to ensure they're not used
  rm -rf libs/fontobene-qt5/
  rm -rf libs/muparser/
  rm -rf libs/polyclipping/
  rm -rf libs/quazip/
  rm -rf libs/googletest/

  # Remove bundled hoedown, it is not needed on Qt >=5.14
  rm -rf libs/hoedown/

  # Build
  mkdir -p build && cd build
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
  cd "${srcdir}/librepcb-${_pkgver}/build/"

  # Run unit tests
  ./tests/unittests/librepcb-unittests
}

package() {
  cd "${srcdir}/librepcb-${_pkgver}/build/"
  make install
}

# vim:set ts=2 sw=2 et:
