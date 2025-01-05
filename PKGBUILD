# Maintainer: Nova King <technobaboo@proton.me>

_clientname="atmosphere"
pkgdesc="3D environment/homespace client for Stardust XR"

pkgname="stardust-xr-$_clientname"
pkgver="0.1.0"
pkgrel="2"
arch=("x86_64" "aarch64")
url="https://github.com/StardustXR/$_clientname"
license=("MIT")
depends=()
makedepends=(
	"cargo"
	"git"
)
source=(
    "git+https://github.com/StardustXR/$_clientname.git"
)
sha256sums=("SKIP")
OPTIONS=(strip lto !debug)

prepare() {
    cd "$srcdir/$_clientname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_clientname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$srcdir/$_clientname"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/$_clientname" "$pkgdir/usr/bin/$_clientname"
    install -Dm644 \
		LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 \
		README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
}
