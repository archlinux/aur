# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-caffe
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=14.1.g89f5401
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (NVIDIA users only)(static libcaffe)(GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173673'
license=('MIT')
depends=(
  'vapoursynth'
  'boost-libs' 'libboost_iostreams.so'
  'openblas'
  'google-glog'
  'gflags'
  'hdf5'
  'protobuf'
  'cudnn'
  'opencv'
  'nvidia-utils'
  'abseil-cpp'
)
makedepends=(
  'git'
  'boost'
  'meson'
  'cuda'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "${_plug}::git+https://github.com/sl1pkn07/VapourSynth-Waifu2x-caffe.git"
  'git+https://github.com/sl1pkn07/caffe.git#branch=lltcggie/custom'
)
sha256sums=(
  'SKIP'
  'SKIP'
)
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p fakeroot

  # CUDA 11.6.x not support compute_30/35/37 (Kepler boards)
  # CUDA 11.6.x add support to new boards (Ampere boards)
  sed -e 's|-gencode arch=compute_30,code=sm_30||g' \
      -e 's|-gencode arch=compute_35,code=sm_35||g' \
      -e 's|-gencode arch=compute_37,code=sm_37||g' \
      -e 's|code=compute_75|code=sm_75 \\\n\t\t-gencode arch=compute_80,code=sm_80 \\\n\t\t-gencode arch=compute_86,code=sm_86 \\\n\t\t-gencode arch=compute_87,code=compute_87|g' \
      -i caffe/Makefile.config

  # set CUDA directory
  sed '/CUDA_DIR/s/\/usr\/local\/cuda/\/opt\/cuda/' \
      -i caffe/Makefile.config

  # -- local
  sed -e 's| /usr/local/include||g' \
      -e 's| /usr/local/lib||g' \
      -i caffe/Makefile.config

  # Disable cuDNN due a not already support cuDNN 8
  sed -e '/USE_CUDNN/s/^/#/' \
      -i caffe/Makefile.config

  # c++11 -> c++17
  sed 's|c++11|c++17|g' \
      -i caffe/Makefile

  cd "${_plug}"

  # rename models folder
  sed "s|models/|${_plug}-models/|g" -i Waifu2x-caffe/Waifu2x-caffe.cpp
}

build() {
  cd caffe
  NVCC_APPEND_FLAGS="-Wno-deprecated-gpu-targets -D_Float32=__Float32 -D_Float64=__Float64 -D_Float128=__Float128 -D_Float32x=__Float32x -D_Float64x=__Float64x" \
  make lib

  install -Dm644 build/lib/libcaffe.a "${srcdir}/fakeroot/lib/libcaffe.a"
  cp -R include "${srcdir}/fakeroot"
  install -Dm644 build/src/caffe/proto/caffe.pb.h "${srcdir}/fakeroot/include/caffe/proto/caffe.pb.h"

  cd "${srcdir}"
  CXXFLAGS+=' -fpermissive -std=c++17'
  arch-meson "${_plug}" build \
    -Dcudaincludedir=/opt/cuda/include \
    -Dcudalibdir=/opt/cuda/lib64 \
    -Dcaffe_includedir="$(readlink -e "${srcdir}/fakeroot/include")" \
    -Dcaffe_libdir="$(readlink -e "${srcdir}/fakeroot/lib")" \
    --buildtype=release \
    -Db_lto=false

  meson compile -C build
}

package(){
  DESTDIR="${pkgdir}" meson install -C build

  mv "${pkgdir}/usr/lib/vapoursynth/models" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
