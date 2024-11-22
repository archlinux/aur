pkgname=linkwiz
pkgdesc="A tool that lets users select their preferred browser for opening links."
pkgver=0.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/icealtria/linkwiz"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=(
        "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/icealtria/linkwiz/main/Linkwiz.desktop"
        )
sha256sums=('bffbdb7b64446a6e1ba744180758d2408c2f275214d09ec2894928e740b6daf9'
            '3532bc9e5e7f7393b38bc539eb7b6451c0c33951aae79906fb6d4926eec1e027')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen  
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/linkwiz-rs "${pkgdir}"/usr/bin/${pkgname}
    install -Dm644 Linkwiz.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
