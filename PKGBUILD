# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=oatpp
pkgname="${_pkgname}-git"
pkgver=1.2.5.r29.g37cab34
pkgrel=1
pkgdesc="Oat++ is an open-source C++ web framework for highly scalable and resource-efficient web applications."
arch=('x86_64')
url="https://github.com/oatpp/oatpp"
license=('Apache')
depends=()
makedepends=('cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=(
  "${_pkgname}::git+https://github.com/oatpp/oatpp.git"
  'module-install.cmake.patch'
	'module-config.cmake.in.patch'
)
md5sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"
	patch -p0 < module-install.cmake.patch
	patch -p0 < module-config.cmake.in.patch

	cd "${_pkgname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make install DESTDIR="${pkgdir}"
}
