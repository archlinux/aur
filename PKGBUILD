# Maintainer: Bart Libert <aur@bart.libert.email>

pkgname=sway-new-workspace
pkgver=0.1.5
pkgrel=1
pkgdesc="A command to create new Sway workspaces"
arch=('x86_64')
url='https://github.com/nzig/sway-new-workspace'
license=('MIT')
depends=('gcc-libs' 'glibc')
optdepends=('sway')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f01534ab6013660ec00ba1b0c136dcd5afa866415a239a78e4d91c5e8bdc3a41')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
