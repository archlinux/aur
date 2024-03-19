# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>

_android_arch=x86-64

pkgname=android-${_android_arch}-x264
pkgver=157.r72db4377
_commit=72db437770fd1ce3961f624dd57a8e75ff65ae0b
pkgrel=2
arch=('any')
pkgdesc='Free library for encoding H264/AVC video streams (android)'
license=('GPL')
url='https://www.videolan.org/developers/x264.html'
groups=('android-x264')
depends=('android-ndk'
         "android-${_android_arch}-ffmpeg"
         "android-${_android_arch}-l-smash")
makedepends=('android-configure'
             'yasm'
             'git')
options=(!strip !buildflags staticlibs !emptydirs)
source=("git+https://code.videolan.org/videolan/x264.git#commit=${_commit}"
        '0001-Fix-soname.patch'
        '0002-Remove-lpthread.patch'
        '0003-Do-not-replace-ftell-and-fseek.patch')
md5sums=('SKIP'
         'e8322f7da77816cd721183ed42f8a1bc'
         'ef45412614fcd0fe1a186672fcbbf47d'
         '8114198c19f2abd3503af34030604225')

pkgver() {
    cd "${srcdir}/x264"
    local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
    local _rev=$(git rev-parse --short HEAD)
    echo ${_ver}.r${_rev}
}

prepare() {
    cd "${srcdir}/x264"
    patch -Np1 -i ../0001-Fix-soname.patch
    patch -Np1 -i ../0002-Remove-lpthread.patch
    patch -Np1 -i ../0003-Do-not-replace-ftell-and-fseek.patch
}

build() {
    cd "${srcdir}/x264"
    source android-env ${_android_arch}

    configue_opts="
        --disable-cli
        --enable-pic
        --enable-lto"

    # Platform specific patches
    case "$_android_arch" in
        x86)
             configue_opts+="
                 --disable-asm
                 --host=i686-linux"
            ;;
        x86-64)
             configue_opts+="
                 --disable-asm"
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-configure ${configue_opts}
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/x264"
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a || true
}
