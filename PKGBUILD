# Maintainer: Zosoled
# Contributor: Paul Hentschel (hpmachining)
# Contributor: greyltc

pkgname="cbang-bastet"
pkgver=8.5.3
pkgrel=1
pkgdesc="Library for cross-platform C++ development."
arch=("x86_64")
url="https://github.com/CauldronDevelopmentLLC/cbang"
license=("LGPL2.1")
depends=(
	v8-r
	libevent
	sqlite
	re2
	libyaml
	zlib
	bzip2
	expat
)
makedepends=(
	git
	scons
)
checkdepends=(
	python
	python-six
)
optdepends=(
	'mariadb-libs: MariaDB database support'
)
provides=(
	cbang
)

source=(
	${url}/archive/refs/tags/bastet-v${pkgver}.tar.gz
	0001_v8_sandbox_enable.patch
	0002_as_string.patch
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
	cd "${srcdir}"/${pkgname}-v${pkgver}
	patch -p1 -i ../0001_v8_sandbox_enable.patch
	patch -p1 -i ../0002_as_string.patch
}

build() {
	cd "${srcdir}"/${pkgname}-v${pkgver}
	scons cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
}

check() {
	cd "${srcdir}"/${pkgname}-v${pkgver}/tests
	scons cxxstd="c++17" disable_local="libevent sqlite3 re2 libyaml zlib bzip2 expat"
	python ./testHarness
}

package() {
	cd "${srcdir}"/${pkgname}-v${pkgver}
	scons install cxxstd="c++17" prefix="${pkgdir}"/opt/${pkgname}
#	install -m644 lib/libcbang.a -t "${pkgdir}"/opt/${pkgname}/lib
#	install -m644 lib/libcbang-boost.a -t "${pkgdir}"/opt/${pkgname}/lib
#	cp -a config/ "${pkgdir}"/opt/${pkgname}/config/
#	cp -a src/boost/boost/ "${pkgdir}"/opt/${pkgname}/include/
#	cp -a include/cbang/ "${pkgdir}"/opt/${pkgname}/include/
#	cp -a include/event2/ "${pkgdir}"/opt/${pkgname}/include/
#	cp -a include/lz4/ "${pkgdir}"/opt/${pkgname}/include/
#	cp -a src/cbang/boost/ "${pkgdir}"/opt/${pkgname}/include/cbang/
}
