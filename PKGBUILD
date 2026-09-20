# Maintainer: Alexeyev Vitaly <vitamindbnfkz@gmail.com>
pkgname=synthos-git
_pkgname=synthos
pkgver=0.2.0.r375.g07d278e
pkgrel=1
pkgdesc="Local AI desktop studio: agentic chat, notes workspace, node editor for image/video/music/speech, code editor — on the native synaptix engine (git)"
arch=("x86_64")
url="https://github.com/VitaminDB/synthos"
license=("MIT" "Apache-2.0")

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
    "nvidia-utils: GPU-инференс (CUDA-драйвер грузится в рантайме)"
)
# makepkg.conf по умолчанию включает lto и добавляет -flto=auto в CFLAGS: C-код,
# который крейты собирают сами (встроенный SQLite у rusqlite), становится
# LTO-байткодом GCC, а rust-lld (линкер Rust по умолчанию с 1.90) его не читает —
# линковка падает на undefined symbol sqlite3_*. LTO самого Rust задаёт профиль
# release в Cargo.toml, от этой опции оно не зависит.
options=("!lto")
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname" "$_pkgname-bin")

# synthos path-зависит на соседние syngui и synaptix, и makepkg кладёт все три
# рядом в $srcdir — ровно та раскладка, которую ждут манифесты.
#
# Берётся master всех трёх, а не пины из packaging/deps.lock: пины описывают
# релиз по тегу и устаревают, как только master synthos переходит на новый API
# syngui. Master же пушится согласованно, и окно рассинхрона — минуты.
source=(
    "$_pkgname::git+$url.git"
    "syngui::git+https://github.com/VitaminDB/syngui.git"
    "synaptix::git+https://github.com/VitaminDB/synaptix.git"
)
sha256sums=("SKIP" "SKIP" "SKIP")

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
    # Без --all-features: в манифесте есть фичи android и testing, они здесь
    # только навредят. Без --frozen: Cargo.lock synthos не обязан совпадать с
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
    install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
