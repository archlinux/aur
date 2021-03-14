# Maintainer: Daniel Peukert <daniel@peukert.cc>
_projectname='spot'
pkgname="$_projectname-client"
pkgver='0.1.10'
pkgrel='4'
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
	"$pkgname-$pkgver-$pkgrel-meson-test-release.diff::$url/commit/2dc722595e6bf716e46b779db6c8d3e239052ff2.diff"
)
sha256sums=('9399ba0673ad32a9e6220eaa220c08fba8d6464adab5018130e5cad8818b0979'
            '4366433646f05f74cb9cdc23079ad37655e06589cd28ecd3cd156223ff213a95')

_sourcedirectory="$_projectname-$pkgver"
_builddirectory='build'

prepare() {
	cd "$srcdir/$_sourcedirectory/"
	patch --forward -p1 < "../$pkgname-$pkgver-$pkgrel-meson-test-release.diff"
}

build() {
	cd "$srcdir/"
	meson setup --prefix '/usr' --libexecdir 'lib' --sbindir 'bin' --buildtype 'release' --wrap-mode 'nodownload' \
		-Db_lto='true' -Db_pie='true' -Doffline='false' -Dfeatures='warn-cache' "$_sourcedirectory" "$_builddirectory"
	meson compile -C "$_builddirectory"
}

check() {
	cd "$srcdir/"
	meson test -C "$_builddirectory"
}

package() {
	cd "$srcdir/"
	DESTDIR="$pkgdir" meson install -C "$_builddirectory"
	install -Dm644 "$_sourcedirectory/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
