# Maintainer: tytan652 <tytan652@tytanium.xyz>

# I don't know if those options are useful but I give you the possibility to try out

## Build dlib with CUDA
ENABLE_CUDA=OFF

## Build dlib with which Basic Linear Algebra Subprograms
## Choice:
## - BLAS : use the package that provide `blas` ('blas'/'openblas') if none installed 'blas' will be installed
## - OpenBLAS : will just force 'openblas' to be installed and used
## - IntelMKL : will use Intel Math Kernel Library 'intel-mkl'
## - BuiltIn : will use the built-in BLAS
##
## dlib seems to indicate that OpenBLAS or IntelMKL will make your code run faster
## So I default it to OpenBLAS
USE_AS_BLAS=OpenBLAS

pkgname=obs-face-tracker
pkgver=0.5.0
pkgrel=1
pkgdesc="This plugin provide video filters for face detection and face tracking for mainly a speaking person"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/face-tracker.1294/"
license=("GPL2")
depends=("obs-studio")
makedepends=("cmake")
source=(
  "$pkgname::git+https://github.com/norihiro/obs-face-tracker.git#tag=$pkgver"
  "libvisca-ip::git+https://github.com/norihiro/libvisca-ip.git"
  "dlib::git+https://github.com/davisking/dlib.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

if [[ $ENABLE_CUDA == 'ON' ]]; then
  depends+=('cudnn')
fi

if [[ $USE_AS_BLAS == 'BLAS' ]]; then
  depends+=('cblas' 'lapack')
elif [[ $USE_AS_BLAS == 'OpenBLAS' ]]; then
  depends+=('openblas' 'cblas' 'lapack')
elif [[ $USE_AS_BLAS == 'IntelMKL' ]]; then
  depends+=('intel-mkl')
fi

prepare() {
  cd "$pkgname"
  git config submodule.libvisca.url $srcdir/libvisca-ip
  git submodule update

  cp -r $srcdir/dlib .
  cd dlib
  patch -Np1 < $srcdir/$pkgname/ci/common/dlib-cmake-no-openblasp.patch
}

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DDLIB_USE_CUDA=$ENABLE_CUDA
  make -C build
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install

  # Remove libvisca header to prevent possible conflict with any libvisca package
  rm -rf "$pkgdir"/usr/include
}
