# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

_projectname='spot'
pkgname="$_projectname-client"
pkgver='0.3.3'
pkgrel='1'
pkgdesc='Gtk/Rust native Spotify client'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xou816/$_projectname"
license=('MIT')
depends=('alsa-lib' 'cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'libadwaita' 'libpulse' 'openssl' 'pango')
optdepends=('org.freedesktop.secrets')
makedepends=('cargo' 'meson>=0.50.0')
checkdepends=('appstream-glib')
options=('!lto') # build breaks with LTO enabled (https://gitlab.com/dpeukert/pkgbuilds/-/issues/38)
source=(
	"https://github.com/xou816/$_projectname/archive/$pkgver/$_projectname-$pkgver.tar.gz"
	'disable-clippy.patch'
)
sha512sums=('8b116e5e9a79efbbb6aef21b89ca93d3ea6083fb02b245662a4e222f85feef76dbc5abcdacfb0a29bf8ee0d8062137b3f0a1648a47537b26a9c16dd7bf525a8a'
            '1cb0faced2e6801cb994e9af7b81411355837b2efcd9c82b82751508e0bfcc967c50b3d6296bfdb8c017bbf2e7a503a3920d36cb896e44c896c23f5b9e1d13f1')
validpgpkeys=() # waiting for https://github.com/xou816/spot/issues/283

_sourcedirectory="$_projectname-$pkgver"
_builddirectory='build'

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable clippy tests, as they don't realy make sense for user builds (https://gitlab.com/dpeukert/pkgbuilds/-/issues/37)
	patch --forward -p1 < '../disable-clippy.patch'
}

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
