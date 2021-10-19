# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
_projectname='spot'
pkgname="$_projectname-client"
pkgver='0.2.1'
pkgrel='1'
pkgdesc='Gtk/Rust native Spotify client'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xou816/$_projectname"
license=('MIT')
depends=('alsa-lib' 'cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'libadwaita' 'libpulse' 'openssl' 'pango')
optdepends=('org.freedesktop.secrets')
makedepends=('cargo' 'meson>=0.50.0')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('11230a686a70e3719ddc29e3442efeafdb2e56f074e4c2f8c7595b9cd1e05f0c7874f046662cc5b36ba1adc8476814090c1232038be4a2d91e8dc75478b725ab')
validpgpkeys=() # waiting for https://github.com/xou816/spot/issues/283

_sourcedirectory="$_projectname-$pkgver"
_builddirectory='build'

build() {
	cd "$srcdir/"
	# We're not using arch-meson, because upstream recommends using --buildtype 'release'
	# The offline build flag is turned off, as we're not predownloading rust dependencies
	meson setup --prefix '/usr' --libexecdir 'lib' --sbindir 'bin' --buildtype 'release' --wrap-mode 'nodownload' \
		-Db_lto='true' -Db_pie='true' -Doffline='false' "$_sourcedirectory" "$_builddirectory"
	meson compile -C "$_builddirectory"
}

check() {
	cd "$srcdir/"
	meson test -C "$_builddirectory" --timeout-multiplier -1
}

package() {
	cd "$srcdir/"
	meson install -C "$_builddirectory" --destdir "$pkgdir"
	install -Dm644 "$_sourcedirectory/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
