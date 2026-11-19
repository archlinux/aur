# Maintainer: Alexeyev Vitaly
pkgname=synthos-git
epoch=1
pkgver=0.2.322.r0
pkgrel=1
pkgdesc='Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — native synaptix engine on any NVIDIA sm_80+ GPU, .syn and GGUF models'
arch=('x86_64')
url='https://github.com/VitaminDB/synthos'
license=('GPL-3.0-only')
depends=('alsa-lib' 'fontconfig' 'vulkan-icd-loader' 'libxkbcommon' 'wayland' 'gtk3' 'libavutil.so=61-64' 'libavcodec.so=63-64' 'libavformat.so=63-64' 'libswscale.so=10-64' 'libswresample.so=7-64')
optdepends=('nvidia-utils: нейросети на видеокарте NVIDIA (драйвер CUDA грузится в рантайме)' 'cuda: компилятор ядер NVRTC — ядра собираются на лету под карту (sm_80+)' 'openvino-intel-npu-plugin: нейросети на Intel NPU' 'intel-npu-driver: драйвер Intel NPU' 'intel-npu-compiler: компилятор моделей для Intel NPU' 'synaptix: системная служба synaptixd — synthos делит с ней загруженные модели; без неё работает встроенный движок' 'synshell-ai: ассистент synshell — ставит службу synaptix, с которой synthos делит модели')
makedepends=('cargo' 'git' 'clang' 'pkgconf' 'cuda')
provides=(synthos)
conflicts=(synthos synthos-bin)
options=('!lto')
source=('synthos::git+https://github.com/VitaminDB/synthos.git' 'syngui::git+https://github.com/VitaminDB/syngui.git' 'synaptix::git+https://github.com/VitaminDB/synaptix.git' 'synshell::git+https://github.com/VitaminDB/synshell.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/synthos"
    local v
    v=$(git describe --tags --abbrev=0 2>/dev/null || echo v0.2.322)
    printf '%s.r%s.g%s' "${v#v}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/synthos"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/synthos"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR="$srcdir/target"
    export PATH="/opt/cuda/bin:$PATH"
    local _f=()
    [ "$CARCH" = aarch64 ] && _f=()
    cargo build --release --offline -p synthos --bin synthos "${_f[@]}"
}

package() {
    cd "$srcdir/synthos"
    CARGO_TARGET_DIR="$srcdir/target"
    install -Dm755 "$CARGO_TARGET_DIR/release/synthos" "$pkgdir/usr/bin/synthos"
    install -Dm644 'data/synthos.desktop' "$pkgdir/usr/share/applications/synthos.desktop"
    install -Dm644 'data/icons/synthos.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/synthos.svg"
    install -Dm644 'README.md' "$pkgdir/usr/share/doc/synthos/README.md"
    install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/synthos/LICENSE"
    install -Dm644 'LICENSE-COMMERCIAL.md' "$pkgdir/usr/share/licenses/synthos/LICENSE-COMMERCIAL.md"
    install -Dm644 'LICENSE-EXCEPTION.md' "$pkgdir/usr/share/licenses/synthos/LICENSE-EXCEPTION.md"
}
