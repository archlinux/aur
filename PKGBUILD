# Maintainer: Nicolas Embriz <nbari at tequila dot io>

pkgname=s3mon
pkgver=0.7.0
pkgrel=1
pkgdesc="Monitor S3 buckets for missing files"
arch=('x86_64')
url="https://github.com/s3mon/s3mon"
license=('BSD-3-Clause')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://crates.io/api/v1/crates/${pkgname}/${pkgver}/download")
sha256sums=('0d23c4cd7ecd08578a87ac6099584e88d4f2717702ce988becc0dcc39ac120a8')

build() {
    cd "$pkgname-$pkgver"
    if command -v rustup >/dev/null 2>&1; then
        RUSTFLAGS="-C target-cpu=native" rustup run nightly \
            cargo build --locked --release
    elif rustc --version | grep -q nightly; then
        RUSTFLAGS="-C target-cpu=native" \
            cargo build --locked --release
    else
        cargo build --locked --release
    fi
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/s3mon" "$pkgdir/usr/bin/s3mon"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
