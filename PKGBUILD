# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-caffe
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r10.0.g92b50f4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (NVIDIA users only)(static libcaffe)(GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=172390'
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
             'gcc7'
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
  mkdir -p fakeroot

  # CUDA 9.x requires gcc7
  sed -e '/CUSTOM_CXX/s/^# //' \
      -e '/CUSTOM_CXX/s/$/-7/' \
      -i caffe/Makefile.config

  # set CUDA directory
  sed '/CUDA_DIR/s/\/usr\/local\/cuda/\/opt\/cuda/' -i caffe/Makefile.config

  # disable python
  sed -e '/PYTHON_INCLUDE/s/^P/# P/g' \
      -e '/PYTHON_LIB/s/^P/# P/g' \
      -i caffe/Makefile.config

  # set OpenBlas
  sed -e '/\/blas/s/^# //g' \
      -e '/^BLAS_INCLUDE/s/\/path\/to\/your\/blas/\$(shell pkg-config --cflags openblas)/g' \
      -e '/^BLAS_LIB/s/\/path\/to\/your\/blas/\$(shell pkg-config --libs-only-L openblas)/g' \
      -i caffe/Makefile.config

  # -- local
  sed -e 's| /usr/local/include||g' \
      -e 's| /usr/local/lib||g' \
      -i caffe/Makefile.config

  # use pkgconfig
  sed "s|+= openblas|+= \$(shell pkg-config --libs openblas \| sed 's\|-l\|\|g')|g" \
      -i caffe/Makefile

  cd waifu2x-caffe

  # use pkgconfig
  sed -e 's|-lopenblas|$(shell pkg-config --libs openblas)|g' \
      -e 's|-lcaffe|libcaffe.a|g' \
      -i Makefile.am

  # link static libcaffe
  sed 's|-lcaffe|libcaffe.a|g' \
      -i Makefile.am

  ./autogen.sh
}

build() {
  cd caffe
  make lib

  install -Dm644 build/lib/libcaffe.a "${srcdir}/waifu2x-caffe/libcaffe.a"
  cp -R include "${srcdir}/fakeroot"
  install -Dm644 build/src/caffe/proto/caffe.pb.h "${srcdir}/fakeroot/include/caffe/proto/caffe.pb.h"

  cd "${srcdir}/${_plug}"
  CXXFLAGS+=" -I${srcdir}/fakeroot/include" \
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install

  (cd Waifu2x-caffe/models; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/${i}"; done)
  chmod -R a+w "${pkgdir}/usr/lib/vapoursynth/models"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
