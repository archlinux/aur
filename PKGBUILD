# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=scooter
pkgver=0.8.3
pkgrel=1
pkgdesc='An interactive find and replace in the terminal'
arch=(any)
url=https://github.com/thomasschafer/scooter
license=(MIT)

depends=(gcc-libs glibc oniguruma)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(ed5b120ad4bcaa67ba9d236229f1bd3ebafad92fb53e7bf259d22d5a11a4a46d)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTONIG_SYSTEM_LIBONIG=1
    cargo build --frozen --release
}

check() {
    cd "$srcdir"/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package () {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md
}
