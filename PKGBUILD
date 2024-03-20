# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Dave Reisner <dreisner@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-kmod
pkgver=32
pkgrel=4
pkgdesc="Linux kernel module management tools and library (Android, ${_android_arch})"
arch=('any')
url='https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git'
license=('GPL2')
depends=("android-${_android_arch}-zlib"
         "android-${_android_arch}-openssl"
         "android-${_android_arch}-xz"
         "android-${_android_arch}-zstd")
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-$pkgver.tar."{xz,sign}
        'basename-impl.h'
        '0001-Use-getcwd.patch'
        '0002-Define-basename.patch')
md5sums=('1046fda48766fae905f83150d12eec78'
         'SKIP'
         '975e90408275d4d16b97f1fbbaa86302'
         'c3d62ea51e242a716752f988c742a4b8'
         '6ce8129da6aa5df9dab858f2f1b1412a')
validpgpkeys=('EAB33C9690013C733916AC839BA2A5A630CBEA53')  # Lucas DeMarchi

prepare() {
    cd "${srcdir}/kmod-$pkgver"
    source android-env ${_android_arch}

    patch -Np1 -i ../0001-Use-getcwd.patch

    if [ "${ANDROID_MINIMUM_PLATFORM}" -lt 23 ]; then
        patch -Np1 -i ../0002-Define-basename.patch
    fi
}

build() {
    cd "${srcdir}/kmod-$pkgver"
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
        --disable-test-modules \
        --with-xz \
        --with-zlib \
        --with-zstd \
        --with-openssl
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/kmod-$pkgver"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    rm -rf "${pkgdir}/${ANDROID_PREFIX_SHARE}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
}
