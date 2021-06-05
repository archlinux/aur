# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-graphloopgrain-git
pkgver=r3.db9bbc6
pkgrel=1
pkgdesc='Graph-based audio looping and granulation in Flucoma'
arch=('any')
url='https://github.com/flucoma/graph_loop_grain'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git')
optdepends=('supercollider-flucoma' 'supercollider-flucoma-git')
source=("$pkgname-$pkgver"::git+$url.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver/supercollider"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="/usr/share/supercollider-headers"

		cd "$srcdir/$pkgname-$pkgver/supercollider"
		git submodule update --init --recursive

		mkdir build; cd build
		cmake -DSC_PATH=$SC_SRC ..
		make
}


package() {
	DEST="$pkgdir/usr/share/SuperCollider/Extensions/$pkgname"
	cd "$srcdir/$pkgname-$pkgver/supercollider/build"


	cmake --build . --target install

	# install -Dm755 dist $DEST
	mkdir -p $DEST
	cp -av dist/plugins $DEST/
	cp -av dist/Classes $DEST/
	cp -av dist/HelpSource $DEST/



}

