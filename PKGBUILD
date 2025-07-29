# Maintainer: Phusit Somboonyingsuk

pkgname=mprisence-git
pkgver=1.2.3
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
        "mprisence-git.install")
sha256sums=('SKIP'
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
    make DESTDIR="$pkgdir" pkg-prepare
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
