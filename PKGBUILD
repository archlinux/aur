# Maintainer:
pkgname=eprosima-fast-dds-monitor
pkgver=1.5.0
pkgrel=1
pkgdesc='eProsima Fast DDS Monitor is a graphical desktop application aimed at monitoring DDS environments deployed using the eProsima Fast DDS library.'
arch=('x86_64')
url='https://github.com/eProsima/Fast-DDS-monitor'
license=('GPL3')
makedepends=('ninja' 'cmake')
depends=('eprosima-fast-dds' 'eprosima-fast-dds-statistics-backend' 'qt5-quickcontrols' 'qt5-charts' 'qt5-quickcontrols2' 'qt5-graphicaleffects')
provides=('eprosima-fast-dds-monitor')

_build_directory=build
_install_directory=/usr

source=(
	"https://github.com/eProsima/Fast-DDS-monitor/archive/refs/tags/v${pkgver}.tar.gz"
	"fast-dds-monitor.desktop"
	"eprosima.png"
)

sha512sums=(
	"9ede02ecdb8efac0b0c5a64bb7311c5b1034058ce6b44cdde44471a8479de59babb57d9249528e693c31b5d07a3a32e4f802b4b111c646e7a4ac547d1521fd60"
	"5dd6d0486e13765e498f9d499bcbe7a2ba78ae12e62be0b5af2997bdcc3a86a4c36baa1c919fd2745c130fdc9eada17621c4ac30a8e0d36bea23b60da5d8e138"
	"54132f15c6f770d8e7a844500a15a16b42f592d7295d09b04130cb8248587d2b825f32bf743c4d0927019392e70fc4d26277f52f03a4b56a65faa0343216e2fa"
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

	mkdir -p ${pkgdir}/usr/share/applications
	cp -ar ${srcdir}/../fast-dds-monitor.desktop ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/usr/share/eprosima
	cp -ar ${srcdir}/../eprosima.png ${pkgdir}/usr/share/eprosima
}
