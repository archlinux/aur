# Maintainer: jzbor <zborof at posteo dot de>
pkgname=marswm
pkgver=0.5.1
pkgrel=1
pkgdesc="A rusty successor to moonwm"
arch=('x86_64')
url="https://github.com/jzbor/marswm"
license=('custom')
depends=(libxrandr libx11 libxft libxinerama)
optdepends=(
	"rofi: application menu",
	"xmenu: context menus",
)
makedepends=('cargo')
provides=(marswm mars-relay)
conflicts=(marswm mars-relay)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('b0c957003f0df1c3fdb750e0f3a253ed39014c900c82ffa7be254afe6c2a60949ea81d2628bf3d40ad4f3547093b274fb20831144c2427b417262812a10d563d')
sha512sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%wm}-relay"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%wm}bar"
}
