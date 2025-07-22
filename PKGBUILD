# Maintainer:
pkgname=etlcpp
pkgver=20.42.2
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
	"8b531e8df394f1818c62c240713393692658dadfbfc5ba11df0e36fea6c4f6b33f5b26ee265491bc285dc41033e0f570fc20634b6dea5fccc8f5f7cafe1afe0e"
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
