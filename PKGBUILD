# Maintainer: Nova King <technobaboo@proton.me>

_clientname="non-spatial-input"
pkgdesc="Get your 2D input into Stardust XR and spatialize it"

pkgname="stardust-xr-$_clientname"
pkgver="0.50.0"
pkgrel="1"
arch=("x86_64" "aarch64")
url="https://github.com/StardustXR/$_clientname"
license=("MIT")
depends=(
	"glibc"
	"gcc-libs"
	"systemd-libs"
	"libinput"
	"libxkbcommon"
	"libxkbcommon-x11"
)
makedepends=(
	"cargo"
	"git"
)
source=(
    "git+https://github.com/StardustXR/$_clientname.git#tag=$pkgver"
)
sha256sums=("SKIP")
OPTIONS=(strip lto !debug)

prepare() {
    cd "$srcdir/$_clientname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_clientname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$srcdir/$_clientname"
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/azimuth" "$pkgdir/usr/bin/"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/eclipse" "$pkgdir/usr/bin/"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/manifold" "$pkgdir/usr/bin/"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/simular" "$pkgdir/usr/bin/"
    install -Dm644 \
	    LICENSE \
	    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
	    README.md \
	    "$pkgdir/usr/share/doc/$pkgname/README.md"
}
