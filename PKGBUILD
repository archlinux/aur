# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=giara
pkgver=0.2
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
sha256sums=('b67934de3c71a26cecaab9511bd35e7ffdad8d6c0eaf9594078e15682a3c6ad4')

prepare() {
	cd "$srcdir/$pkgname-$pkgver/$pkgname"

	local _pver="$(python --version | sed "s/Python \(.*\)\..*/\1/")"
	local _ddir="/usr/lib/python$_pver/site-packages/${pkgname%-git}/"

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
