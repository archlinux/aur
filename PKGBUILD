# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=giara
pkgver=0.3
pkgrel=3
epoch=
pkgdesc="Reddit gtk client"
arch=('any')
url="https://gitlab.gnome.org/World/giara"
license=('GPL3')
groups=()
depends=(
	'gtksourceview4'
	'libhandy>=1'
	'python-beautifulsoup4'
	'python-cairo'
	'python-dateutil'
	'python-gobject'
	'python-mistune'
	'python-pillow'
	'python-praw'
	'webkit2gtk'
)
makedepends=('meson' 'gobject-introspection')
checkdepends=()
optdepends=('ffmpeg: For video')
provides=(redditgtk)
conflicts=(redditgtk)
replaces=(redditgtk)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('111d9f2aa46c58cf5cfe3e677988a2726701ca7ba1cc94948176d2345d80ff7f')

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
