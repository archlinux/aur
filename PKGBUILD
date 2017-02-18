# Maintainer: Thibaud Hulin <thibaud.hulin.cl.atgmail.com>
pkgname=visp
pkgver=3.0.1
pkgrel=1
pkgdesc="A modular library for visual tracking and visual servoing"
arch=('i686' 'x86_64')
url="http://www.irisa.fr/lagadic/visp/"
license=('GPL2' 'custom:ViSP Professional Edition License')
depends=('gsl')
makedepends=('cmake')
optdepends=(
	'xorg-server: used for the image display'
	'gtk2: used for the image display'
	'libxml2: parse XML files for camera and model-based tracker parameters'
	'ogre: for 3D Rendering'
	'ois: for System Input (keyboard, pad, ...)'
	'soqt: interfacing coin with qt'
	'yarp: used for robot commands'
	'v4l-utils: tools to convert video'
	'libfreenect: driver for Kinect'
	'libdc1394: high level programming interface for IEEE1394 digital camera'
	'libusb: access to usb devices'
	'ffmpeg: to manipulate video files'
	'libjpeg-turbo: to convert jpeg files'
	'libpng: to convert png files'
	'doxygen: for documentation'
	'biclops: used for motion control device of Traclabs'
	'zbar: used to read bar codes and QR codes'
	'coin: used for simulation or augmented reality capabilities'
#	'gsl: used for the SVD and LU decompositions'
	'lapack: provides routines for solving systems of simultaneous linear equations'
	'opencv>=2.2.0: provides image converters, a renderer, a feature point tracker and point matching classes'
	'libdmtx: used to read Data Matrix bar codes')
source=("http://gforge.inria.fr/frs/download.php/latestfile/475/${pkgname}-$pkgver.tar.gz")
md5sums=('c5894c6304f45d2c8f9d3b513bee59b4')

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
the ViSP GNU GPL version 2 for developing open source software under the terms of the GPL license,
and the ViSP Commercial Developer License for commercial use.

The ViSP Professional Edition License is the appropriate version to use for the development of proprietary software.
This version is for developers who do not want to share the source code with others,
or otherwise do not comply with the terms of the GNU GPL version 2.0.
In other terms, with the Professional Edition License you avoid the licensing restrictions of the GPL.
If you are interested by this license, contact visp@inria.fr.
EOF
}

package() {
	cd "${srcdir}/${pkgname}-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

