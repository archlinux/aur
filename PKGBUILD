# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=cppmicroservices-git
pkgver=3.0.0.r369.g4635f63f
pkgrel=1
pkgdesc="The C++ Micro Services library provides a dynamic service registry and module system, partially based the OSGi Core Release 5 specifications."
arch=('i686' 'x86_64')
url="https://github.com/CppMicroServices/CppMicroServices"
license=('custom: Apache2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('cppmicroservices::git+https://github.com/CppMicroServices/CppMicroServices.git'
	'git+https://github.com/boostorg/nowide.git')
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "${pkgname%-*}"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare() {
	cd "${pkgname%-*}"
	git config submodule.third_party/boost/nowide.url $srcdir/nowide
	git submodule update
}

build() {
	cd "${pkgname%-*}"

	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUS_BUILD_SHARED_LIBS=ON
	make
}

package() {
	cd "${pkgname%-*}"/build

	make DESTDIR="${pkgdir}/" install

	install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
