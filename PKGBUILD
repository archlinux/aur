# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-search-provider-emoji-shortcodes
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="GNOME Search Provider for Emoji Shortcodes"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/$pkgname"
license=(custom:0BSD)
groups=()
depends=(dbus gnome-desktop)
makedepends=(cargo sed)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mkhl/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('ddc4757b80cec3f853c078b73bc548fe743c8fd4960a70c1e8df82ece2f37f726456c5124dae6cd469ea76b11aaff6bab9328f4039665ec99ae3a95b502e94d1')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
	make CARGO=true PREFIX=/usr LIBEXECDIR=/usr/lib
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
