# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.3.1
pkgrel=2
_silero_vad_commit=dbacf536adadf42210f37ae50fbaf75f6235b3cf
pkgdesc="Fcitx5 voice input addon with OpenAI-compatible and Volcengine Doubao ASR"
arch=('x86_64')
url="https://github.com/devcxl/fcitx5-voice-input"
license=('LGPL-3.0-only')
options=('!debug')
depends=(
    'fcitx5'
    'pipewire'
    'libpulse'
    'jsoncpp'
    'curl'
    'onnxruntime-cpu'
    'zlib'
)
optdepends=()
makedepends=('cmake' 'pkg-config' 'gettext')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/devcxl/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "silero_vad.onnx::https://raw.githubusercontent.com/snakers4/silero-vad/${_silero_vad_commit}/src/silero_vad/data/silero_vad.onnx"
)
sha256sums=(
    '159cc541069fca9ca75c936aecfd06d2612184358ffcaceaf432914acaba5e17'
    '1a153a22f4509e292a94e67d6f9b85e8deb25b4988682b7e174c65279d8788e3'
)

prepare() {
    install -Dm644 "${srcdir}/silero_vad.onnx" \
        "${srcdir}/${pkgname}-${pkgver}/third_party/silero-vad/src/silero_vad/data/silero_vad.onnx"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake --install build --prefix "${pkgdir}/usr"
}
