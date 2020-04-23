# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=obs-v4l2sink-git
pkgver=0.1.0.r12.1ec3c8a
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
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${url}.git"
	"obs-studio-$obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$obsver.tar.gz"
)
noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgstem}"
        printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake -DLIBOBS_INCLUDE_DIR="../obs-studio-$obsver/libobs" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgstem}"
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
