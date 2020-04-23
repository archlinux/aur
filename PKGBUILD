# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=obs-v4l2sink-git
pkgver=r21.1ec3c8a
obsver=$(obs --version | sed -e 's/[^0-9]*//;s/-.*//')
pkgrel=1
pkgdesc="v4l2-output for obs-studio"
arch=(x86_64)
url="https://github.com/CatxFish/obs-v4l2sink"
license=('GPL')
groups=()
depends=(obs-studio)
makedepends=('git' 'obs-studio' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("obs-v4l2sink::git+${url}.git"
	"https://github.com/obsproject/obs-studio/archive/$obsver.tar.gz"
)
noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake -DLIBOBS_INCLUDE_DIR="../obs-studio-$obsver/libobs" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgname%-git}"
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
