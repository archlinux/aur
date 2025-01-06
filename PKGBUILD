# Maintainer: Nova King <technobaboo@proton.me>

_clientname="protostar"
pkgdesc="Prototype app launchers for Stardust XR"

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
    export STARDUST_RES_PREFIXES=/usr/share
    cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$srcdir/$_clientname"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/app_grid" "$pkgdir/usr/bin/"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/hexagon_launcher" "$pkgdir/usr/bin/"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/sirius" "$pkgdir/usr/bin/"
    install -Dm644 \
		LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 \
		README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
    cp -r "res/$_clientname" "$pkgdir/usr/share/"
}
