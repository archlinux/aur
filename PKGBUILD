# Maintainer: taotieren <admin@taotieren.com>

pkgname=crm
pkgver=0.2.2
pkgrel=4
pkgdesc="crm (Cargo registry manager)"
arch=($CARCH)
url="https://github.com/wtklbm/crm"
license=('MIT AND Apache-2.0')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=(
    git
    rust
)
backup=()
options=('!lto' '!debug')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('32f909f20700e63837c311204e6197125bf5c655fbb4d53361d5cad89ffb0407')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo update -w
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 "LICENSE-Apache-2.0" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
