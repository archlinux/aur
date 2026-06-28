# Maintainer: taotieren <admin@taotieren.com>

pkgname=nping
_name=Nping
pkgver=0.7.1
pkgrel=1
pkgdesc="🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations"
arch=($CARCH)
url="https://github.com/hanshuaikang/Nping"
license=('MIT')
provides=(${pkgname} nbping)
conflicts=(${pkgname} nbping)
# replaces=(${pkgname})
depends=(
    gcc-libs
    glibc
)
makedepends=(
    git
    rust
)
backup=()
options=(!debug !strip !lto)
#install=${pkgname}.install
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('ae7b59a0b82efb5b32c4e45cfcd8fc97f2576b69508f18bad505719d9f6e96ac')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release
}

# check() {
#     cd "${srcdir}/${pkgname}-${pkgver}/"
#     cargo test --release --all-features
# }

package() {
    cd "${srcdir}/${pkgname}/"

    install -vDm755 target/release/nbping -t ${pkgdir}/usr/bin/
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
