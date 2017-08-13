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

  if [ "$(nvcc --version | tail -1 | cut -d ' ' -f5 | tr -d ,)" != "9.0" ]; then
    # use gcc5 (CUDA 8.0 requires gcc5)
    sed -e '/CUSTOM_CXX/s/^# //' \
           '/CUSTOM_CXX/s/$/-5/' \
           -i Makefile.config
  fi

  # set CUDA directory
  sed '/CUDA_DIR/s/\/usr\/local\/cuda/\/opt\/cuda/' -i Makefile.config

  # set OpenBLAS as the BLAS provider and adjust its directories
  sed -e '/BLAS_INCLUDE := \/path/s/^# //' \
      -e '/^BLAS_INCLUDE/s/\/path\/to\/your\/blas/\/usr\/include\/openblas/' \
      -e '/BLAS_LIB := \/path/s/^# //' \
      -e '/^BLAS_LIB/s/\/path\/to\/your\/blas/\/usr\/lib/' \
      -i Makefile.config

  # disable python
  sed -e '/PYTHON_INCLUDE/s/^P/# P/g' \
      -e '/PYTHON_LIB/s/^P/# P/g' \
      -i Makefile.config

  cd ../waifu2x-caffe
  ./autogen.sh
}

build() {
  cd caffe
  if [ "$(nvcc --version | tail -1 | cut -d ' ' -f5 | tr -d ,)" != "9.0" ]; then
    export CXXFLAGS="${CXXFLAGS//-fno-plt/}"
  fi
  make lib --trace

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
