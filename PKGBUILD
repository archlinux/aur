# Maintainer: Sricharan <sricharanandra7@gmail.com>
pkgname=eurus-tui-git
_pkgname=eurus
pkgver=r26.4dd6cd8  # This is a placeholder; makepkg updates it automatically
pkgrel=9
pkgdesc="E2EE Terminal Chat Client (eurus)"
arch=('x86_64' 'aarch64')
url="https://github.com/sricharanandra/eurus-tui"
license=('MIT')
depends=('gcc-libs' 'libxcb' 'dbus' 'alsa-lib' 'openssl') # libxcb for clipboard, dbus for notifications, alsa-lib for audio, openssl for TLS
options=('!lto')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')
pkgver() {
    cd "$srcdir/eurus-tui"
    # Generates version based on latest git commit (e.g., r42.g123abc)
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
    cd "$srcdir/eurus-tui"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
build() {
    cd "$srcdir/eurus-tui"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}
package() {
    cd "$srcdir/eurus-tui"
    # Installs the binary to /usr/bin/eurus
    install -Dm755 target/release/eurus "$pkgdir/usr/bin/eurus"
}
