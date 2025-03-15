# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Sven-Hendrik Haasr <svenstaro@gmail.com>
# Contributor: nl6720 <nl6720@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: d'Ronin <daronin@2600.com>

_android_arch=x86-64

pkgname=android-${_android_arch}-judy
pkgver=1.0.5
pkgrel=2
arch=('any')
pkgdesc="C library creating and accessing dynamic arrays (Android ${_android_arch})"
license=('LGPL')
url='http://judy.sourceforge.net/'
groups=('android-judy')
depends=('android-ndk')
makedepends=('android-configure')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://downloads.sourceforge.net/judy/Judy-${pkgver}.tar.gz"
        '0001-Compile-JudyTablesGen-for-the-build-system.patch'
        '0002-Disable-lib-symlinks.patch')
md5sums=('115a0d26302676e962ae2f70ec484a54'
         'f9615ba9ec2a54b7d9f0d2a161d2c21f'
         'edbc8d311eeba65004f8a9ba5156a194')

prepare() {
    cd "${srcdir}/judy-${pkgver}"

    patch -Np1 -i ../0001-Compile-JudyTablesGen-for-the-build-system.patch
    patch -Np1 -i ../0002-Disable-lib-symlinks.patch
}

build() {
    cd "${srcdir}/judy-${pkgver}"
    source android-env ${_android_arch}

    # Platform specific patches
    case "${_android_arch}" in
        aarch64)
             host=armv8-unknown-linux
            ;;
        armv7a-eabi)
             host=armv7-unknown-linux
            ;;
        riscv64)
             host=riscv64-unknown-linux
            ;;
        x86)
             host=x86-unknown-linux
            ;;
        x86-64)
             host=x86_64-unknown-linux
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure \
        --host=${host}
    make -C "${PWD}/src" $MAKEFLAGS
}

package() {
    cd "${srcdir}/judy-${pkgver}"
    source android-env ${_android_arch}

    make -C "${PWD}/src" DESTDIR="${pkgdir}" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a
    rm -f "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so.*
}
