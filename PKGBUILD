# Maintainer: Xentec <xentec at aix0 dot eu>

pkgname=glbinding-git
pkgver=v1.1.0.r34.gf7d082c
pkgrel=1
pkgdesc="A generated C++ binding for the OpenGL API, generated using the gl.xml specification"
arch=('i686' 'x86_64')
url="http://www.glbinding.org/"
license=('MIT')

depends=('libgl')
makedepends=('cmake' 'git')
checkdepends=('gmock' 'gtest')
conflicts=('glbinding')

source=("$pkgname"::'git+https://github.com/cginternals/glbinding.git')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DOPTION_BUILD_TESTS=0 \
		-DOPTION_BUILD_STATIC=0 \
		-DOPTION_GL_BY_STRINGS=1 \
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
	cd "$pkgname"

	install -D -m644 glbinding-config.cmake "${pkgdir}/usr/lib/cmake/${pkgname}/glbinding-config.cmake"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	DESTDIR="$pkgdir" make install

	rm -r "${pkgdir}/usr/share/glbinding"
}

