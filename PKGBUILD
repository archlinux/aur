# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-vbugens-git
pkgver=r34.96794ed
pkgrel=1
pkgdesc="Volker Böhm's UGen collection"
arch=('any')
url='https://github.com/v7b1/vb_UGens'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake')
optdepends=()
source=("$pkgname-$pkgver"::git+$url.git
        'supercollider-source::git+https://github.com/supercollider/supercollider.git')
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/$pkgname-$pkgver"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
		SC_SRC="$srcdir/supercollider-source"

		cd $SC_SRC 
		git submodule update --init --recursive

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

