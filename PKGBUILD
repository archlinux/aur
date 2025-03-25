# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

_android_arch=riscv64

pkgname=android-${_android_arch}-hdf5
pkgver=1.14.5
pkgrel=1
arch=('any')
pkgdesc="General purpose library and file format for storing scientific data (Android ${_android_arch})"
url="https://www.hdfgroup.org/hdf5"
license=('custom')
groups=('android-hdf5')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-libaec")
makedepends=('android-cmake'
             'time')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/HDFGroup/hdf5/archive/hdf5_${pkgver}/hdf5-${pkgver}.tar.gz")
md5sums=('8a2d6ec803964913c880c8a984f71d61')

prepare() {
    cd "${srcdir}/hdf5-hdf5_${pkgver/_/-}"

    # Don't mess with build flags
    sed -i -e '/-Werror/d' configure
    sed -i 's/fseeko/fseek/g' src/H5FDstdio.c
    sed -i 's/ftello/ftell/g' src/H5FDstdio.c
}

build() {
    cd "${srcdir}/hdf5-hdf5_${pkgver/_/-}"
    source android-env ${_android_arch}

    # Crazy workaround: run CMake to generate pkg-config file
    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DBUILD_STATIC_LIBS=ON \
        -DHDF5_BUILD_HL_LIB=ON \
        -DHDF5_BUILD_CPP_LIB=ON \
        -DHDF5_BUILD_FORTRAN=OFF \
        -DHDF5_BUILD_JAVA=OFF \
        -DHDF5_ENABLE_Z_LIB_SUPPORT=ON \
        -DHDF5_ENABLE_SZIP_SUPPORT=OFF \
        -DHDF5_ENABLE_SZIP_ENCODING=OFF \
        -DBUILD_TESTING=OFF \
        -DDISABLE_PDB_FILES=ON \
        -DHDF5_BUILD_EXAMPLES=OFF \
        -DHDF5_BUILD_TOOLS=OFF \
        -DHDF5_BUILD_UTILS=OFF
    # But don’t build with it, it’s quite broken

    android-${_android_arch}-configure \
        --disable-sharedlib-rpath \
        --enable-build-mode=production \
        --enable-hl \
        --enable-cxx \
        --with-pic \
        --with-zlib \
        --with-szlib \
        --enable-tests=no \
        --enable-tools=no \
        --disable-doxygen-man \
        --disable-doxygen-html
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/hdf5-hdf5_${pkgver/_/-}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_BIN}/"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a

    # Install pkg-config files from CMake tree
    install -Dm644 build/CMakeFiles/hdf5{,_hl}{,_cpp}.pc -t "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig/"

    # Fix version numbers in pkg-config files
    sed -i '/Requires/ s/-/ = /g' "${pkgdir}/${ANDROID_PREFIX_LIB}/pkgconfig"/*.pc

    # Fix bogus include path
    sed  -i -re "s|-I/build/hdf5/src/hdf5.*/src/H5FDsubfiling||g" "${pkgdir}/${ANDROID_PREFIX_LIB}/libhdf5.settings"

    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
