# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-search-provider-gopass
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="GNOME Search Provider for gopass secrets"
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
sha512sums=('534ed6153488189329267e9e605e71721519bd86c3e33d2edb36f7dc3176c4cf3f7341a5a40e48b907f31886da38556c65204620b7a29813e89900a1432c5441')
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
