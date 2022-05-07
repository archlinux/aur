# Maintainer:
pkgname=eprosima-fast-dds-statistics-backend
pkgver=0.6.0
pkgrel=0
pkgdesc='eProsima Fast DDS Statistics Backend is a C++ library that provides collection and procession the statistics measurements reported by Fast DDS Statistics Module.'
arch=('x86_64')
url='https://github.com/eProsima/Fast-DDS-statistics-backend'
license=('Apache')
makedepends=('ninja' 'cmake')
depends=('tinyxml' 'asio')  # for documentation add: 'doxygen' 'python' 'python-pip' 'python-virtualenv' 'python-sphinx' 'python-breathe' 'python-sphinxcontrib-spelling' 'python-doc8' 'imagemagick'
provides=('eprosima-fast-dds-statistics-backend')

_build_directory=build
_install_directory=/usr

source=(
	"https://github.com/eProsima/Fast-DDS-statistics-backend/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	"dad68fc40b74bd7d08256eb24e203629b6e1babc1f1c027b294c6f6715491322fd6f5fe46d6647f8f7d2f70e437251d4cb59fa4642ad6933f5e5f5c1311a78d9"
)

prepare() {
	build_type=Release

	cmake -G Ninja \
		-S "${srcdir}"/Fast-DDS-statistics-backend-${pkgver} \
		-B "${srcdir}"/${_build_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_CONFIGURATION_TYPES:STRING=${build_type} \
		-DCMAKE_INSTALL_PREFIX:PATH=${_install_directory} \
		-DBUILD_SHARED_LIBS=ON \
		-DCOMPILE_EXAMPLES=OFF \
		-DBUILD_TESTS=OFF \
		-DBUILD_LIBRARY_TESTS=ON \
		-DBUILD_DOCUMENTATION=OFF
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install


	mkdir -p "${pkgdir}"/usr/share/licenses/eprosima/fastdds_statistics_backend
	mv "${pkgdir}"/usr/share/fastdds_statistics_backend/LICENSE "${pkgdir}"/usr/share/licenses/eprosima/fastdds_statistics_backend/LICENSE
	rmdir "${pkgdir}"/usr/share/fastdds_statistics_backend
}
