# Maintainer: Nicolas Embriz <nbari at tequila dot io>

pkgname=s3m
pkgver=0.14.5
pkgrel=1
pkgdesc="CLI for streams of data in S3 buckets"
arch=('i686' 'x86_64')
url="https://s3m.stream"
license=('BSD')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/s3m/s3m/archive/${pkgver}.tar.gz")
sha256sums=('d5a0dae4008d916a496cd97084991cff3cd5a8b48b4508061823f49d591c83d6')

build() {
    cd "$pkgname-$pkgver"
    if command -v rustup >/dev/null 2>&1; then
        RUSTFLAGS="-C target-cpu=native" rustup run nightly \
            cargo build --release
    elif rustc --version | grep -q nightly; then
        RUSTFLAGS="-C target-cpu=native" \
            cargo build --release
    else
        cargo build --release
    fi
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/s3m" "$pkgdir/usr/bin/s3m"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
