# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.6.1
pkgrel=1
# 上游不再随 release 提供源码压缩包，改用 tag 归档；该归档不含
# third_party/silero-vad 子模块，故单独拉取模型文件并在 prepare() 中回填。
_silero_vad_commit=dbacf536adadf42210f37ae50fbaf75f6235b3cf
pkgdesc="Fcitx5 voice input addon with OpenAI-compatible and Volcengine Doubao ASR"
arch=('x86_64')
url="https://github.com/devcxl/fcitx5-voice-input"
license=('LGPL-3.0-or-later')
options=('!debug')
depends=(
    'fcitx5'
    'jsoncpp'
    'curl'
    'onnxruntime-cpu'
    'zlib'
    'libpulse'
)
# PipeWire 为 PulseAudio 基线失败时的可选直连回退。
optdepends=(
    'pipewire: PipeWire direct capture fallback backend'
)
makedepends=('cmake' 'pkg-config' 'gettext' 'pipewire')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/devcxl/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
    "silero_vad.onnx::https://raw.githubusercontent.com/snakers4/silero-vad/${_silero_vad_commit}/src/silero_vad/data/silero_vad.onnx"
)
sha256sums=(
    'e2057af375dd8c07993941e991fd4c6cc4b43daccd162327372157c577c64c52'
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
