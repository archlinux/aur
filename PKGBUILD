# Maintainer: LFdev <lfdev+aur at envs dot net>

_pkgname='dsnote'
pkgname="${_pkgname}"
pkgver=4.4.0
pkgrel=1
pkgdesc="Note taking, reading and translating with offline Speech to Text, Text to Speech and Machine Translation"
arch=(
  'x86_64'
  'aarch64'
)
url="https://github.com/mkiol/dsnote"
license=('MPL2')
depends=(
  'boost-libs'
  'fmt'
  'hicolor-icon-theme'
  'kdbusaddons5'
  'kquickcharts5'
  'libarchive'
  'openblas'
  'perl'
  'python>=3.11'
  'qt5-base'
  'qt5-declarative'
  'qt5-x11extras'
  'qt5-multimedia'
  'qt5-quickcontrols2'
  'qqc2-desktop-style5'
  'rubberband'
  'taglib'
  'xz'
)
makedepends=(
  'boost'
  'cmake'
  'extra-cmake-modules'
  'git'
  'meson'
  'pybind11'
  'qt5-tools'
)
makedepends_x86_64=(
  'cuda'
  'rocm-hip-sdk'
)
optdepends=(
  'ocl-icd: Support for GPU acceleration with OpenCL'
  'python-accelerate: Support for Punctuation and Hebrew Diacritics restoration'
  'python-torchaudio: Support for Coqui TTS models'
  'python-transformers: Support for Punctuation and Hebrew Diacritics restoration'
  'tts: Support for Coqui TTS models'
)
optdepends_x86_64=(
  'cuda: Support for GPU acceleration on NVidia graphic cards'
  'cudnn: Support for GPU acceleration on NVidia graphic cards'
  'rocblas: Support for GPU acceleration on AMD graphic cards'
  'rocm-opencl-runtime: Support GPU acceleration on AMD graphic cards'
)
provides=(${_pkgname})
conflicts=(${_pkgname}-git)
install=${_pkgname}.install
source=(https://github.com/mkiol/dsnote/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('9b9aa92b0bc90870aac97ef14d9d31bd24f55b05b7e854cfd29fe84ba48c1f8f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  if [[ "${CARCH}" == "x86_64" ]]; then
    # fix for CUDA >= 12.3.0
    export HOST_COMPILER=/usr/bin/g++-12
    export CUDAHOSTCXX=/usr/bin/g++-12
    export CUDA_PATH=/opt/cuda
  fi
  mkdir -p build
  cd build
  cmake ../ -DCMAKE_BUILD_TYPE=Release -DWITH_DESKTOP=ON \
    -DWITH_PY=ON \
    -DBUILD_LIBARCHIVE=OFF \
    -DBUILD_FMT=OFF \
    -DBUILD_CATCH2=OFF \
    -DBUILD_OPENBLAS=OFF \
    -DBUILD_XZ=OFF \
    -DBUILD_PYBIND11=OFF \
    -DBUILD_RUBBERBAND=OFF \
    -DBUILD_FFMPEG=ON \
    -DBUILD_TAGLIB=OFF \
    -DBUILD_VOSK=OFF \
    -DBUILD_QQC2_BREEZE_STYLE=ON \
    -DDOWNLOAD_VOSK=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

  test $(nproc) -gt 2 && make -j$(($(nproc)-2)) || make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd build
  make DESTDIR="$pkgdir" install
}
