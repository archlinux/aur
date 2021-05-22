# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=oatpp-sqlite
pkgname="${_pkgname}-git"
pkgver=1.2.5.r0.g85f7eee
pkgrel=1
pkgdesc="SQLite adapter for oatpp ORM."
arch=('x86_64')
url="https://github.com/oatpp/oatpp-sqlite"
license=('Apache')
depends=('oatpp')
makedepends=('cmake' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
epoch=1
source=(
  "${_pkgname}::git+https://github.com/oatpp/oatpp-sqlite.git"
	'module-config.cmake.in.patch'
	'module-install.cmake.patch'
	'CMakeLists.txt.patch'
)
md5sums=(
  'SKIP'
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
	patch -p0 < module-config.cmake.in.patch
	patch -p0 < module-install.cmake.patch
	patch -p0 < CMakeLists.txt.patch

	cd "${_pkgname}"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DOATPP_SQLITE_AMALGAMATION=ON ..
	cmake --build .
}

package() {
	cd "$srcdir/${_pkgname}/build"
	make install DESTDIR="${pkgdir}"
}
