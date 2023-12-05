# Maintainer: Graham Gower <graham dot gower at gmail dot com>
_gitname=SLiM
_gittag=v4.1  # tag, branch, or commit; comment out to use latest
pkgname=slim-simulator
pkgver=4.1.r0.g45b0e9ba
pkgrel=1
pkgdesc="A forwards-time population genetic simulator."
arch=("x86_64")
url="https://messerlab.org/slim/"
license=('GPL3')
depends=("qt5-base")
makedepends=("git" "cmake")
conflicts=("slim") # a display manager, also called SLiM
source=("git+https://github.com/MesserLab/${_gitname}.git")
md5sums=('SKIP')

prepare() {
	if [ ! -z "$_gittag" ] ; then
		cd "${_gitname}"
		git checkout $_gittag \
			|| (echo "Couldn't checkout '${_gittag}'"; exit 1)
		cd ..
	fi
	mkdir -p build
}

pkgver() {
	cd "${srcdir}/${_gitname}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd build
	cmake \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D BUILD_SLIMGUI=ON \
		../${_gitname} \
		|| (echo "cmake failed"; exit 1)
	make || (echo "make failed"; exit 1)
}

check() {
	cd build
	echo "Running 'slim -testEidos'..."
	./slim -testEidos || (echo "Eidos tests failed"; exit 1)
	echo "Running 'slim -testSLiM'..."
	./slim -testSLiM || (echo "SLiM tests failed"; exit 1)
}

package() {
	cd build
	make DESTDIR="$pkgdir" install || (echo "make install failed"; exit 1)
}
