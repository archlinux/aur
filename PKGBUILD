# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=synthos-git
_pkgname=synthos
# epoch=1: с 20.09 по 23.09.2026 версией был голый номер сборки (268…278), и
# для pacman 278 > 0.2.278 — без epoch переход на 0.2.x считался бы откатом.
epoch=1
pkgver=0.2.287.r468.ge62f363
pkgrel=1
pkgdesc="Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — native synaptix engine on any NVIDIA sm_80+ GPU, .syn and GGUF models (git)"
arch=("x86_64")
url="https://github.com/VitaminDB/synthos"
license=("GPL-3.0-only")

depends=(
    "alsa-lib"
    "fontconfig"
    "vulkan-icd-loader"
    "libxkbcommon"
    "wayland"
    "gtk3"
    "ffmpeg"
)
# nvcc читается на этапе сборки, чтобы зафиксировать версию CUDA API; сам
# драйвер грузится динамически в рантайме.
makedepends=(
    "git"
    "rust"
    "cuda"
    "pkgconf"
    "clang"
)
optdepends=(
    "nvidia-utils: нейросети на видеокарте NVIDIA (драйвер CUDA грузится в рантайме)"
    "cuda: компилятор ядер NVRTC — ядра собираются на лету под карту (sm_80+)"
    "openvino-intel-npu-plugin: нейросети на Intel NPU"
    "intel-npu-driver: драйвер Intel NPU"
    "intel-npu-compiler: компилятор моделей для Intel NPU"
    "synaptix: системная служба synaptixd — synthos подключается к ней и делит загруженные модели с synshell; без неё работает свой встроенный движок"
    "synshell-ai: ассистент synshell — ставит службу synaptix, с которой synthos делит модели"
)
# makepkg.conf по умолчанию включает lto и добавляет -flto=auto в CFLAGS: C-код,
# который крейты собирают сами (встроенный SQLite у rusqlite), становится
# LTO-байткодом GCC, а rust-lld (линкер Rust по умолчанию с 1.90) его не читает —
# линковка падает на undefined symbol sqlite3_*. LTO самого Rust задаёт профиль
# release в Cargo.toml, от этой опции оно не зависит.
options=("!lto")
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname" "$_pkgname-bin")

# synthos path-зависит на соседние syngui, synaptix и synshell (встроенный
# движок synaptixd, ассистент, заметки), и makepkg кладёт все четыре рядом в
# $srcdir — ровно та раскладка, которую ждут манифесты.
#
# Берётся master всех четырёх, а не пины из packaging/deps.lock: пины описывают
# релиз по тегу и устаревают, как только master synthos переходит на новый API
# syngui. Master же пушится согласованно, и окно рассинхрона — минуты.
source=(
    "$_pkgname::git+$url.git"
    "syngui::git+https://github.com/VitaminDB/syngui.git"
    "synaptix::git+https://github.com/VitaminDB/synaptix.git"
    "synshell::git+https://github.com/VitaminDB/synshell.git"
)
sha256sums=("SKIP" "SKIP" "SKIP" "SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    local ver
    ver="$(grep -m1 '^pkgver=' packaging/PKGBUILD | cut -d= -f2)"
    printf "%s.r%s.g%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # Фичи по умолчанию: встроенный движок (engine) с CUDA и NPU — служба
    # synaptixd не нужна. Без --all-features: в манифесте есть фичи android и
    # testing, они здесь только навредят. Без --frozen: Cargo.lock synthos не обязан совпадать с
    # версиями крейтов на master syngui/synaptix.
    cargo build --release -p synthos
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "target/release/synthos" "$pkgdir/usr/bin/synthos"
    install -Dm644 "packaging/synthos.desktop" \
        "$pkgdir/usr/share/applications/synthos.desktop"
    install -Dm644 "packaging/synthos.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/synthos.svg"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE LICENSE-COMMERCIAL.md LICENSE-EXCEPTION.md -t "$pkgdir/usr/share/licenses/$pkgname/"
}
