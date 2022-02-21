# Maintainer: Ilaï Deutel <PlMWPh1WSmypRv0JQljz> (echo ... | tr 'A-Za-z' 'l-za-kL-ZA-K' | base64 -d)

_cratename=melody_cli
pkgname=melody
pkgver=0.1.1
pkgrel=1
pkgdesc='A language designed to compile to and maintain a 1-1 relationship with regular expressions, while being more readable and maintainable.'
url='https://github.com/yoav-lavi/melody'
makedepends=('cargo')
depends=('gcc-libs')
arch=('x86_64')
license=('MIT')
source=("https://github.com/yoav-lavi/melody/archive/v${pkgver}/${_cratename}-${pkgver}.tar.gz")
sha256sums=('8fdde4b38952ff5b70507ffa36ae118c4efb0d4009ee959aa25c7ac7b06bcdd8')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu" --manifest-path "crates/${_cratename}"/Cargo.toml
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --package "${_cratename}"
}

check() {
    cd "$pkgname-$pkgver"
    regex=$(cargo run --frozen --all-features --package "${_cratename}" -- test/test.mdy)
    expected='/(?:na){16}(?:\sbatman){2}/'
    if [[ "$regex" != "$expected" ]]; then
        echo "Expected $expected, got $regex";
        exit 1;
    fi
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

