# Maintainer: Mathieu Grenet <mathieu@mgth.fr>
#
# omniphony-studio — Omniphony Studio, the native (egui/wgpu) desktop UI
# (`omniphony-studio-egui/` in the source tree). Up to 0.6.0 this package
# built the web-based Tauri Studio, and the native one was packaged on its own
# as `omniphony-studio-egui`; from 0.7.0 the native Studio is the only one and
# this package replaces that one.
#
# It does not bundle the renderer: it depends on the `orender` package and
# finds the system binary at runtime (next to its own executable —
# /usr/bin/orender — then on PATH). The layouts it offers are the ones
# `orender` installs, linked under the Studio's share directory, which is where
# it looks for its shipped files (core/src/host/bundle.rs: next to the
# executable, then ../share/omniphony-studio-egui).
#
# wgpu picks its backend at runtime (Vulkan first) and winit its display
# server (Wayland, then X11); both are dlopen'd, hence runtime dependencies
# the binary does not link.
#
# The decoder bridge stays optional (`harletty-bridge`), matching the engine.

pkgname=omniphony-studio
pkgver=0.7.0
pkgrel=1
pkgdesc="Omniphony Studio — control and 3D visualization UI for the orender spatial audio engine"
arch=('x86_64')
url="https://github.com/mgth/Omniphony"
license=('GPL-3.0-only')
depends=('orender' 'gcc-libs' 'vulkan-icd-loader' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('harletty-bridge: decode compressed/object-audio formats via the orender bridge plugin'
            'xdg-desktop-portal: native file dialogs (layout import and export)'
            'noto-fonts-cjk: Japanese, Chinese and Korean labels')
makedepends=('rust' 'cargo')
provides=('omniphony-studio-egui')
conflicts=('omniphony-studio-egui')
replaces=('omniphony-studio-egui')
# !lto: keep makepkg's -flto=auto out of cc-built C deps of the Rust build
# (GCC LTO bitcode is unreadable by the Rust linker; same issue as orender).
options=('!lto')
source=("omniphony-$pkgver.tar.gz::https://github.com/mgth/Omniphony/archive/refs/tags/v$pkgver.tar.gz")
# Refreshed with `updpkgsums` once the tag exists (docs/release-process.md, §8).
sha256sums=('ad1a093ddbd83e71ed6182a49009f66b7b5c421efdd25915cc72451c33844f38')

_src="Omniphony-$pkgver"
_studio="$_src/omniphony-studio-egui"
# The directory core/src/host/bundle.rs looks in (its PACKAGE_DIR), not this
# package's name.
_share="omniphony-studio-egui"

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
    # The command the Tauri Studio installed, kept for launchers and habits.
    ln -s omniphony-studio-egui "$pkgdir/usr/bin/omniphony-studio"

    # The Studio's shipped files: the layouts are the renderer package's, the
    # head model is this package's.
    install -d "$pkgdir/usr/share/$_share"
    ln -s ../orender/layouts "$pkgdir/usr/share/$_share/layouts"
    install -Dm644 assets/la_dame_de_brassempouy_centered.glb \
        "$pkgdir/usr/share/$_share/assets/la_dame_de_brassempouy_centered.glb"

    install -Dm644 packaging/omniphony-studio-egui.desktop \
        "$pkgdir/usr/share/applications/omniphony-studio-egui.desktop"
    install -Dm644 assets/icons/128x128.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/omniphony-studio-egui.png"

    # License text (repo-root GPL-3.0-only covers the studio).
    install -Dm644 "$srcdir/$_src/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
