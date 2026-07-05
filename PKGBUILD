# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Ashok Arora <ashok.maillist@gmail.com>
# Contributor: Johannes Janosovits <johannes@walnutempire.de>
# Contributor: Joshua Schüler <joshua.schueler at gmail dotcom>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=opencv2
pkgver=2.4.13.7
pkgrel=8
pkgdesc='Open Source Computer Vision Library (version 2.x)'
arch=('x86_64')
license=('BSD-3-Clause')
url='https://opencv.org/'
depends=(
    'glib2'
    'glibc'
    'gst-plugins-base-libs'
    'gstreamer'
    'gtk2'
    'gtkglext'
    'libdc1394'
    'libgcc'
    'libgl'
    'libjpeg-turbo'
    'libpng'
    'libstdc++'
    'libtiff'
    'zlib')
makedepends=(
    'cmake'
    'eigen'
    'mesa')
optdepends=('opencl-icd-loader: for coding with OpenCL')
source=("https://github.com/opencv/opencv/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-opencv2-remove-prototypes-warnings.patch'
        '020-opencv2-cmake4-fix.patch')
sha256sums=('192d903588ae2cdceab3d7dc5a5636b023132c8369f184ca89ccec0312ae33d0'
            '0ac6a30a0708339486941b0c784a3a94f4ab2a5154cd74ae82edd405b4f61823'
            'e66d3cc57c87b7d94f0a46e6d1aecea15aff059a1f98c05b4e8f95381afd6398')

prepare() {
    patch -d "opencv-${pkgver}" -Np1 -i "${srcdir}/010-opencv2-remove-prototypes-warnings.patch"
    patch -d "opencv-${pkgver}" -Np1 -i "${srcdir}/020-opencv2-cmake4-fix.patch"
}

build() {
    export CXXFLAGS+=' -std=c++14 -ffat-lto-objects'
    cmake -S "opencv-${pkgver}" -B build \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/opencv2' \
        -DCMAKE_POLICY_VERSION_MINIMUM:STRING='3.5.0' \
        -DCMAKE_SKIP_INSTALL_RPATH:BOOL='YES' \
        -DBUILD_JASPER:BOOL='ON' \
        -DBUILD_opencv_java:BOOL='OFF' \
        -DBUILD_opencv_python:BOOL='OFF' \
        -DBUILD_EXAMPLES:BOOL='OFF' \
        -DBUILD_PERF_TESTS:BOOL='OFF' \
        -DBUILD_TESTS:BOOL='OFF' \
        -DBUILD_WITH_DEBUG_INFO:BOOL='OFF' \
        -DINSTALL_C_EXAMPLES:BOOL='OFF' \
        -DINSTALL_PYTHON_EXAMPLES:BOOL='OFF' \
        -DWITH_CUDA:BOOL='OFF' \
        -DWITH_FFMPEG:BOOL:BOOL='OFF' \
        -DWITH_GSTREAMER:BOOL='ON' \
        -DWITH_LIBV4L:BOOL='OFF' \
        -DWITH_OPENCL:BOOL='ON' \
        -DWITH_OPENGL:BOOL='ON' \
        -DWITH_TBB:BOOL='OFF' \
        -DWITH_V4L:BOOL='ON' \
        -DWITH_XINE:BOOL='OFF' \
        -DENABLE_SSE3:BOOL='OFF' \
        -DENABLE_SSSE4:BOOL='OFF' \
        -DENABLE_SSE41:BOOL='OFF' \
        -DENABLE_SSE42:BOOL='OFF' \
        -DENABLE_AVX:BOOL='OFF' \
        -DENABLE_AVX2:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -d -m755 "${pkgdir}/usr"/{bin,include,lib/pkgconfig}
    install -D -m644 "opencv-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s ../../../opt/opencv2/lib/pkgconfig/opencv.pc "${pkgdir}/usr/lib/pkgconfig/opencv2.pc"
    ln -s ../../../opt/opencv2/lib/pkgconfig/opencv.pc "${pkgdir}/usr/lib/pkgconfig/opencv.pc"
    ln -s ../../opt/opencv2/include/opencv2 "${pkgdir}/usr/include/opencv2"
    ln -s ../../opt/opencv2/include/opencv "${pkgdir}/usr/include/opencv"
    
    local _bin
    for _bin in "${pkgdir}/opt/opencv2/bin"/*
    do
        ln -s "../../opt/opencv2/bin/${_bin##*/}" "${pkgdir}/usr/bin/${_bin##*/}2"
    done
    
    local _lib
    for _lib in "${pkgdir}/opt/opencv2/lib"/libopencv*.so."${pkgver%.*}"
    do
        ln -s "../../opt/opencv2/lib/${_lib##*/}" "${pkgdir}/usr/lib/${_lib##*/}"
    done
    
    while read -r -d '' _lib
    do
        ln -s "$_lib" "${pkgdir}/usr/lib/${_lib%.*}"
    done < <(find -L "${pkgdir}/usr/lib" -type f -name "libopencv*.so.${pkgver%.*}" -print0 | sed -z 's|.*/||')
}
