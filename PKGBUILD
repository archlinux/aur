# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=howdy
pkgname="$_pkgbase-git"
pkgver=r586.c4521c1
pkgrel=1
pkgdesc="Windows Hello style facial authentication for Linux"
arch=('x86_64')
url="https://github.com/boltgolt/howdy"
license=('MIT')
makedepends=('git' 'meson' 'ninja' 'cmake')
depends=('libinih' 'libevdev' 'python' 'python-dlib' 'python-opencv')
provides=('howdy')
conflicts=('howdy')
backup=('etc/howdy/config.ini')
install=howdy.install
source=(
	"howdy::git+https://github.com/boltgolt/howdy.git"
	"https://github.com/davisking/dlib-models/raw/master/dlib_face_recognition_resnet_model_v1.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/mmod_human_face_detector.dat.bz2"
	"https://github.com/davisking/dlib-models/raw/master/shape_predictor_5_face_landmarks.dat.bz2"
)
md5sums=(
	'SKIP'
	'1b31cc4419cc8f1018117249b64bd683'
	'5edccec8ac713d743be4865ff6ead7f7'
	'ef591cf713630226b35b11d0e1733118'
)

pkgver() {
	cd $_pkgbase
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

prepare() {
	cd "$srcdir"
	meson setup --reconfigure "$_pkgbase" "$_pkgbase/build"
}

build() {
	cd "$srcdir"
	arch-meson "$_pkgbase" build
	meson compile -C build
}

package() {
	cd "$srcdir"
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "$_pkgbase/howdy/src/config.ini" "$pkgdir/etc/howdy/config.ini"
	install -Dm644 "$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"

	cd "$srcdir"
	install -Dm644 *.dat "$pkgdir/usr/share/dlib-data"
}
