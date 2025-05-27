# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=scooter
pkgver=0.5.2
pkgrel=1
pkgdesc='An interactive find and replace in the terminal'
arch=(any)
url=https://github.com/thomasschafer/scooter
license=(MIT)

depends=(gcc-libs glibc oniguruma)
makedepends=(cargo)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(d01de7df6b47f56f9c436d20da683d799aa263213ec450c929c520a117cc29ef)

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
