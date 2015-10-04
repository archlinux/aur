# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Official Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

# Based on the official opencv PKGBUILD

pkgname=opencv-java
_pkgbase=opencv
pkgver=2.4.12.2
pkgrel=1
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
source=("$pkgbase-$pkgver::https://github.com/Itseez/opencv/archive/$pkgver.zip")
md5sums=('5f7cde7f0bccd90542805ea20687fc8d')

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
	# Setting JAVA_HOME
	msg2 "Setting JAVA_HOME variable"
	export JAVA_HOME="/usr/lib/jvm/default"
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
