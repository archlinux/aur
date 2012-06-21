# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=orocos-log4cpp
_pkgname=orocos-toolchain
pkgver=2.5.0
pkgrel=1
pkgdesc="Open Robot Control Software is a tool to create real-time robotics applications using modular, run-time configurable software components (log4cpp)"
arch=('i686' 'x86_64')
url="http://www.orocos.org/rtt"
license=('GPL')
groups=('orocos-toolchain')
makedepends=('cmake')
source=(http://www.orocos.org/stable/toolchain/v${pkgver}/${_pkgname}-${pkgver}-src.tar.bz2)
md5sums=('cb817efca78ae5659a3ca62a741e43bf')

build() {
	# build log4cpp
	cd "${srcdir}/${_pkgname}-${pkgver}/log4cpp"
	
	sed 's#DESTINATION include#DESTINATION include/orocos#g' -i CMakeLists.txt
	sed 's#${CMAKE_BINARY_DIR}/log4cpp.pc#${CMAKE_BINARY_DIR}/orocos-log4cpp.pc#g' -i CMakeLists.txt
	sed 's#LOG4CPP_LIBRARY_NAME "log4cpp"#LOG4CPP_LIBRARY_NAME "orocos-log4cpp"#g' -i CMakeLists.txt
	sed 's#SET(includedir "\\${prefix}/include")#SET(includedir "\\${prefix}/include/orocos")#g' -i CMakeLists.txt
	sed 's#-llog4cpp#-lorocos-log4cpp#g' -i log4cpp.pc.in
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	# install log4cpp
	cd "${srcdir}/${_pkgname}-${pkgver}/log4cpp"
	make DESTDIR=${pkgdir} install
}

