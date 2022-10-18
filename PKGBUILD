# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-search-provider-gopass
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="GNOME Search Provider for gopass secrets"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/$pkgname"
license=(custom:0BSD)
groups=()
depends=(dbus gnome-shell gopass)
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
sha512sums=('e572d9ec3b381453bb3a69d8e7bc97efbc56680ecd79e9853f7c456c4f71466b9fd52d12a3e4c43ae6714650f086ab22a8b79c016d4249bc11dcfa71c7c318eb')
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
	make CARGO=true DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
