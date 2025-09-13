# Maintainer:
pkgname=etlcpp
pkgver=20.43.4
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
	"02af79827c29b45c4e4724f197050210c3e415fc6ecee16f26eb92a2bfa332237b98de5f9895238209236a5c97f258635665f2474f55be303aec9080bd44128e"
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
