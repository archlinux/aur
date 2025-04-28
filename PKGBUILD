# Maintainer:
pkgname=etlcpp
pkgver=20.40.0
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
	"a4b0321711a8f32a934b05935bad3942c10660b7a85f00080194e5122129319215a8441011cd515c98f946d25161ecb2b12a084a72120f90722566a744d08c24"
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
