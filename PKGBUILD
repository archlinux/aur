pkgname=papagaia
pkgver=0.1.0
pkgrel=1
pkgdesc='Voice-writing and text-rewriting tool for Linux Wayland desktops'
arch=('x86_64')
url='https://github.com/ceifa/papagaia'
license=('MIT')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'gtk4' 'gtk4-layer-shell')
makedepends=('cargo')
optdepends=(
    'wl-clipboard: clipboard support on Wayland'
    'wtype: keyboard simulation on Wayland'
    'ydotool: keyboard simulation (alternative to wtype)'
    'whisper.cpp: local speech-to-text for dictation'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ceifa/papagaia/archive/refs/tags/v$pkgver.tar.gz"
        'papagaia-daemon.service')
sha256sums=('SKIP'
            '2f2d18e22d6f2fa0b7ac1a7cede9cb2a913ab63894dfdd1d08cc695cce616304')
install=papagaia.install

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/papagaia "$pkgdir/usr/bin/papagaia"
    install -Dm0755 target/release/papagaia-daemon "$pkgdir/usr/bin/papagaia-daemon"
    install -Dm0755 target/release/papagaia-overlay "$pkgdir/usr/bin/papagaia-overlay"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "$srcdir/papagaia-daemon.service" "$pkgdir/usr/lib/systemd/user/papagaia-daemon.service"
}
