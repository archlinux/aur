# Maintainer: LFdev <lfdev+aur at envs dot net>

_pkgname='dsnote'
pkgname="${_pkgname}-git"
pkgver=r710.30e1fcc
pkgrel=1
pkgdesc="Note taking, reading and translating with offline Speech to Text, Text to Speech and Machine Translation"
arch=('x86_64')
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
  'cuda'
  'extra-cmake-modules'
  'git'
  'meson'
  'pybind11'
  'qt5-tools'
  'rocm-hip-sdk'
)
optdepends=(
  'cuda: Support for GPU acceleration on NVidia graphic cards'
  'cudnn: Support for GPU acceleration on NVidia graphic cards'
  'ocl-icd: Support for GPU acceleration with OpenCL'
  'python-accelerate: Support for Punctuation and Hebrew Diacritics restoration'
  'python-torchaudio: Support for Coqui TTS models'
  'python-transformers: Support for Punctuation and Hebrew Diacritics restoration'
  'rocblas: Support for GPU acceleration on AMD graphic cards'
  'rocm-opencl-runtime: Support GPU acceleration on AMD graphic cards'
  'tts: Support for Coqui TTS models'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
install=${_pkgname}.install
source=(git+https://github.com/mkiol/dsnote.git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  # fix for CUDA >= 12.3.0
  export HOST_COMPILER=/usr/bin/g++-12
  export CUDAHOSTCXX=/usr/bin/g++-12
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
  make -j$(($(nproc)-2))
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build
  make DESTDIR="$pkgdir" install
}
