# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-flucoma-git
pkgver=r1179.5956e97
pkgrel=1
pkgdesc='Fluid Corpus Manipulation plugins for Supercollider'
arch=('any')
url='https://github.com/flucoma/flucoma-sc'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git')
conflicts=("supercollider-flucoma")
optdepends=()
source=(
	"$pkgname-$pkgver"::git+$url.git
	"flucoma-core"::git+https://github.com/flucoma/flucoma-core.git
	)
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="/usr/share/supercollider-headers"

		cd "$srcdir/$pkgname-$pkgver"
		git submodule update --init --recursive

		mkdir build; cd build
		DEST="$pkgdir/usr/share/SuperCollider/Extensions"
		FLUCOMA_CORE=$srcdir/flucoma-core
		cmake -DFLUID_PATH=$FLUCOMA_CORE -DSC_PATH=$SC_SRC -DCMAKE_INSTALL_PREFIX=$DEST ..
		make

		# cmake -DSC_PATH=<location of your SC source> -DFLUID_PATH=<location of Fluid Corpus Manipulation Library> ..

}


package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --build . --config Release --target install
}

