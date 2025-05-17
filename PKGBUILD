# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=scooter
pkgver=0.5.1
pkgrel=1
pkgdesc='An interactive find and replace in the terminal'
arch=(any)
url=https://github.com/thomasschafer/scooter
license=(MIT)

depends=(gcc-libs glibc oniguruma)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(5d8db3e2abdbd2c59c8d21526ff99b7e6294de49b52eedf4a97b1f118c658092)

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
