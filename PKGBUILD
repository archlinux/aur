# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

_pkgbasename=openjpeg2
pkgname="lib32-${_pkgbasename}"
pkgver=2.5.4
pkgrel=1
pkgdesc="An open source JPEG 2000 codec, version ${pkgver}"
arch=('x86_64')
license=('BSD-2-Clause' 'MIT')
url="http://www.openjpeg.org"
makedepends=(
  'cmake'
  'graphviz'
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
sha256sums=('a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a')

prepare() {
  mkdir -p build

  # Remove all third party libraries just to be sure
  find openjpeg-"${pkgver}"/thirdparty/ -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} \;

  # Patching if needed
}
build() {
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cmake -B build -S openjpeg-"${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_STATIC_LIBS=OFF \
    -DBUILD_DOC=off

  VERBOSE=1 cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # removing unneeded files and folders
  rm -rf "${pkgdir}/usr/"{bin,include}

  # installing license
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${_pkgbasename}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
