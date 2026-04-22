# Maintainer: Hornfisk <hornfisk@users.noreply.github.com>
pkgname=autokit
pkgver=0.5.3
pkgrel=1
pkgdesc="Sample-based drum machine plugin with spectral analysis and 2D sample map"
arch=('x86_64')
url="https://github.com/Hornfisk/autokit"
license=('GPL-3.0-or-later')
depends=('libx11' 'libxcb' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms'
         'libxcursor' 'libxkbcommon' 'mesa' 'alsa-lib')
makedepends=('rust' 'cargo' 'git' 'cmake' 'pkg-config' 'jack2')
provides=('autokit')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hornfisk/autokit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo xtask bundle autokit --release
}

package() {
    cd "$pkgname-$pkgver"

    # VST3
    install -d "$pkgdir/usr/lib/vst3"
    cp -r target/bundled/autokit.vst3 "$pkgdir/usr/lib/vst3/"

    # CLAP
    install -d "$pkgdir/usr/lib/clap"
    install -Dm644 target/bundled/autokit.clap "$pkgdir/usr/lib/clap/autokit.clap"

    # Standalone
    install -Dm755 "target/release/autokit-standalone" "$pkgdir/usr/bin/autokit"
}
