# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=rgbdemo
pkgver=0.6.1
pkgrel=1
pkgdesc="The Internet Communications Engine Embedded (IceE) is a modern distributed computing platform"
arch=('i686' 'x86_64')
url="http://nicolas.burrus.name/index.php/Research/KinectRgbDemoV6"
license=('LGPL')
depends=('libfreenect' 'opencv' 'eigen3' 'libflann' 'boost' 'pcl' 'freeglut' 'glew' 'qt' 'cminpack' 'qhull')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/project/roboticslab/RGBDemo-${pkgver}-Source.tar.gz
		ntk.patch
		rgb_demo.patch)
md5sums=('0954c58abb183431c43f0019dd2e3f3a'
		 'bd4edd6c94853edfae5b239a7be5dde2'
		 '661a085eb1b8b4b02954d2478cebd8fb')

build() {
	cd "${srcdir}/RGBDemo-${pkgver}-Source"
	
	#patch -p1 < ../rgb_demo.patch
	patch -p1 < ../ntk.patch
	
	sed 's/NAMES cminpack/NAMES minpack/g' nestk/cmake/FindCMinpack.cmake -i
	sed 's/SET(NESTK_USE_OPENNI 1)/SET(NESTK_USE_OPENNI 0)/g' CMakeLists.txt -i
	sed 's/ADD_LIBRARY(glew SHARED src\/glew.c)/ADD_LIBRARY(glew STATIC src\/glew.c)/g' nestk/deps/glew/CMakeLists.txt -i
	sed 's/SET_TARGET_PROPERTIES(glew PROPERTIES/SET_TARGET_PROPERTIES(glew PROPERTIES COMPILE_FLAGS -fPIC/g' nestk/deps/glew/CMakeLists.txt -i
	sed 's/SET(FREENECT_LIBRARIES freenect)/SET(FREENECT_LIBRARIES freenectstatic)/g' nestk/deps/cmake/UseNestkDeps.cmake.in -i
	
	if [ ! -d build ]; then mkdir build; fi
	cd build
	
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DNESTK_USE_PCL=False -DNESTK_USE_FREENECT=True \
		-DNESTK_USE_OPENNI=False -DNESTK_USE_EMBEDDED_FREENECT=True \
		-DNESTK_USE_EMBEDDED_GLEW=True -DNESTK_USE_EMBEDDED_EIGEN=False \
		-DNESTK_USE_EMBEDDED_OPENNI=False -DCMAKE_BUILD_TYPE= RelWithDebInfo ..
	make
}

package() {
	cd "${srcdir}/RGBDemo-${pkgver}-Source/build"
	
	make DESTDIR="${pkgdir}" install
	
	rm -rf "${pkgdir}/usr/bin/glview"
	rm -rf "${pkgdir}/usr/share/"
	rm -rf "${pkgdir}/usr/include/libfreenect/"
	rm -rf "${pkgdir}/usr/include/GL/"
	rm -rf "${pkgdir}/usr/lib/pkgconfig/"
	rm -rf "${pkgdir}/usr/lib/libfreenect.a"
	rm -rf "${pkgdir}/usr/lib/libfreenect.so"
	rm -rf "${pkgdir}/usr/lib/libfreenect.so.0.0"
	rm -rf "${pkgdir}/usr/lib/libfreenect.so.0.0.1"
	rm -rf "${pkgdir}/usr/lib/libglew.a"
}

