# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# omniphony-studio-egui — the native (egui/wgpu) Omniphony Studio. Like
# `omniphony-studio` (the Tauri host) it does not bundle the renderer: it
# depends on the `orender` package and finds the system binary at runtime
# (next to its own executable — /usr/bin/orender — then on PATH). The layouts
# it offers are the ones `orender` installs, linked under this package's share
# directory, which is where the Studio looks for its shipped files
# (core/src/host/bundle.rs: next to the executable, then ../share/<name>).
#
# wgpu picks its backend at runtime (Vulkan first) and winit its display
# server (Wayland, then X11); both are dlopen'd, hence runtime dependencies
# the binary does not link.

pkgname=omniphony-studio-egui
pkgver=0.6.0
pkgrel=1
pkgdesc="Omniphony Studio, native egui/wgpu host — control and 3D visualization UI for the orender spatial audio engine"
arch=('x86_64')
url="https://github.com/mgth/Omniphony"
license=('GPL-3.0-only')
depends=('orender' 'gcc-libs' 'vulkan-icd-loader' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin'
            'xdg-desktop-portal: native file dialogs (layout import and export)'
            'noto-fonts-cjk: Japanese, Chinese and Korean labels')
makedepends=('rust' 'cargo')
# !lto: keep makepkg's -flto=auto out of cc-built C deps of the Rust build
# (GCC LTO bitcode is unreadable by the Rust linker; same issue as orender).
options=('!lto')
source=("omniphony-$pkgver.tar.gz::https://github.com/mgth/Omniphony/archive/refs/tags/v$pkgver.tar.gz")
# Refreshed with `updpkgsums` once the tag exists (docs/release-process.md, §8).
sha256sums=('2fc90db9f979710b4d4275f3da35c13ca7caddef0f0def7d30e06b21cb1ab355')

_src="Omniphony-$pkgver"
_studio="$_src/omniphony-studio-egui"

build() {
    cd "$srcdir/$_studio"
    # Keep $srcdir out of the binary (panic-location paths) for reproducibility.
    export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=src"
    # The crate pins a toolchain in rust-toolchain.toml for rustup users; the
    # system rustc builds here and satisfies the crate's rust-version.
    cargo build --release --locked
}

package() {
    cd "$srcdir/$_studio"

    install -Dm755 target/release/omniphony-studio-egui \
        "$pkgdir/usr/bin/omniphony-studio-egui"

    # The Studio's shipped files: the layouts are the renderer package's, the
    # head model is this package's.
    install -d "$pkgdir/usr/share/$pkgname"
    ln -s ../orender/layouts "$pkgdir/usr/share/$pkgname/layouts"
    install -Dm644 "$srcdir/$_src/omniphony-studio/assets/la_dame_de_brassempouy_centered.glb" \
        "$pkgdir/usr/share/$pkgname/assets/la_dame_de_brassempouy_centered.glb"

    install -Dm644 packaging/omniphony-studio-egui.desktop \
        "$pkgdir/usr/share/applications/omniphony-studio-egui.desktop"
    install -Dm644 "$srcdir/$_src/omniphony-studio/src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/omniphony-studio-egui.png"

    # License text (repo-root GPL-3.0-only covers the studio).
    install -Dm644 "$srcdir/$_src/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
