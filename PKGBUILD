# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Official Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

# Based on the official opencv PKGBUILD
pkgname=opencv-java
_pkgname=opencv
pkgver=4.0.1
pkgrel=1
pkgdesc="Open Source Computer Vision Library - Java bindings"
arch=(i686 x86_64)
license=(BSD)
url="http://opencv.org/"
depends=("$_pkgname>=$pkgver" java-runtime)
# Last two makedepends are needed for the Java binding
makedepends=(cmake python-numpy python-setuptools mesa eigen hdf5 lapacke gtk3 vtk glew
             apache-ant java-environment)
optdepends=('opencv-samples: OpenCV samples')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.tar.gz"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('7b86a0ee804244e0c407321f895b15e4a7162e9c5c0d2efc85f1cadec4011af4'
            '0d8acbad4b7074cfaafd906a7419c23629179d5e98894714402090b192ef8237')
# Removed all the CMake flags manipulation;
# hopefully, SSE will be automagically disabled properly on i686

# Uncomment this line to have a limited build; this would build only the basic Java bindings
# with its dependencies, ignoring all the standard needed libraries.
#_limited_build="1"

prepare() {
  # Setting JAVA_HOME
  msg2 "Setting JAVA_HOME variable"
  export JAVA_HOME="/usr/lib/jvm/default"
  mkdir -p build
}

build() {
  cd build

  # Have a limited build, if any
  if [ -n "$_limited_build" ]
  then
    msg2 "Building just the Java modules ..."
    _extra_cmake_flags="-DBUILD_LIST=java"
  fi

  # The flags are almost as the original package, just tweaked for easier and speedier builds
  _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`
  cmake \
    "$_extra_cmake_flags" \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCPU_BASELINE_DISABLE=SSE3 \
    -DCPU_BASELINE_REQUIRE=SSE2 \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DOPENCV_SKIP_PYTHON_LOADER=ON \
    -DOPENCV_PYTHON3_INSTALL_PATH=$_pythonpath \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    -DOPENCV_GENERATE_PKGCONFIG=ON \
    ../$_pkgname-$pkgver
  make
}

# Changed in order to save just Java files
# It's a bit dirty, but it works
package() {
  cd build

  msg2 "Making a fake install ..."
  mkdir -p "$srcdir/temp"
  make DESTDIR="$srcdir/temp" install

  # Testing block! This is useful for checking which files are unique for
  # this package.
  #pacman -Qlq opencv  | sed 's|/$||'           | sort > "$srcdir/official.txt"
  #find "$srcdir/temp" | sed "s|$srcdir/temp||" | sort > "$srcdir/built.txt"
  #comm -3 built.txt official.txt
  #exit 1

  msg2 "Adjusting stuff ..."
  _opencv_java="usr/share/java/opencv4"
  # Creating the package structure
  mkdir -p "$pkgdir/$_opencv_java"
  # Installing the built files
  cp -rv "$srcdir/temp/$_opencv_java" "$pkgdir/usr/share/java"

  # Create a symbolic link in /usr/share/java as Java apps written for Ubuntu may be looking there
  _pkgver="${pkgver//./}"
  mkdir -p "$pkgdir/usr/share/java/"
  ln -sv "/$_opencv_java/opencv-$_pkgver.jar" "$pkgdir/usr/share/java/opencv.jar"
  mkdir -p "$pkgdir/usr/lib/"
  ln -sv "/$_opencv_java/libopencv_java$_pkgver.so" "$pkgdir/usr/lib/libopencv_java.so"

  # The license is the same of the official package, I assume
  mkdir -p "$pkgdir/usr/share/licenses/"
  ln -sv "/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
