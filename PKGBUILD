# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Olaf Leidinger <oleid@mescharet.de>
# Contributor: fabien Cellier <fabien.cellier@gmail.com>

_android_arch=aarch64

pkgname=android-${_android_arch}-pocl
pkgver=5.0
pkgrel=1
arch=('any')
pkgdesc="Portable OpenCL is an open-source implementation of OpenCL which can be easily adapted for new targets (Android ${_android_arch})"
url="http://portablecl.org/"
license=('GPL')
depends=("android-${_android_arch}-hwloc"
         "android-${_android_arch}-opencl-icd-loader")
makedepends=('android-cmake'
             "android-${_android_arch}-opencl-headers"
             "android-${_android_arch}-ocl-icd"
             'python')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/pocl/pocl/archive/v$pkgver.tar.gz")
md5sums=('94b4d86f4068c31f76fc08faca2498b8')

prepare() {
    cd "${srcdir}/pocl-$pkgver"
    source android-env ${_android_arch}

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 24 ]; then
        sed -i 's|set(OCL_DRIVERS "basic pthreads")|set(OCL_DRIVERS "basic")|g' CMakeLists.txt
        sed -i '/set(BUILD_PTHREAD 1)/d' CMakeLists.txt
    fi
}

build() {
    cd "${srcdir}/pocl-$pkgver"
    source android-env ${_android_arch}

    export LDFLAGS="${LDFLAGS} -llog"

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DENABLE_LOADABLE_DRIVERS=ON \
        -DINSTALL_OPENCL_HEADERS=OFF \
        -DENABLE_EXAMPLES=OFF \
        -DENABLE_LLVM=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_POCLCC=OFF \
        -DHOST_DEVICE_BUILD_HASH=x86_64-linux-gnu \
        -DOCL_ICD_LIBRARIES="${ANDROID_PREFIX_LIB}/libOpenCL.so" \
        -DPOCL_INSTALL_ICD_VENDORDIR="${ANDROID_PREFIX_ETC}/OpenCL/vendors"

    files=(build/lib/CL/devices/basic/CMakeFiles/pocl-devices-basic.dir/link.txt)

    if [ "${ANDROID_MINIMUM_PLATFORM}" -ge 24 ]; then
        files+=(build/lib/CL/devices/pthread/CMakeFiles/pocl-devices-pthread.dir/link.txt)
    fi

    for f in "${files[@]}"; do
        sed -i 's| -Wl,--no-undefined-version | |g' $f
        sed -i 's| -Wl,--no-undefined | |g' $f
    done

    make -C build $MAKEFLAGS
    ${CXX} -shared -o build/lib/CL/libpocl.so build/lib/CL/CMakeFiles/libpocl_unlinked_objs.dir/*.o
}

package() {
    cd "${srcdir}/pocl-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="$pkgdir/" install
    install -vDm 644 build/lib/CL/libpocl.so -t "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    mv -f "${pkgdir}/${ANDROID_PREFIX_LIB}/static"/*.a "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    rmdir "${pkgdir}/${ANDROID_PREFIX_LIB}/static"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}/pocl"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    sed -i 's|libpocl.a|libpocl.so|g' "${pkgdir}/${ANDROID_PREFIX_ETC}/OpenCL/vendors/pocl.icd"
}
