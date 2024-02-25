# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=openjpeg2
pkgname="lib32-${_pkgbasename}"
pkgver=2.5.0
pkgrel=2
pkgdesc="An open source JPEG 2000 codec, version ${pkgver}"
arch=('x86_64')
license=('BSD')
url="http://www.openjpeg.org"
makedepends=(
  'cmake'
)
depends=(
  "${_pkgbasename}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libpng' 
  'lib32-libtiff'
  'lib32-lcms2'
  'lib32-zlib'
)
source=("$_pkgbasename-$pkgver.tar.gz::https://github.com/uclouvain/openjpeg/archive/v${pkgver}.tar.gz")
sha256sums=('0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a')

prepare() {
  mkdir -p build

  # Patching if needed
}
build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd build

  cmake "../openjpeg-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENJPEG_INSTALL_LIB_DIR=lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=OFF \
    -DBUILD_DOC=off

  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install

  # removing unneeded files and folders
  rm -rf "${pkgdir}/usr/"{bin,include}

  # installing license
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${_pkgbasename}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
