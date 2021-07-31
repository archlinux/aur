# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='spot'
pkgname="$_projectname-client"
pkgver='0.1.15'
pkgrel='2'
pkgdesc='Gtk/Rust native Spotify client'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xou816/$_projectname"
license=('MIT')
depends=('alsa-lib' 'glib2' 'gtk3' 'libhandy' 'libpulse' 'openssl')
optdepends=('org.freedesktop.secrets')
makedepends=('cargo' 'meson>=0.50.0')
checkdepends=('appstream-glib')
source=(
	"$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz"
	'disable-clippy-test.diff'
)
sha256sums=('55fa29d3627b8e6218b6a0f927391887fbb1a496b597a74a3af70b75207f4121'
            'ebf64746a9fff1242bdbf47736c78aaf7c3c94ef6423002662dbbb74db685004')

_sourcedirectory="$_projectname-$pkgver"
_builddirectory='build'

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# Disable Clippy test for now, as it still complains about some errors not yet fixed by upstream
	# When reenabling, don't forget to use a patch to explicitly specify the Cargo.toml path (https://github.com/xou816/spot/issues/252#issuecomment-880941157)
	patch --forward -p1 < '../disable-clippy-test.diff'
}

build() {
	cd "$srcdir/"
	meson setup --prefix '/usr' --libexecdir 'lib' --sbindir 'bin' --buildtype 'release' --wrap-mode 'nodownload' \
		-Db_lto='true' -Db_pie='true' -Doffline='false' -Dfeatures='warn-cache' "$_sourcedirectory" "$_builddirectory"
	meson compile -C "$_builddirectory"
}

check() {
	cd "$srcdir/"
	meson test -C "$_builddirectory" --timeout-multiplier -1
}

package() {
	cd "$srcdir/"
	DESTDIR="$pkgdir" meson install -C "$_builddirectory"
	install -Dm644 "$_sourcedirectory/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
