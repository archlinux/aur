# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-caffe
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r14.1.g89f5401
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (NVIDIA users only)(static libcaffe)(GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=173673'
license=('MIT')
depends=('vapoursynth'
         'cuda'
         'boost-libs'
         'libopenblas'
         'google-glog'
         'gflags'
         'hdf5'
         'protobuf'
         'cudnn'
         'opencv'
         )
makedepends=('git'
             'boost'
             'gcc8'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Waifu2x-caffe.git"
        'git+https://github.com/HolyWu/caffe.git#branch=lltcggie/custom'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p fakeroot build

  # CUDA 10.1.x requires gcc8
  sed -e '/CUSTOM_CXX/s/^# //' \
      -e '/CUSTOM_CXX/s/$/-8/' \
      -i caffe/Makefile.config

  # set CUDA directory
  sed '/CUDA_DIR/s/\/usr\/local\/cuda/\/opt\/cuda/' \
      -i caffe/Makefile.config

  # -- local
  sed -e 's| /usr/local/include||g' \
      -e 's| /usr/local/lib||g' \
      -i caffe/Makefile.config

  cd "${_plug}"

  # rename models folder
  sed "s|models/|${_plug}-models/|g" -i Waifu2x-caffe/Waifu2x-caffe.cpp
}

build() {
  cd caffe
  make lib

  install -Dm644 build/lib/libcaffe.a "${srcdir}/fakeroot/lib/libcaffe.a"
  cp -R include "${srcdir}/fakeroot"
  install -Dm644 build/src/caffe/proto/caffe.pb.h "${srcdir}/fakeroot/include/caffe/proto/caffe.pb.h"

  cd "${srcdir}/build"


  CXXFLAGS+=' -fpermissive'
  arch-meson "../${_plug}" \
    -Dcudaincludedir=/opt/cuda/include \
    -Dcudalibdir=/opt/cuda/lib64 \
    -Dcaffe_includedir="$(readlink -e "${srcdir}/fakeroot/include")" \
    -Dcaffe_libdir="$(readlink -e "${srcdir}/fakeroot/lib")" \
    --buildtype=release \
    -Db_lto=false

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  mv "${pkgdir}/usr/lib/vapoursynth/models" "${pkgdir}/usr/lib/vapoursynth/${_plug}-models"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
