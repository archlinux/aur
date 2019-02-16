# Maintainer: Xentec <xentec at aix0 dot eu>

_name=glbinding
pkgname=${_name}-git
pkgver=2.1.3.r105.gc9909596
pkgrel=1
pkgdesc="A generated C++ binding for the OpenGL API, generated using the gl.xml specification"
arch=('i686' 'x86_64')
url="http://www.glbinding.org/"
license=('MIT')

depends=('glfw' 'libgl' 'mesa')
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
	mkdir -p build && cd build

	cmake -Wno-dev \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DOPTION_BUILD_TESTS=0 \
		"../$pkgname"

	make
}

check() {
	cd build

	cmake -Wno-dev \
		-DOPTION_BUILD_TESTS=1 \
		"../$pkgname"

	make
	make test
}

package() {
	export DESTDIR="$pkgdir"
	make -C build install

	install -D -m644 "$pkgname"/LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

	# conflict with mesa-demos
	mv -v "${pkgdir}/usr/bin/glinfo" "${pkgdir}/usr/bin/glinfo-glb"
	rm -vr "${pkgdir}/usr/include/KHR"
}

