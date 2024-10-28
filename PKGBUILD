# Maintainer: Shempignon < echo "bmljb2xhc0Bwb2ludG5kb3RzLmNvbQo=" | base64 -d >
# Contributor: https://github.com/shempignon/scaramanga/graphs/contributors

pkgname=scaramanga
pkgver=0.3.5
pkgrel=1
pkgdesc='Pacman Mirrorlist generator wrapper written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/shempignon/scaramanga"
license=('Apache')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/shempignon/scaramanga/archive/refs/tags/v$pkgver.tar.gz")
backup=("etc/scaramanga/config.toml")
sha512sums=('f0d68a950cac2ad70f84f443494f83c9c19fd7c7bdbca3669ad4341dec7125fc471a87062583f13cd0727c3c24d28933df92966615c01473249fb0b389a6ddd7')

prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/scaramanga "${pkgdir}/usr/bin/scaramanga"
    install -Dm755 config.toml.dist "${pkgdir}/etc/${pkgname}/config.toml"
    install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
