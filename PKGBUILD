# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
#
# PGP key is on keyservers. To import:
#
#     gpg --receive-keys 7EF3061F5C8D5E25
#
# See https://wiki.archlinux.org/index.php/Makepkg#Signature_checking
# for more details # on package signing.
pkgname=librepcb
pkgver=0.1.6
_pkgver=${pkgver/_/-}
pkgrel=3
pkgdesc="A free EDA software to develop printed circuit boards"
arch=('x86_64' 'i686')
url="https://librepcb.org/"
license=('GPL')
depends=(
  'qt5-svg'
  'hicolor-icon-theme'
  'muparser'
  'polyclipping'
  'quazip'
)
makedepends=(
  'cmake'
  'pkg-config'
  'qt5-tools'
  'fontobene-qt5'
)
source=(
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip"
  "https://download.librepcb.org/releases/${_pkgver}/librepcb-${_pkgver}-source.zip.asc"
  "cmake-muparser-fix.patch"
)
sha256sums=(
  '8c7bf475ed59eb5b5e4b13073b96b9468ee01fb6980ef2b3471b1fbb39c46721'
  'SKIP'
  'a59a830a77f7401c5dea02172eaee54ba40953b04404a393cf2314e4002410eb'
)
validpgpkeys=('D6F9AF572228C5BCD6B538407EF3061F5C8D5E25')

prepare() {
  cd "${srcdir}/librepcb-${_pkgver}/"

  # Patch muparser include path
  sed -i 's/muparser\/include\/muParser.h/muParser.h/' libs/librepcb/common/utils/mathparser.cpp

  # Apply CMake fix (https://github.com/LibrePCB/LibrePCB/pull/970)
  patch -p1 < "${srcdir}/cmake-muparser-fix.patch"
}

build() {
  cd "${srcdir}/librepcb-${_pkgver}/"

  # Remove unbundled libs from source to ensure they're not used
  rm -rf libs/fontobene-qt5/
  rm -rf libs/muparser/
  rm -rf libs/polyclipping/
  rm -rf libs/quazip/

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
    -DUNBUNDLE_QUAZIP=1
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
