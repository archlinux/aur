# Maintainer: Otreblan <otreblain@gmail.com>

pkgname=giara-git
pkgver=r84.9b950c9
pkgrel=2
epoch=
pkgdesc="Reddit gtk client"
arch=('any')
url="https://gitlab.gnome.org/GabMus/giara"
license=('GPL3')
groups=()
depends=(
	'gtksourceview4'
	'libhandy1'
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
	# Generate pycache, if you ran giara as root this will conflict
	python -m compileall "$srcdir/$pkgname/${pkgname%-git}"
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
