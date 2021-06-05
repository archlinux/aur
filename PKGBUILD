# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-simplexnoise-git
pkgver=r6.6fb3235
pkgrel=1
pkgdesc='SuperCollider implementation of Simplex noise'
arch=('any')
url='https://github.com/esluyter/simplexsynth'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake' 'supercollider-headers-git')
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git)
md5sums=('SKIP')

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
		cmake -DSC_PATH=$SC_SRC -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=$DEST ..
		make
}


package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --build . --config Release --target install
}

