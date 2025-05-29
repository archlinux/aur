# Maintainer: Michael Paul <aur at michael-paul dot org>
# shellcheck disable=SC2034,SC2154,SC2164 shell=bash
pkgname=asdbctl
pkgver=1.0.0
pkgrel=1
pkgdesc="a command line utility to change the brightness of one or more Apple Studio Display(s)"
arch=('x86_64')
url="https://github.com/juliuszint/asdbctl"
license=('MIT')
makedepends=(git rust)
options=(!lto !debug)
source=("git+$url#tag=v$pkgver")
b2sums=('e96cd4c4614f6daec93a871a81f0dd4bf92783bf813c27981e56e011b1a0b1876c818926c52b847fc6723f714196749624ef6b6fab62978cbce516948728bfc8')

prepare() {
    cd $pkgname

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd $pkgname

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "rules.d/20-asd-backlight.rules" "$pkgdir/usr/lib/udev/rules.d/20-asd-backlight.rules"
    install -Dm644 "README.rst" "$pkgdir/usr/share/doc/${pkgname}/README.rst"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

}

