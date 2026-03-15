pkgdesc="Binder Context Manager"

pkgname="pion-binder"
pkgver="0.1.0"
pkgrel="0"
arch=("x86_64" "aarch64")
url="https://github.com/Technobaboo/pion"
license=("MIT")
depends=()
makedepends=(
	"cargo"
	"git"
)
source=(
    "git+https://github.com/Technobaboo/pion"
)
sha256sums=("SKIP")

prepare() {
    cd "$srcdir/pion"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/pion"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --target "$CARCH-unknown-linux-gnu"
}

package() {
    cd "$srcdir/pion"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/pion-binder" "$pkgdir/usr/bin/pion-binder"
    install -Dm644 \
		LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 \
		README.md \
		"$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 \
		"dist/pion-binder.service" \
		"$pkgdir/usr/lib/systemd/system/pion-binder.service"
    install -Dm644 \
		"dist/dev-binderfs.mount" \
		"$pkgdir/usr/lib/systemd/system/dev-binderfs.mount"
}
