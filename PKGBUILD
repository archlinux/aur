# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-summoner
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Launcher for Gnome that doesn't search, it summons"
arch=(i686 x86_64 armv6h armv7h)
url="https://codeberg.org/mkhl/gnome-summoner"
license=(0BSD)
groups=()
depends=(glibc gcc-libs glib2 gtk4 libadwaita)
makedepends=(blueprint-compiler cargo meson)
checkdepends=(appstream desktop-file-utils glib2)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
noextract=()
sha512sums=('fbde5a7ff6978d2692ef00a32d521fa4cb19695634b753632bec0d0f94882edf4fec1b2823ad52330a95028d9fd2001528ebdff80b2d59c1461dec12e0306832')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	arch-meson "$pkgname" build --buildtype release
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
