# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=giara-git
pkgver=r100.8eb6e84
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
	'python-dateutil'
	'python-flask'
	'python-gobject'
	'python-mistune'
	'python-pillow'
	'python-praw'
	'webkit2gtk'
)
makedepends=('meson' 'git' 'gobject-introspection')
checkdepends=()
optdepends=('ffmpeg: For video')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" redditgtk)
replaces=("redditgtk")
source=("$pkgname::git+$url.git")
sha256sums=("SKIP")

prepare() {
	cd "$srcdir/$pkgname/${pkgname%-git}"

	local _pver="$(python --version | sed "s/Python \(.*\)\..*/\1/")"
	local _ddir="/usr/lib/python$_pver/site-packages/${pkgname%-git}/"

	# Generate pycache, if you ran giara as root this will conflict
	python -OO -m compileall . --invalidation-mode checked-hash -d "$_ddir"
}

pkgver() {
	cd "$srcdir/$pkgname"
	( set -o pipefail
	git describe --tags --long 2>/dev/null | sed 's/^v-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	arch-meson "$pkgname" build

	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
