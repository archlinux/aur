# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='spot'
pkgname="$_projectname-client-git"
pkgver='0.1.15.r6.gac86fe7'
pkgrel='1'
pkgdesc='Gtk/Rust native Spotify client - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xou816/$_projectname"
license=('MIT')
depends=('alsa-lib' 'glib2' 'gtk3' 'libhandy' 'libpulse' 'openssl')
optdepends=('org.freedesktop.secrets')
makedepends=('cargo' 'git' 'meson>=0.50.0')
checkdepends=('appstream-glib')
provides=("$_projectname-client")
conflicts=("$_projectname-client")
source=(
	"$pkgname::git+$url"
	'disable-clippy-test.diff'
)
sha256sums=('SKIP'
            '5420e171e7ba18bf1f7bcdfe02210aa9a5f24f416157e5a113d305864a2c4580')

_sourcedirectory="$pkgname"
_builddirectory='build'

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	# Disable Clippy test for now, as it still complains about some errors not yet fixed by upstream
	# When reenabling, don't forget to use a patch to explicitly specify the Cargo.toml path (https://github.com/xou816/spot/issues/252#issuecomment-880941157)
	patch --forward -p1 < '../disable-clippy-test.diff'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	git describe --long --tags | sed -e 's/^v//' -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
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
