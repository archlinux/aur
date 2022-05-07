# Maintainer:
pkgname=eprosima-fast-dds-monitor
pkgver=1.1.0
pkgrel=0
pkgdesc='eProsima Fast DDS Monitor is a graphical desktop application aimed at monitoring DDS environments deployed using the eProsima Fast DDS library.'
arch=('x86_64')
url='https://github.com/eProsima/Fast-DDS-monitor'
license=('GPL3')
makedepends=('ninja' 'cmake')
depends=('eprosima-fast-dds' 'eprosima-fast-dds-statistics-backend' 'qt5-quickcontrols')
provides=('eprosima-fast-dds-monitor')

_build_directory=build
_install_directory=/usr

source=(
	"https://github.com/eProsima/Fast-DDS-monitor/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	"e35a1b215f1a3b192ae9e433bd343481443a75936cbad402d3d71060c5feaf6ec5c909430cbb3b5a06ca449b42e18d825408d9e8029b511ff21b3e4d69671a08"
)

prepare() {
	build_type=Release

	cmake -G Ninja \
		-S "${srcdir}"/Fast-DDS-monitor-${pkgver} \
		-B "${srcdir}"/${_build_directory} \
		-DCMAKE_BUILD_TYPE=${build_type} \
		-DCMAKE_CONFIGURATION_TYPES:STRING=${build_type} \
		-DCMAKE_INSTALL_PREFIX:PATH=${_install_directory} \
		-DBUILD_MOCK=OFF \
		-DBUILD_TESTS=OFF \
		-DBUILD_APP_TESTS=OFF \
		-DBUILD_DOCUMENTATION=OFF
}

build() {
	cd "${srcdir}"/${_build_directory}
	ninja
}

package() {
	cd "${srcdir}"/${_build_directory}
	DESTDIR="${pkgdir}" ninja install

	mkdir -p "${pkgdir}"/usr/share/licenses/eprosima/fastdds_monitor
	mv "${pkgdir}"/usr/share/fastdds_monitor/LICENSE "${pkgdir}"/usr/share/licenses/eprosima/fastdds_monitor/LICENSE
	rmdir "${pkgdir}"/usr/share/fastdds_monitor
}
