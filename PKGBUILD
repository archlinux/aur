# Maintainer: jzbor <zborof at posteo dot de>
pkgname=marswm-git
pkgver=0.4.0.r4.gd0ca669
pkgrel=1
pkgdesc="A rusty successor to moonwm"
arch=('x86_64')
url="https://github.com/jzbor/marswm"
license=('custom')
depends=(libxrandr libx11 libxft libxinerama xmenu)
makedepends=('cargo')
provides=(marswm mars-relay)
conflicts=(marswm mars-relay)
source=("git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%wm-git}-relay"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%wm-git}bar"
}
