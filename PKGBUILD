# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Official Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

# Based on the official opencv PKGBUILD

pkgname=opencv-java
_pkgbase=opencv
pkgver=2.4.10
pkgrel=2
pkgdesc="Open Source Computer Vision Library - Java bindings"
arch=('i686' 'x86_64')
license=('BSD')
url="http://opencv.org/"
depends=(
	'intel-tbb'
	'openexr'
	'xine-lib'
	'libdc1394'
	'gtkglext'
	"opencv=$pkgver"
	)
makedepends=(
	'cmake'
	'python2-numpy'
	'mesa'
	'eigen2'
	# Needed for the Java binding
	'apache-ant'
	'java-environment'
	)
optdepends=(
	'opencv-samples'
	'eigen2'
	'libcl: For coding with OpenCL'
	'python2-numpy: Python 2.x interface'
	)
# Sources and checksums section
source=(
	"http://downloads.sourceforge.net/opencvlibrary/$_pkgbase-$pkgver.zip"
	'pkgconfig.patch'
	'fsh.patch'
	'x86_asmfix.patch'
	)
md5sums=(
	'ec63952d3a3dff965d5fdde765926821'
	'c7cea48ed7d4f729ebdb9673bac41bd3'
	'c597598d142dd34d0eb4af7d6e9779d8'
	'b937d3589a62666f17f6dc93e0109717'
	)

# CMake flags
_cmakeopts=('-D WITH_OPENCL=ON'
	'-D WITH_OPENGL=ON'
	'-D WITH_TBB=ON'
	'-D WITH_XINE=ON'
	'-D WITH_GSTREAMER=OFF'
	'-D BUILD_WITH_DEBUG_INFO=OFF'
	'-D BUILD_TESTS=OFF'
	'-D BUILD_PERF_TESTS=OFF'
	'-D BUILD_EXAMPLES=ON'
	'-D INSTALL_C_EXAMPLES=ON'
	'-D INSTALL_PYTHON_EXAMPLES=ON'
	'-D CMAKE_BUILD_TYPE=Release'
	'-D CMAKE_INSTALL_PREFIX=/usr'
	'-D CMAKE_SKIP_RPATH=ON'
	)

# SSE only available from Pentium 3 onwards (i686 is way older)
[[ "$CARCH" = 'i686' ]] && \
_cmakeopts+=(
	'-D ENABLE_SSE=OFF'
	'-D ENABLE_SSE2=OFF'
	'-D ENABLE_SSE3=OFF'
	)

# all x64 CPUs support SSE2 but not SSE3
[[ "$CARCH" = 'x86_64' ]] && _cmakeopts+=('-D ENABLE_SSE3=OFF')

# prepare() and build() are the official ones
prepare() {
	cd "$srcdir/$_pkgbase-$pkgver"

	msg2 "Applying backported fix for x86 ASM breakage"
	# see https://github.com/Itseez/opencv/pull/3331
	patch -Np1 -i "$srcdir/x86_asmfix.patch"

	msg2 "Fixing broken pkg-config (downstream)"
	# see https://bugs.archlinux.org/task/32430
	# and http://code.opencv.org/issues/1925
	patch -Np1 -i "$srcdir/pkgconfig.patch"

	# TODO: this is mostly upstream frei0r; they hardcode the path
	#msg2 "Hack-fixing folder naming inconsistency (downstream)"
	# see http://code.opencv.org/issues/2512
	# and https://bugs.archlinux.org/task/32342
	#patch -Np1 -i "$srcdir/fsh.patch"

	# no longer including docs, see https://bugs.archlinux.org/task/34185
	# python2 compatibility for generating (html) docs
	#sed -i 's/sphinx-build/sphinx-build2/' cmake/OpenCVDetectPython.cmake

	# Setting JAVA_HOME
	msg2 "Setting JAVA_HOME variable"
	export JAVA_HOME="/usr/lib/jvm/$(archlinux-java get)"
}

build() {
	cd "$srcdir/$_pkgbase-$pkgver"

	cmake ${_cmakeopts[@]} .

	make
}

# Changed in order to save just Java files
# It's a bit dirty, but it works
package() {

	# Entering in the source directory
	cd "$srcdir/$_pkgbase-$pkgver"

	# Making a fake install
	mkdir -p "$srcdir/temp"
	make DESTDIR="$srcdir/temp" install

	# Creating the package structure
	mkdir -p "$pkgdir/usr/share/opencv/java"
	# Installing the built files
	cp -r "$srcdir/temp/usr/share/OpenCV/java" "$pkgdir/usr/share/opencv"

	# Create a symbolic link in /usr/share/java as Java apps written for Ubuntu may be looking there
	mkdir -p "$pkgdir/usr/share/java/"
	# Get the number in the Jar filename
	_number=$(echo $pkgver | sed 's/\.//g')
	ln -s "/usr/share/opencv/java/opencv-$_number.jar" "$pkgdir/usr/share/java/opencv.jar"

	# Removing the junk
	rm -r "$srcdir/temp"
}
