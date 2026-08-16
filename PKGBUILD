# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-opencv
pkgver=5.0.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library (mingw-w64)"
arch=('any')
license=('Apache-2.0')
url="http://opencv.org/"
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-crt' 'mingw-w64-libpng' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libtiff' 'mingw-w64-zlib' 'mingw-w64-libwebp' 'mingw-w64-lapack' 'mingw-w64-cblas' 'mingw-w64-openjpeg2' 'mingw-w64-openexr')
makedepends=('mingw-w64-cmake' 'mingw-w64-eigen' 'mingw-w64-lapacke' 'ninja')
source=("opencv-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.tar.gz"
  "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz"
  "0004-generate-proper-pkg-config-file.patch"
  "0008-mingw-w64-cmake-lib-path.patch"
  "$pkgname-29343.patch::https://github.com/opencv/opencv/pull/29343.patch")
sha256sums=('b0528f5a1d379d59d4701cb28c36e22214cc51cf64594e5b56f2d3e6c0233095'
            'c58f6344170c39abf187c56f3843b59cab1fd3e89cf19ba2ce25dc061659b27f'
            '7fac6a7788638f8843f562381413ce13c59038d2fafc5dc05258195128e5caf5'
            '7398e66f80be37382bd427b5eb3a1201a23113c14e71435a44df8779ea1b8a34'
            '71dc33f7b69f73e0f8a7063c0012bd3f501adb527039f47be0e0891130f89f02')

_srcdir="opencv-$pkgver"
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

_cmakeopts=(-Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG'
            '-DCMAKE_SKIP_RPATH=ON'
            '-DBUILD_TESTS=OFF'
            '-DBUILD_PERF_TESTS=OFF'
            '-DBUILD_DOCS=OFF'
            '-DBUILD_WITH_DEBUG_INFO=OFF'
            '-DBUILD_opencv_apps=OFF'
            '-DWITH_FFMPEG=OFF'
            '-DWITH_GSTREAMER=OFF'
            '-DWITH_OPENCL=OFF'
            '-DWITH_QT=OFF'
            '-DINSTALL_C_EXAMPLES=OFF'
            '-DINSTALL_PYTHON_EXAMPLES=OFF'
            '-DBUILD_ZLIB=OFF'
            '-DBUILD_TIFF=OFF'
            '-DBUILD_JASPER=OFF'
            '-DBUILD_JPEG=OFF'
            '-DBUILD_PNG=OFF'
            '-DBUILD_WEBP=OFF'
            '-DBUILD_OPENEXR=OFF'
            '-DWITH_VTK=OFF'
            '-DWITH_IPP=OFF'
            '-DWITH_DSHOW=OFF'
            '-DWITH_EIGEN=ON'
            '-DOPENCV_GENERATE_PKGCONFIG=ON'
            '-DOPENCV_GENERATE_SETUPVARS=OFF')

prepare() {
	cd "${_srcdir}"
	sed -i 's|WIN32|MSVC|' 'cmake/OpenCVInstallLayout.cmake'
	sed -i 's|if(WIN32)|if(0)|' 'cmake/OpenCVFindOpenEXR.cmake'
	sed -i 's|if(CMAKE_HOST_UNIX)|if(CMAKE_HOST_UNIX OR MINGW)|' 'cmake/OpenCVDetectPython.cmake'
	sed -i 's|if(ANDROID OR NOT UNIX)|if((ANDROID OR NOT UNIX) AND NOT MINGW)|' 'CMakeLists.txt'
	patch -Np1 -i "$srcdir/0004-generate-proper-pkg-config-file.patch"
	patch -Np1 -i "$srcdir/0008-mingw-w64-cmake-lib-path.patch"
	patch -p1 -i "$srcdir/$pkgname-29343.patch"
}

build() {
	for _arch in ${_architectures}; do
		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-static" "${_cmakeopts[@]}" \
			-DBUILD_SHARED_LIBS=OFF \
			-DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
			-DEIGEN_INCLUDE_PATH="/usr/${_arch}/include/eigen3" \
			-DCMAKE_INSTALL_PREFIX="/usr/${_arch}/static"
		cmake --build "build-${_arch}-static"

		${_arch}-cmake -G Ninja -S "${_srcdir}" -B "build-${_arch}-shared" "${_cmakeopts[@]}" \
			-DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
			-DEIGEN_INCLUDE_PATH="/usr/${_arch}/include/eigen3"
		cmake --build "build-${_arch}-shared"
	done
}

package() {
	for _arch in ${_architectures}; do
		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-static"
		rm -rf "$pkgdir"/usr/${_arch}/static/share
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/static/lib/*.a

		DESTDIR="${pkgdir}" cmake --install "build-${_arch}-shared"
		${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
		${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

		rm -rf "$pkgdir/usr/${_arch}/static/include/opencv5"
		ln -s '../../include/opencv5' "$pkgdir/usr/${_arch}/static/include/opencv5"
	done
}

# vim: ts=2 sw=2 et:
