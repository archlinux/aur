# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren
# Contributor: Fredrick Brennan <admin@8chan.co>
# Contributor: Julien Machiels

pkgname=waifu2x-converter-cpp-cuda-git
pkgver=5.3.4.2.g57520b2
pkgrel=2
pkgdesc="Image Super-Resolution for Anime-Style-Art. (re-implementation in C++ using OpenCV). with CUDA support (GIT Version)"
arch=('x86_64')
url='https://github.com/DeadSix27/waifu2x-converter-cpp'
license=('MIT')
depends=(
  'gcc-libs' # libgcc_s.so libstdc++.so
  'glibc' # libc.so libm.so
  'opencv-cuda' # libopencv_core.so libopencv_imgcodecs.so libopencv_imgproc.so
  'cuda'
  'opencl-icd-loader'
)
makedepends=(
  'cmake'
  'git'
  'opencl-headers'
)
provides=(
  'waifu2x-converter-cpp'
  'libw2xc.so'
)
conflicts=('waifu2x-converter-cpp')
source=(
  'git+https://github.com/DeadSix27/waifu2x-converter-cpp.git'
  'https://patch-diff.githubusercontent.com/raw/DeadSix27/waifu2x-converter-cpp/pull/267.diff'
)
sha256sums=(
  'SKIP'
  'e1a630b22ad9520dcfdbe22fe44cf640def66ceaec626b41d3994ce077a539b3'
)
options=('debug')

pkgver() {
  cd waifu2x-converter-cpp
  echo $(git describe --long --tags | tr - . | tr -d v)
}

prepare() {
  patch -d waifu2x-converter-cpp -p1 -i "${srcdir}/267.diff"
}

build() {

  cmake -S waifu2x-converter-cpp -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCUDA_NVCC_FLAGS="-D_Float32=__Float32;-D_Float64=__Float64;-D_Float128=__Float128;-D_Float32x=__Float32x;-D_Float64x=__Float64x" \
    -DCUDA_HOST_COMPILER=/opt/cuda/bin/gcc \
    -DINSTALL_MODELS=ON \
    -DOPENCV_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 waifu2x-converter-cpp/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
