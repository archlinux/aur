# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-caffe
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r8.1.0.gcbc577f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (NVIDIA users only)(GIT version)"
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
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           'caffe'
           )
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Waifu2x-caffe.git"
        'git+https://github.com/HolyWu/caffe.git'
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
  cd caffe
  # use gcc5 (CUDA code requires gcc5)
  sed '/CUSTOM_CXX/s/^#[[:space:]]//;/CUSTOM_CXX/s/$/-5/' -i Makefile.config

  # set CUDA directory
  sed '/CUDA_DIR/s/\/usr\/local\/cuda/\/opt\/cuda/' -i Makefile.config

  # set OpenBLAS as the BLAS provider and adjust its directories
  sed "s|# BLAS_INCLUDE := /path/to/your/blas|BLAS_INCLUDE := "/usr/include/openblas"|" -i Makefile.config
  sed "s|# BLAS_LIB := /path/to/your/blas|BLAS_LIB := "/usr/lib"|" -i Makefile.config

  # disable python
  sed -e '/PYTHON_INCLUDE/s/P/# P/g' \
      -e '/PYTHON_LIB/s/P/# P/g' \
      -e 's|# #|#|g' \
      -e 's|(# |(|g' \
      -i Makefile.config

  cd ../waifu2x-caffe
  ./autogen.sh
}

build() {

  cd caffe

  make lib
  cp -R build/lib "${srcdir}/fakeroot"
  cp -R include "${srcdir}/fakeroot"
  install -Dm644 build/src/caffe/proto/caffe.pb.h ${srcdir}/fakeroot/include/caffe/proto/caffe.pb.h

  cd "../${_plug}"
  CXXFLAGS+=" -I${srcdir}/fakeroot/include" \
  LDFLAGS+=" -L${srcdir}/fakeroot/lib" \
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth \

  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install

  (cd Waifu2x-caffe/models; for i in $(find . -type f); do install -Dm644 "${i}" "${pkgdir}/usr/lib/vapoursynth/models/${i}"; done)
  chmod -R a+w "${pkgdir}/usr/lib/vapoursynth/models"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_plug}/LICENSE"

  install -Dm755 ${srcdir}/fakeroot/lib/libcaffe.so.1.0.0-rc3 ${pkgdir}/usr/lib/libcaffe.so.1.0.0-rc3
  (cd ${pkgdir}/usr/lib/; ln -s libcaffe.so.1.0.0-rc3 libcaffe.so)
}
