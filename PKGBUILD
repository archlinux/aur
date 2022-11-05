# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=giara
pkgver=1.0.1
pkgrel=1
pkgdesc="Reddit gtk client"
arch=('any')
url="https://gitlab.gnome.org/World/giara"
license=('GPL3')
groups=()
depends=(
	'gtk4'
	'gtksourceview5'
	'libadwaita'
	'python-beautifulsoup4'
	'python-dateutil'
	'python-gobject'
	'python-mistune'
	'python-pillow'
	'python-praw'
)
makedepends=('meson' 'gobject-introspection')
checkdepends=('appstream')
optdepends=('ffmpeg: For video')
provides=(redditgtk)
conflicts=(redditgtk)
replaces=(redditgtk)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('fc38e2cec5315e0abaeb1053b18984e7ded5526f026b435a799d63870a1e4c36')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"

	local _pver="$(python --version | sed "s/Python \(.*\)\..*/\1/")"
	local _ddir="/usr/lib/python$_pver/site-packages/$pkgname/"

	# Generate pycache, if you ran giara as root this will conflict
	for f in "" -O;
	do
		python $f -m compileall . --invalidation-mode checked-hash -d "$_ddir"
	done
}

build() {
	arch-meson "$pkgname-$pkgver" build

	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
