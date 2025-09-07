# Maintainer:
pkgname=etlcpp
pkgver=20.43.1
pkgrel=1
pkgdesc='Embedded Template Library (ETL)'
arch=('x86_64')
url='https://github.com/ETLCPP/etl'
license=('MIT')
makedepends=('ninja' 'cmake')
provides=('etlcpp')

_build_directory=build
_tarball_extension=.tar.gz
_version_string=${pkgver}
_tarball_etl=etl-${_version_string}${_tarball_extension}

source=(
	"${_tarball_etl}::https://github.com/ETLCPP/etl/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
	"b84f4bc0f5d128a5e3a9fd90830e6cb317a6fde965aadf46a7da1c292ca746d39d1a4328ad0320ac62fa318675f7bd3d5b8d6f069fe864eac947160091ecdc24"
)

prepare() {
	build_type=Release

	cmake -G Ninja \
		-S "${srcdir}"/etl-${_version_string} \
		-B "${srcdir}"/${_build_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install
	install -Dm644 "${srcdir}"/etl-${_version_string}/LICENSE --target-directory=${pkgdir}/usr/share/licenses/${pkgname}
}
