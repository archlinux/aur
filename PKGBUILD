# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=obs-v4l2sink-git
obsver=$(obs --version | sed -e 's/[^0-9]*//;s/\(-\|\.[^0-9]\).*//' 2>/dev/null)
pkgver=0.1.0.r12.1ec3c8a+obs25.0.8
pkgrel=3
pkgdesc="v4l2-output for obs-studio"
arch=(x86_64)
url="https://github.com/CatxFish/obs-v4l2sink"
license=('GPL')
groups=()
depends=(obs-studio)
makedepends=('git' 'cmake')
optdepends=('v4l2loopback-dkms: module required to use obs as virtual camera')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
pkgstem=${pkgname%-git}
source=("${pkgstem}::git+${url}.git"
        obs-studio::git+https://github.com/obsproject/obs-studio.git)
noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir"
	local obs v4l2sink
	obs="$(git -C obs-studio describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	v4l2sink="$(git -C obs-v4l2sink describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
        printf "%s+obs%s" "$v4l2sink" "$obs"
}

prepare() {
	cd "$srcdir"
	# If obs is installed, then try to match installed version
	test -z "$obsver" || git -C obs-studio checkout "$obsver" || :
	mkdir -p build
	cd build
	cmake -DLIBOBS_INCLUDE_DIR="../obs-studio/libobs" -DCMAKE_INSTALL_PREFIX=/usr "../${pkgstem}"
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make DESTDIR="$pkgdir/" install
}
