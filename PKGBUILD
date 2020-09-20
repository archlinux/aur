# Maintainer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)
pkgname=obs-motion-effect-git
obsver=$(obs --version | sed -e 's/[^0-9]*//;s/\(-\|\.[^0-9]\).*//' 2>/dev/null)
pkgver=1.2.1.r3.167596a+obs25.0.8
pkgrel=2
pkgdesc="v4l2-output for obs-studio"
arch=(x86_64)
url="https://github.com/CatxFish/motion-effect"
license=('GPL')
groups=()
depends=(obs-studio)
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
pkgstem=${pkgname%-git}
pkgstem=${pkgstem#obs-}
source=("${pkgstem}::git+${url}.git"
        obs-studio::git+https://github.com/obsproject/obs-studio.git)
noextract=()
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir"
	local obs v4l2sink
	obs="$(git -C obs-studio describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	gitver="$(git -C "$pkgstem" describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
        printf "%s+obs%s" "$gitver" "$obs"
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
