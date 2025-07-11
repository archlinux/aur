# Maintainer:
pkgname=etlcpp
pkgver=20.42.0
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
	"6f877cc7bde451e24db43ba32bc5c03073c7e882eb50211d626068b0b390fed489265419ea19aa7f134efadc1fb5ae525da063c8099284952958115765005e43"
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
