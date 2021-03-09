# Maintainer: Nxxx <nx dot tardis at gmail dot com>
# Maintainer: Thibaud Hulin <thibaud.hulin.cl.atgmail.com>
pkgname=visp
pkgver=3.4.0
pkgrel=1
pkgdesc="A modular library for visual tracking and visual servoing"
arch=('i686' 'x86_64')
url="https://visp.inria.fr"
license=('GPL2+' 'custom:ViSP Professional Edition License')
depends=('eigen')
makedepends=('cmake')
optdepends=(
	'xorg-server: used for the image display'
        'libx11: used for the image display'
	'gtk2: used for the image display'
	'pugixml: Light-weight, simple and fast XML parser for C++ with XPath support'
	'ogre: for 3D Rendering'
	'ois: for System Input (keyboard, pad, ...)'
	'soqt: interfacing coin with qt'
	'yarp: used for robot commands'
	'v4l-utils: tools to convert video'
	'libdc1394: high level programming interface for IEEE1394 digital camera'
	'libjpeg-turbo: to convert jpeg files'
	'libpng: to convert png files'
	'doxygen: for documentation'
	'zbar: used to read bar codes and QR codes'
	'coin: used for simulation or augmented reality capabilities'
	'gsl: used for the SVD and LU decompositions'
	'lapack: provides routines for solving systems of simultaneous linear equations'
        'eigen: used for linear algebra (matrix inversion, SVD'
	'opencv: provides image converters, a renderer, a feature point tracker and point matching classes'
        'zbar: used to read QR codes'
	'libdmtx: used to read Data Matrix bar codes')
source=("https://github.com/lagadic/visp/archive/v$pkgver.tar.gz")
md5sums=('41c1a92473ecacfa646306f2b6cae240')

build() {
	cd "${srcdir}/${pkgname}-$pkgver"
	# TEMP FIX: remove $srcdir usage by adding a flag NO_BUILD_ROOT in CMakesList.txt
	sed -i.bak -e '/^set(VISP_ROOT_DIR_DATA_CONFIGCMAKE/ i\
	if(NO_BUILD_ROOT)' -e '/^set(VISP_ROBOT_ARMS_DIR \${VISP_ROOT_DIR_DATA_CONFIGCMAKE}\/data\/robot-simulator)$/ a\
	endif()' CMakeLists.txt

	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DCMAKE_INSTALL_LIBDIR="lib"\
		-DBUILD_EXAMPLES=OFF \
		-DBUILD_TUTORIALS=OFF \
		-DBUILD_TESTS=OFF \
		-DBUILD_DEMOS=OFF \
		-DNO_BUILD_ROOT=OFF .
	make -j4
	cat << 'EOF' > ./COPYING

ViSP software is available under two different licenses:
the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or
(at your option) any later version
and the ViSP Commercial Developer License for commercial use.

The ViSP Professional Edition License is the appropriate version to use for the development of proprietary software.
This version is for developers who do not want to share the source code with others,
or otherwise do not comply with the terms of the GNU GPL version 2.0 or later.
In other terms, with the Professional Edition License you avoid the licensing restrictions of the GPL.
If you are interested by this license, contact visp@inria.fr.
EOF
}

package() {
	cd "${srcdir}/${pkgname}-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


