# Maintainer: Xiaoxu Guo <shimo11370 at proton dot me>
# Contributor: mizorewww (upstream course2md-gui-bin packaging)
# SPDX-License-Identifier: 0BSD
pkgname=course2md-gui-slides
pkgver=1.7.0
pkgrel=1
pkgdesc='Native course video notes GUI with per-conversion screenshot controls'
arch=('x86_64')
url='https://github.com/mizorewww/course2md'
license=('MIT' 'Apache-2.0')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'gcc-libs' 'glibc' 'libgit2'
         'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'openssl'
         'vulkan-icd-loader' 'wayland')
makedepends=('rust' 'clang' 'cmake' 'git' 'pkgconf' 'python')
optdepends=('yt-dlp: online video downloads'
            'llama-cpp: local GPU and CPU speech recognition')
provides=("course2md-gui=$pkgver")
conflicts=('course2md-gui' 'course2md-gui-bin')
# Upstream release profiles already strip debug information and set Rust LTO.
options=('!debug' '!lto')

# Match upstream v1.7.0 and desktop/sources.lock.json.
_course2md_rev=6881a1bac0df0010d72c85367c09474791a5fb82
_zed_rev=5a9b9558db01a6b906cec2fb70a797affdc58cdd
_gpui_component_rev=5f5ba08d35c9fb6f42d81a7aff7edba61ba3bc6b
source=("course2md-upstream::git+$url.git#commit=$_course2md_rev"
        "zed::git+https://github.com/zed-industries/zed.git#commit=$_zed_rev"
        "gpui-component::git+https://github.com/longbridge/gpui-component.git#commit=$_gpui_component_rev"
        'slide-controls.patch'
        'course2md.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '317ea0fc21e6861de27a4360296d620cfd2aa6ec189d47e90e730a483dc7ac61'
            '8bed829e281c7a92378f39b5fd384adf8ca8fad56cce2eb701285843dede3e2c')

prepare() {
    cd "$srcdir/course2md-upstream"
    patch -Np1 -i "$srcdir/slide-controls.patch"
    python desktop/scripts/sources.py --locked --developer-dir "$srcdir"
    cargo fetch --locked
    cargo fetch --locked --manifest-path desktop/Cargo.toml
}

build() {
    cd "$srcdir/course2md-upstream"
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"
    cargo build --release --frozen
    cargo build --release --frozen --manifest-path desktop/Cargo.toml
}

check() {
    cd "$srcdir/course2md-upstream"
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix=${srcdir}=/usr/src/debug/${pkgname}"
    cargo test --release --frozen --lib
    cargo test --release --frozen --test cli_ux
    cargo test --release --frozen --manifest-path desktop/Cargo.toml
}

package() {
    cd "$srcdir/course2md-upstream"
    install -Dm755 "$srcdir/target/release/course2md-desktop" "$pkgdir/usr/lib/course2md-desktop/course2md-desktop"
    install -Dm755 "$srcdir/target/release/course2md" "$pkgdir/usr/lib/course2md-desktop/course2md"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/course2md-desktop/course2md-desktop "$pkgdir/usr/bin/course2md-desktop"
    install -Dm644 "$srcdir/course2md.desktop" "$pkgdir/usr/share/applications/course2md.desktop"
    install -Dm644 desktop/assets/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/course2md.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 desktop/assets/material/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-material-icons"
    install -Dm644 desktop/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
