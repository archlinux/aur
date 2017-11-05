# Maintainer of this PKBGUILD file: Martino Pilia <martino.pilia@gmail.com>
_pkgname=elastix
pkgname=${_pkgname}-git
pkgver=4.304@3344.r945.g522843d9
pkgrel=1
pkgdesc='Toolbox for rigid and nonrigid registration of images'
arch=('x86_64')
url='http://elastix.isi.uu.nl/'
license=('apache')
provides=('elastix')
depends=('insight-toolkit')
makedepends=('cmake')
optdepends=()
source=('git+https://github.com/SuperElastix/elastix.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | \
	  sed 's/^elastix_0//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	git checkout master

	# will not build with C++ 11
	sed -i '15iset(CMAKE_CXX_FLAGS_RELEASE "-std=c++03")' \
		CMakeLists.txt

	mkdir build || :
	cd build

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" \
		-DCMAKE_BUILD_TYPE:STRING=Release
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make install

	mkdir elastix
	mv $pkgdir/usr/include/* elastix/.
	mv elastix $pkgdir/usr/include/.

	cd ..

	install -D -m644 \
		"src/LICENSE" \
		"$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

	install -D -m644 \
		"src/NOTICE" \
		"$pkgdir/usr/share/licenses/$_pkgname/NOTICE"
}
