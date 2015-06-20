# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=cppmicroservices-git
pkgver=v2.1.1.r0.g13080ed
pkgrel=1
pkgdesc="The C++ Micro Services library provides a dynamic service registry and module system, partially based the OSGi Core Release 5 specifications."
arch=('i686' 'x86_64')
url="https://github.com/saschazelzer/CppMicroServices"
license=('custom: Apache2.0')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('cppmicroservices::git://github.com/saschazelzer/CppMicroServices.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-*}"

	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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
