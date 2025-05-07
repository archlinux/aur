# Maintainer: fuero <fuerob@gmail.com>
_pkgname=signal-scan
pkgname=sigscan
pkgver=0.2.2
pkgrel=1
pkgdesc='List POSIX signal information for all processes'
url='https://github.com/brannondorsey/sigscan'
license=('MIT' 'Apache-2.0')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$_pkgname/$_pkgname-$pkgver.crate"
)
sha256sums=('b5cb732f0f4ea098649f4cbaf9c641c97252941ebde1ea89828d9613f9dc0b5a')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $_pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $_pkgname-$pkgver
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $_pkgname-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $_pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CHANGELOG.md
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
