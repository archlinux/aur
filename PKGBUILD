# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

_android_arch=x86-64

pkgname=android-${_android_arch}-kmod
pkgver=34.2
pkgrel=1
pkgdesc="Linux kernel module management tools and library (Android ${_android_arch})"
arch=('any')
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
license=('GPL2')
groups=('android-kmod')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-zstd")
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-${pkgver}.tar."{xz,sign}
        '0001-Use-getcwd.patch'
        '0002-Disable-fread_unlocked.patch')
md5sums=('36f2cc483745e81ede3406fa55e1065a'
         'SKIP'
         'c3d62ea51e242a716752f988c742a4b8'
         '6ddd10de2a083afac2d59058ed8bada1')
validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53')  # Lucas DeMarchi

prepare() {
    cd "${srcdir}/kmod-${pkgver}"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Use-getcwd.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 28 ]; then
        patch -Np1 -i ../0002-Disable-fread_unlocked.patch
    fi
}

build() {
    cd "${srcdir}/kmod-${pkgver}"
    source android-env ${_android_arch}

    ./configure \
        --host=aarch64-linux-android \
        --target=aarch64-linux-android \
        --build="${CHOST}" \
        --prefix="${ANDROID_PREFIX}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --includedir="${ANDROID_PREFIX_INCLUDE}" \
        --enable-shared \
        --disable-tools \
        --disable-manpages \
        --with-xz \
        --with-zlib \
        --with-zstd \
        --with-openssl
    make $MAKEFLAGS
    ${ANDROID_AR} cru libkmod/.libs/libkmod.a libkmod/.libs/*.o
    ${ANDROID_RANLIB} libkmod/.libs/libkmod.a
}

package() {
    cd "${srcdir}/kmod-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
    install -v -m644 libkmod/.libs/libkmod.a "${pkgdir}/${ANDROID_PREFIX_LIB}/"
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
}
