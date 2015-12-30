# Maintainer: Xentec <xentec at aix0 dot eu>

_name=glbinding
pkgname=${_name}-git
pkgver=1.1.0.r115.gc90891b
pkgrel=1
pkgdesc="A generated C++ binding for the OpenGL API, generated using the gl.xml specification"
arch=('i686' 'x86_64')
url="http://www.glbinding.org/"
license=('MIT')

depends=('libgl')
makedepends=('cmake' 'git')
checkdepends=('gmock')
conflicts=('glbinding')

source=("$pkgname"::'git+https://github.com/cginternals/glbinding.git')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$pkgname"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DOPTION_BUILD_TESTS=0 \
		-DOPTION_BUILD_TOOLS=0 \
		-Wno-dev \
		..

	make
}

check() {
	cd "$pkgname/build"

	cmake \
		-DOPTION_BUILD_TESTS=1 \
		-Wno-dev \
		..

	make
	make test
}

package() {
	cd "$pkgname/build"

	make DESTDIR="$pkgdir" install

	cd ..
	install -D -m644 glbinding-config.cmake "${pkgdir}/usr/lib/cmake/${_name}/glbinding-config.cmake"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

	# clean up
	rm -r "${pkgdir}/usr/share/glbinding"
}

