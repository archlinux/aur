# Maintainer: Benji377 <demetzbenjamin23@gmail.com>
pkgname=raspirus
pkgver=2.0.0
pkgrel=1
pkgdesc="A user- and resources-friendly rules-based malware scanner"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL-3.0-only')
url="https://github.com/Raspirus/Raspirus"
depends=('glibc' 'openssl')
makedepends=('cargo')
provides=('raspirus')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Raspirus/Raspirus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}