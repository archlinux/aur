# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=giara
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Reddit gtk client"
arch=('any')
url="https://gitlab.gnome.org/GabMus/giara"
license=('GPL3')
groups=()
depends=(
	'gtksourceview4'
	'libhandy>=1'
	'python-beautifulsoup4'
	'python-dateutil'
	'python-flask'
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
sha256sums=('2a92cce3d5c3f6e78986aa8dc8232f578d0f6478180fa31eb3255330893a5bc1')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"

	local _pver="$(python --version | sed "s/Python \(.*\)\..*/\1/")"
	local _ddir="/usr/lib/python$_pver/site-packages/${pkgname%-git}/"

	# Generate pycache, if you ran giara as root this will conflict
	python -OO -m compileall . --invalidation-mode checked-hash -d "$_ddir"
}

build() {
	arch-meson "$pkgname-$pkgver" build

	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
