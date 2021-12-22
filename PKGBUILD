# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
_projectname='spot'
pkgname="$_projectname-client"
pkgver='0.2.2'
pkgrel='2'
pkgdesc='Gtk/Rust native Spotify client'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xou816/$_projectname"
license=('MIT')
depends=('alsa-lib' 'cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'libadwaita' 'libpulse' 'openssl' 'pango')
optdepends=('org.freedesktop.secrets')
makedepends=('cargo' 'meson>=0.50.0')
checkdepends=('appstream-glib')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'clippy.diff'
)
sha512sums=('997db5a651deb3290048a7283ee9f3b49387c51d6128a03ed3cf35b03df4db206d2502923df7ab45a0ef9fc45522c452edc74d4f16ccced8ca264a00e151887a'
            '8051c21a00c981eef8f0b08f30b369f28cd08d9d8d13b9f05df61b8365fc8ea91534aea7f21fcad6f14b41577fdfc9eaaf64dbd720d051e302fc7222d8aaf599')
validpgpkeys=() # waiting for https://github.com/xou816/spot/issues/283

_sourcedirectory="$_projectname-$pkgver"
_builddirectory='build'

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Until they're fixed upstream, ignore some newly thrown errors from clippy 1.57
	patch --forward -p1 < "$srcdir/clippy.diff"
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
