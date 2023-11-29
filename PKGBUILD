# Maintainer: tytan652 <tytan652@tytanium.xyz>

### I don't know if those options are useful but I give you the possibility to try out
### NOTE: Some AUR helper may not like to change it just before building, so you can set those variables in your makepkg config.
### Related wiki page: https://wiki.archlinux.org/title/Makepkg#Configuration

## Build dlib with CUDA
if [[ -z "$OBS_FT_ENABLE_CUDA" ]]; then
  OBS_FT_ENABLE_CUDA=OFF
fi

## Build dlib with which Basic Linear Algebra Subprograms
## Choice:
## - BLAS : use the package that provide `blas` ('blas'/'blas-openblas') if none installed 'blas' will be installed
## - OpenBLAS : will just force 'blas-openblas' to be installed and used
## - IntelMKL : will use Intel Math Kernel Library 'intel-mkl'
## - BuiltIn : will use the built-in BLAS
##
## dlib seems to indicate that OpenBLAS or IntelMKL will make your code run faster
## So I default it to OpenBLAS
if [[ -z "$OBS_FT_USE_AS_BLAS" ]]; then
  OBS_FT_USE_AS_BLAS=OpenBLAS
fi

pkgname=obs-face-tracker
pkgver=0.7.1
pkgrel=1
epoch=1
pkgdesc="This plugin provide video filters for face detection and face tracking for mainly a speaking person"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/face-tracker.1294/"
license=("GPL2")
depends=("obs-studio>=28" "glibc" "gcc-libs" "qt6-base")
makedepends=("cmake" "git")
optdepends=("obs-face-tracker-dlib-models-git: Trained CNN model")
options=('debug')
source=(
  "$pkgname::git+https://github.com/norihiro/obs-face-tracker.git#tag=$pkgver"
  "libvisca-ip::git+https://github.com/norihiro/libvisca-ip.git"
  "dlib::git+https://github.com/norihiro/dlib.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

if [[ $OBS_FT_ENABLE_CUDA == 'ON' ]]; then
  depends+=('cudnn')
fi

if [[ $OBS_FT_USE_AS_BLAS == 'BLAS' ]]; then
  depends+=('blas' 'cblas' 'lapack')
elif [[ $OBS_FT_USE_AS_BLAS == 'OpenBLAS' ]]; then
  depends+=('blas-openblas' 'openblas')
elif [[ $OBS_FT_USE_AS_BLAS == 'IntelMKL' ]]; then
  depends+=('intel-mkl')
fi

prepare() {
  cd "$pkgname"
  git config submodule.dlib.url $srcdir/dlib
  git config submodule.libvisca.url $srcdir/libvisca-ip
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"
  cmake -B build \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DDLIB_USE_CUDA=$OBS_FT_ENABLE_CUDA \
  -DENABLE_DATAGEN=ON

  make -C build
  
  mkdir -p data/dlib_hog_model
  ./build/face-detector-dlib-hog-datagen > data/dlib_hog_model/frontal_face_detector.dat
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir/" install

  # Remove libvisca header to prevent possible conflict with any libvisca package
  rm -rf "$pkgdir"/usr/include
}
