# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Denis Martinez <deuns.martinez AT gmail.com>
# Contributor: Bogdan Burlacu <bogdan.burlacu AT pm.me>

_android_arch=riscv64

pkgname=android-${_android_arch}-onetbb
pkgver=2022.2.0
pkgrel=1
arch=('any')
pkgdesc="High level abstract threading library (oneAPI Threading Building Blocks) (Android ${_android_arch})"
url='https://oneapi-src.github.io/oneTBB/'
license=('Apache')
groups=('android-onetbb')
depends=("android-${_android_arch}-hwloc")
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/oneapi-src/oneTBB/archive/v${pkgver}/onetbb-${pkgver}.tar.gz")
md5sums=('dd62f06431c9dfd274498afa4deba8f5')

prepare() {
    cd "${srcdir}/oneTBB-${pkgver}"

    sed -i '/ LINK_FLAGS /d' src/tbbmalloc_proxy/CMakeLists.txt
    sed -i '/ LINK_DEPENDS /d' src/tbbmalloc_proxy/CMakeLists.txt

    files=(cmake/compilers/Clang.cmake
           cmake/compilers/GNU.cmake)

    for f in "${files[@]}"; do
        sed -i '/--version-script/d' $f
        sed -i 's|set(TBB_DEF_FILE_PREFIX lin${TBB_ARCH})|set(TBB_DEF_FILE_PREFIX "")|g' $f
    done
}

build() {
    cd "${srcdir}/oneTBB-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build-shared \
        -DBUILD_SHARED_LIBS=ON \
        -DTBB_STRICT=OFF \
        -DTBB_TEST=OFF  \
        -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF
    make -C build-shared $MAKEFLAGS

    android-${_android_arch}-cmake \
        -S . \
        -B build-static \
        -DBUILD_SHARED_LIBS=OFF \
        -DTBB_STRICT=OFF \
        -DTBB_TEST=OFF  \
        -DTBB_DISABLE_HWLOC_AUTOMATIC_SEARCH=OFF
    make -C build-static $MAKEFLAGS
}

package() {
    cd "${srcdir}/oneTBB-${pkgver}"
    source android-env ${_android_arch}

    make -C build-shared DESTDIR="${pkgdir}" install
    make -C build-static DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
