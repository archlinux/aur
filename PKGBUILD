# Maintainer: Andrew Crerar <crerar@archlinux.org>
# Contributor: Valentin Churavy <v.churavy@gmail.com>
# Contributor: Romain Reignier <rom.reignier@gmail.com>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: David Manouchehri <david@davidmanouchehri.com>
# Contributor: CHEN Xing <cxcxcxcx@gmail.com>
# Contributor: Martin Imobersteg <martin.imobersteg@gmail.com>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Also largely inspired by `opencv` in extra, so including contributors too:
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_name="opencv"
pkgbase="$_name"-git
pkgname=("$pkgbase" "$_name-samples-git" "python-$_name-git")
pkgver=4.6.0.r213.gbb64db98d8
pkgrel=1
pkgdesc="Open Source Computer Vision Library"
url="https://opencv.org/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('tbb' 'openexr' 'gst-plugins-base' 'libdc1394' 'cblas' 'lapack'
         'libgphoto2' 'openjpeg2' 'ffmpeg' 'protobuf')
makedepends=('git' 'cmake' 'python-numpy' 'python-setuptools' 'mesa' 'eigen'
             'hdf5' 'lapacke' 'qt5-base' 'vtk' 'glew' 'ant' 'java-environment'
             'pugixml' 'openmpi' 'fmt')
optdepends=('opencv-samples-git: samples'
            'vtk: for the viz module'
            'glew: for the viz module'
            'qt5-base: for the HighGUI module'
            'hdf5: for the HDF5 module'
            'opencl-icd-loader: For coding with OpenCL'
            'python-numpy: Python bindings'
            'java-runtime: Java interface')
conflicts=('opencv' 'opencv-samples' 'python-opencv')
source=('git+https://github.com/opencv/opencv.git'
        'git+https://github.com/opencv/opencv_contrib.git'
        'vtk9.patch')
sha512sums=('SKIP'
            'SKIP'
            'd71c80adbd3717e985dfd4468a2a5125a19de3f61f0fc49dc72d22d1eca11b374d54900d44b020e1ccaf643a7c8f36952a4bda4b3f849ebed0461db09c2ce8b7')

_cmakeopts=('-DWITH_OPENCL=ON'
            '-DWITH_OPENGL=ON'
            '-DWITH_TBB=ON'
            '-DWITH_VULKAN=ON'
            '-DWITH_QT=ON'
            '-DBUILD_WITH_DEBUG_INFO=OFF'
            '-DBUILD_TESTS=OFF'
            '-DBUILD_PERF_TESTS=OFF'
            '-DBUILD_EXAMPLES=ON'
            '-DBUILD_PROTOBUF=OFF'
            '-DPROTOBUF_UPDATE_FILES=ON'
            '-DINSTALL_C_EXAMPLES=ON'
            '-DINSTALL_PYTHON_EXAMPLES=ON'
            '-DCMAKE_INSTALL_PREFIX=/usr'
            '-DCMAKE_INSTALL_LIBDIR=lib'
            '-DCUDA_NVCC_FLAGS="--expt-relaxed-constexpr"'
            '-DOPENCV_SKIP_PYTHON_LOADER=ON')

# SSE only available from Pentium 3 onwards (i686 is way older)
[[ "$CARCH" = 'i686' ]] && _cmakeopts+=('-DCPU_BASELINE_DISABLE=SSE2')
[[ "$CARCH" = 'x86_64' ]] && _cmakeopts+=('-DCPU_BASELINE_DISABLE=SSE3 -DCPU_BASELINE_REQUIRE=SSE2')

pkgver() {
    cd "$srcdir/$_name"
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  patch -d "$_name" -p1 < vtk9.patch # Don't require all vtk optdepends
}

build() {
    export JAVA_HOME="/usr/lib/jvm/default"

    # cmake's FindLAPACK doesn't add cblas to LAPACK_LIBRARIES, so we need to specify them manually
    _pythonpath=`python -c "from sysconfig import get_path; print(get_path('platlib'))"`

    cmake -B build -S "$_name" \
          "${_cmakeopts[@]}" \
          -DOPENCV_EXTRA_MODULES_PATH="$srcdir"/opencv_contrib/modules \
          -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
          -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
          -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
          -DOPENCV_PYTHON3_INSTALL_PATH=$_pythonpath \
          -DOPENCV_GENERATE_PKGCONFIG=ON \
          -DOPENCV_ENABLE_NOFREE=ON \
          -DOPENCV_JNI_INSTALL_PATH=lib \
          -DOPENCV_GENERATE_SETUPVARS=OFF \
          -DEIGEN_INCLUDE_PATH=/usr/include/eigen3

    cmake --build build
}

package_opencv-git() {
    DESTDIR="$pkgdir" cmake --install build

    # install LICENSE file
    install -Dm644 "$_name"/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"

    # separate samples package
    mv "$pkgdir"/usr/share/opencv4/samples "$srcdir"

    # Add java symlinks expected by some binary blobs
    ln -sr "$pkgdir"/usr/share/java/{opencv4/opencv-${pkgver//./},opencv}.jar
    ln -sr "$pkgdir"/usr/lib/{libopencv_java${pkgver//./},libopencv_java}.so

    # Split Python bindings
    rm -r "$pkgdir"/usr/lib/python3*
}

package_opencv-samples-git() {
    pkgdesc+=' (samples)'
    depends=('opencv-git')

    unset optdepends

    mkdir -p "$pkgdir"/usr/share/opencv4
    mv samples "$pkgdir"/usr/share/opencv4

    # install license file
    install -Dm644 "$_name"/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}

package_python-opencv-git() {
    pkgdesc='Python bindings for OpenCV'
    depends=('python-numpy' 'opencv-git' 'vtk' 'glew' 'qt5-base' 'hdf5' 'jsoncpp' 'openmpi' 'pugixml' 'fmt')

    unset optdepends

    DESTDIR="$pkgdir" cmake --install build/modules/python3

    # install license file
    install -Dm644 "$_name"/LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
