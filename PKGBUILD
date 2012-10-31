# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=libfreenect-git
pkgver=20121031
pkgrel=1
pkgdesc="Drivers and libraries for the Xbox Kinect device on Linux"
arch=('i686' 'x86_64')
url="http://openkinect.org"
license=('GPL')
depends=('libusb' 'glu' 'freeglut' 'bash')
makedepends=('cmake' 'git' 'libxmu')
provides=('libfreenect')
conflicts=('libfreenect')
source=()
md5sums=()

_gitroot="https://github.com/OpenKinect/libfreenect.git"
_gitname=libfreenect

build() {
	cd "${srcdir}"
	
	if [ ! -d "${srcdir}/${_gitname}" ]; then
		git clone ${_gitroot}
	else
		cd ${_gitname} && git pull origin
	fi
	
	msg "GIT checkout done."

	cd "${srcdir}"
	cp -rf "${_gitname}" "${_gitname}-build"
	cd "${_gitname}-build"
	
	# Install "libfreenect.hpp" to "/usr/include/libfreenect"
	sed 's/DESTINATION include/DESTINATION ${PROJECT_INCLUDE_INSTALL_DIR}/g' -i "wrappers/cpp/CMakeLists.txt"
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DPROJECT_INCLUDE_INSTALL_DIR=/usr/include -DLIB_SUFFIX="" .
	make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	
	make DESTDIR="${pkgdir}" install
	install -Dm644 platform/linux/udev/51-kinect.rules "${pkgdir}/etc/udev/rules.d/51-kinect.rules"
	
	# Patch include files
	sed 's/<libfreenect.h>/<libfreenect\/libfreenect.h>/g' -i "${pkgdir}/usr/include/libfreenect/libfreenect.hpp"
}
