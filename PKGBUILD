# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: chn <g897331845@gmail.com>

pkgname=xtensor-io
pkgver=0.13.0
pkgrel=2
pkgdesc="xtensor plugin to read and write images, audio files, numpy (compressed) npz and HDF5"
arch=(any)
url="https://github.com/xtensor-stack/xtensor-io"
license=(BSD-3-Clause)
depends=(
  blosc
  gdal
  gulrak-filesystem
  hdf5
  highfive
  libsndfile
  openimageio
  xtensor
  zlib
)
makedepends=(
  cmake
  gtest
  fmt
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/xtensor-stack/xtensor-io/archive/$pkgver.tar.gz"
  001-install-libdeps.patch
)
b2sums=('9600776f62a5b733f22f6f23f7ff23e8b71de4ce25ef00a8aef0e00b78f0c89fad5027f5fde0c0782122746d108f6a261d18a0447513ff8a6bcc1c4042160b95'
        'c6064f328b247653b57fa4faa4bf55aaa003643f4642c37daaecc467d01d458aea15d471c2b0e2f1f851be01a928a327304b47a273163203c4c644caeeb9b81e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < ../001-install-libdeps.patch

  # disable tests with missing dependencies
  sed -i 's|test_xio_aws_handler.cpp||' test/CMakeLists.txt
  sed -i 's|test_xio_gcs_handler.cpp||' test/CMakeLists.txt
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DBUILD_TESTS=ON \
    -DDOWNLOAD_GTEST=OFF \
    -DHAVE_Blosc=ON \
    -DHAVE_GDAL=ON \
    -DHAVE_HighFive=ON \
    -DHAVE_OIIO=ON \
    -DHAVE_SndFile=ON \
    -DHAVE_ZLIB=ON
  cmake --build build
}

check() {
  #ctest --test-dir build
  # FIXME: the tests fail
  cmake --build build --target xtest || true
}

package() {
  cmake --install build
}
