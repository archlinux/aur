# Maintainer: jzbor <zborof at posteo dot de>
pkgname=marswm
pkgver=0.5.3
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('80e8ec9a4935b6204de6c2c13395f33da334e16b116f7341ce625b269eb0faef44f8158c78587fae477836043279de7a8fcaa84bd233169eebe3630eb2fcaee8')

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
