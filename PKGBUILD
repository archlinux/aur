# Maintainer: Rayr <https://rayr.ml/LinkInBio>
# Contributor: Daniel Peukert <daniel@peukert.cc>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
_projectname='spot'
pkgname="$_projectname-client-git"
pkgver='r698.4b1209d'
pkgrel='2'
pkgdesc='Gtk/Rust native Spotify client - git version'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xou816/$_projectname"
license=('MIT')
depends=('alsa-lib' 'cairo' 'glib2' 'glibc' 'graphene' 'gtk4' 'libadwaita' 'libpulse' 'openssl' 'pango' 'clang')
optdepends=('org.freedesktop.secrets')
makedepends=('cargo' 'git' 'meson>=0.50.0')
checkdepends=('appstream-glib')
provides=("$_projectname-client")
conflicts=("$_projectname-client")
options=('!lto') # build breaks with LTO enabled (https://gitlab.com/dpeukert/pkgbuilds/-/issues/38)
source=(
	"$pkgname::git+$url"
	'disable-clippy.patch'
)
sha512sums=('SKIP'
            '1cb0faced2e6801cb994e9af7b81411355837b2efcd9c82b82751508e0bfcc967c50b3d6296bfdb8c017bbf2e7a503a3920d36cb896e44c896c23f5b9e1d13f1')

_sourcedirectory="$pkgname"
_builddirectory='build'

prepare() {
	cd "$srcdir/$_sourcedirectory/"

	# Disable clippy tests, as they don't realy make sense for user builds (https://gitlab.com/dpeukert/pkgbuilds/-/issues/37)
	patch --forward -p1 < '../disable-clippy.patch'
}

pkgver() {
	cd "$srcdir/$_sourcedirectory/"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
