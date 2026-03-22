# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence-git
pkgver=1.4.4
pkgrel=1
pkgdesc="Discord Rich Presence for MPRIS media players (git version)"
arch=('x86_64')
url="https://github.com/lazykern/mprisence"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('mprisence')
conflicts=('mprisence')
install=mprisence-git.install
source=("git+$url.git"
        "mprisence-git.install"
        "mprisence.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    install -Dm755 "target/release/mprisence" "$pkgdir/usr/bin/mprisence"
    install -dm755 "$pkgdir/etc/mprisence"
    install -Dm644 "config/config.example.toml" "$pkgdir/etc/mprisence/config.example.toml"
    install -Dm644 "../mprisence.service" "$pkgdir/usr/lib/systemd/user/mprisence.service"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
