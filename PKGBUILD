# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>

pkgname=gcloud-ctx
pkgver=0.7.0
pkgrel=1
pkgdesc='Manage Google Cloud Platform gcloud configurations easily and quickly'
url='https://github.com/adamrodger/gcloud-ctx'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=("$pkgname-$pkgver::https://github.com/adamrodger/gcloud-ctx/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cc7be7bd70123f223cad5bb718e92c5e7e94aac1c7df48cb6bb15dff71d366b9')
_shortname=gctx

prepare() {
    cd $pkgname-$pkgver
    echo 'resolver = "2"' >> Cargo.toml # FIXME
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --workspace
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_shortname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
