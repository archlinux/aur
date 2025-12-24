# Maintainer: Rotko Networks <hq@rotko.net>
pkgname=x11q-git
pkgver=0.5.0
pkgrel=1
pkgdesc="X11 display forwarding over QUIC with P2P holepunching (git version)"
arch=('x86_64')
url="https://github.com/rotkonetworks/x11q"
license=('MIT' 'Apache-2.0')
depends=('libxcb' 'libx11')
makedepends=('cargo' 'git')
provides=('x11q')
conflicts=('x11q')
source=("git+https://github.com/rotkonetworks/x11q.git")
sha256sums=('SKIP')

pkgver() {
    cd x11q
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd x11q
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd x11q
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd x11q
    install -Dm755 "target/release/x11q" "$pkgdir/usr/bin/x11q"
    install -Dm644 README.md "$pkgdir/usr/share/doc/x11q/README.md"
}
