# Maintainer: tiziodcaio
# Contributor: Tomoyo

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-openblas"
pkgver=1.9.2
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++ (with openblas run-time)"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/ggml-org/whisper.cpp"
license=("MIT")
depends=('ggml' 'openblas' 'sdl2-compat')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'git'
)
source=(
  "${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable-deprecated.patch
)

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-deprecated.patch"
}

build() {
  cmake \
    -B "${srcdir}/build" \
    -S "${srcdir}/${_pkgbase}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_USE_SYSTEM_GGML=ON \
    -DWHISPER_COMMON_FFMPEG=yes \
    -DWHISPER_SDL2=1 \
    -DWHISPER_BUILD_SERVER=0 \
    -DWHISPER_BUILD_TESTS=0

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  cp -r "${srcdir}/build/bin" "${pkgdir}/usr"
  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('a6abd064fcca8b85e794d205abf328c522e9451db43a3eadc178b883b7d0e9cd'
            '5f880edae417c7083a9403260e5c381285e4c52ccc39f127c6510fdfa249c1ad')
