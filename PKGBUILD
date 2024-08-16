# Maintainer: Martin Kühl <martin.kuehl@posteo.net>
pkgname=gnome-summoner
pkgver=0.1.0
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
sha512sums=('3d2a3938fe655385f76dcb1c89fd7cf99115fbb4d92a3bfb69a79b47f2182338e5b631ba886c2e8e123069238bcddd43b21e972f00a162aee3421038c19f44ec')
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
