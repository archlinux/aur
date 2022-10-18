# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-search-provider-emoji-shortcodes
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="GNOME Search Provider for Emoji Shortcodes"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/$pkgname"
license=(custom:0BSD)
groups=()
depends=(dbus gnome-shell)
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
sha512sums=('01eb8a5cb162b5dd109ffa7704a4b6f8c440c537478d8b49e87c91d85019dd195cb441b0115bbe4a18d6d260dfdccd0736495ad3341d0a9eda421483cd5d026b')
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
