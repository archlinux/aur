# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=color-scheme-monitor
pkgver=0.1.3
pkgrel=2
epoch=
pkgdesc="Monitor the system-wide color scheme and adapt unaware applications to it"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/color-scheme-monitor/"
license=(0BSD)
groups=()
depends=(glibc gcc-libs dbus systemd xdg-desktop-portal)
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
sha512sums=('1d9f0aec68fa66474951d590ac6d9f5e7dfaea3e8d9405e1f9f2f8444e45c68ea49ab64f9567847bcf38090b9ebad2a93afe94b9c19e96a626f9c64ded3e4ce9')
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
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir/" PREFIX=/usr LIBEXECDIR=/usr/lib ./install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
