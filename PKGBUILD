# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=cicada-shell
_pkgname=cicada
pkgver=0.9.38
pkgrel=1
pkgdesc="A bash-like Unix shell written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/mitnk/cicada"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('cicada')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7ba8980a53707549b35a274b0a332623e79d419109c427d2481e2ffcc7d4ba3a')

prepare() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $_pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $_pkgname-$pkgver
    install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    find docs/ -type f -exec install -Dm644 "{}" -t "$pkgdir/usr/share/doc/$pkgname" \;
}
