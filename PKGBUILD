# Maintainer: screamingatmypc <aur at hailsatan dot xyz>

pkgname=ninve
pkgdesc="A text user interface written in Rust to losslessly trim videos. Uses mpv to allow visual seeking."
pkgver=0.1.21
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Niedzwiedzw/ninve"
license=('MIT')
makedepends=('cargo')
depends=('ffmpeg' 'mpv')
provides=('ninve')
conflicts=('ninve')

source=(
    "$pkgname-$pkgver.tar.xz"::"https://github.com/Niedzwiedzw/ninve/archive/refs/tags/$pkgver.tar.gz"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/Niedzwiedzw/ninve/0.1.21/LICENSE"
)
sha256sums=('316ed2855851e500c4fc16123b884e36d1772a76377b322587c435931a264be0'
            '088abcb863a847f3bdd75348534d245ead78c9947f473e6f7f8f110f3dcc6286')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
