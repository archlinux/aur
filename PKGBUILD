# Maintainer: Diego Frias <styx5242@gmail.com>
# Maintainer: Ayoub Canon <imkonnu@gmail.com>

pkgname=projectable
_binname=prj
pkgver=1.3.2
pkgrel=1
pkgdesc="A TUI file manager built for projects."
arch=('x86_64')
url="https://github.com/dzfrias/projectable"
license=('MIT')
depends=('libgit2' 'libssh2' 'openssl' 'gcc-libs' 'glibc')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dzfrias/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8677aa186b50e28ae1addaa9178b65de9e07b3fcd54056fd92464b49c9f71312')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export LIBSSH2_SYS_USE_PKG_CONFIG=1
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

# The tests take too long to run on top of a long build time.
#check() { 
#    cd "$pkgname-$pkgver"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

