# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=riscv64

pkgname=android-${_android_arch}-boost
pkgver=1.88.0
pkgrel=2
arch=('any')
pkgdesc="Free peer-reviewed portable C++ source libraries (Android ${_android_arch})"
url="https://www.boost.org/"
license=('custom')
groups=('android-boost')
depends=("android-${_android_arch}-bzip2"
         "android-${_android_arch}-icu"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-cmake'
             "android-${_android_arch}-openmpi")
optdepends=("android-${_android_arch}-openmpi: for mpi support")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/boostorg/boost/releases/download/boost-${pkgver}/boost-${pkgver}-cmake.tar.xz")
md5sums=('3edffaacd2cfe63c240ef1b99497c74f')

build() {
    cd "${srcdir}/boost-${pkgver}"
    source android-env ${_android_arch}

    ./bootstrap.sh -with-toolset=gcc

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DBOOST_ENABLE_MPI=ON \
        -DBOOST_IOSTREAMS_ENABLE_BZIP2=ON \
        -DBOOST_IOSTREAMS_ENABLE_LZMA=ON \
        -DBOOST_IOSTREAMS_ENABLE_ZLIB=ON \
        -DBOOST_IOSTREAMS_ENABLE_ZSTD=ON \
        -DBOOST_LOCALE_ENABLE_ICONV=ON \
        -DBOOST_LOCALE_ENABLE_ICU=ON \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libz.so" \
        -DBZIP2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DBZIP2_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libbz2.so" \
        -DLIBLZMA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/lzma" \
        -DLIBLZMA_LIBRARY="${ANDROID_PREFIX_LIB}/liblzma.so" \
        -Dzstd_DIR="${ANDROID_PREFIX_LIB}/cmake/zstd" \
        -DIconv_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DIconv_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.so" \
        -DICU_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DICU_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.so" \
        -DICU_DATA_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libicudata.so" \
        -DICU_I18N_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libicui18n.so" \
        -DICU_UC_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libicuuc.so" \
        -DMPI_C_HEADER_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DMPI_CXX_HEADER_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DMPI_mpi_LIBRARY="${ANDROID_PREFIX_LIB}/libmpi.so" \
        -DCMAKE_CXX_FLAGS="-DBOOST_ALL_NO_EMBEDDED_GDB_SCRIPTS -DBOOST_STACKTRACE_LIBCXX_RUNTIME_MAY_CAUSE_MEMORY_LEAK" \
        -Wno-dev \
        ${extra_options}
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DBOOST_ENABLE_MPI=OFF \
        -DBOOST_IOSTREAMS_ENABLE_BZIP2=ON \
        -DBOOST_IOSTREAMS_ENABLE_LZMA=ON \
        -DBOOST_IOSTREAMS_ENABLE_ZLIB=ON \
        -DBOOST_IOSTREAMS_ENABLE_ZSTD=ON \
        -DBOOST_LOCALE_ENABLE_ICONV=ON \
        -DBOOST_LOCALE_ENABLE_ICU=ON \
        -DZLIB_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DZLIB_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libz.a" \
        -DBZIP2_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DBZIP2_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libbz2.a" \
        -DLIBLZMA_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}/lzma" \
        -DLIBLZMA_LIBRARY="${ANDROID_PREFIX_LIB}/liblzma.a" \
        -Dzstd_DIR="${ANDROID_PREFIX_LIB}/cmake/zstd" \
        -DIconv_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DIconv_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.a" \
        -DICU_INCLUDE_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DICU_LIBRARY="${ANDROID_PREFIX_LIB}/libiconv.a" \
        -DICU_DATA_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libicudata.a" \
        -DICU_I18N_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libicui18n.a" \
        -DICU_UC_LIBRARY_RELEASE="${ANDROID_PREFIX_LIB}/libicuuc.a" \
        -DMPI_C_HEADER_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DMPI_CXX_HEADER_DIR="${ANDROID_PREFIX_INCLUDE}" \
        -DMPI_mpi_LIBRARY="${ANDROID_PREFIX_LIB}/libmpi.a" \
        -DCMAKE_CXX_FLAGS="-DBOOST_ALL_NO_EMBEDDED_GDB_SCRIPTS -DBOOST_STACKTRACE_LIBCXX_RUNTIME_MAY_CAUSE_MEMORY_LEAK" \
        -Wno-dev \
        ${extra_options}
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/boost-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE_1_0.txt
}
