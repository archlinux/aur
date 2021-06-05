# Maintainer: Mads Kjeldgaard<mail@madskjeldgaard.dk>
pkgname=supercollider-mkplugins-git
pkgver=r235.fa9bd99
pkgrel=1
pkgdesc="Mads Kjeldgaard's plugins for SuperCollider"
arch=('any')
url='https://github.com/madskjeldgaard/mkplugins'
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
makedepends=('git' 'cmake')
optdepends=()
conflicts=("supercollider-mkplugins")
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

