# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Karl-Felix Glatzer <karl.glatzer@gmx.de>

_android_arch=x86-64

pkgname=android-${_android_arch}-x264
pkgver=157.r72db4377
pkgrel=2
arch=('any')
pkgdesc='Free library for encoding H264/AVC video streams (android)'
license=('GPL')
url='https://www.videolan.org/developers/x264.html'
depends=('android-ndk'
         "android-${_android_arch}-ffmpeg"
         "android-${_android_arch}-l-smash")
groups=(android-x264)
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-configure' 'git' 'nasm')
_commit=72db437770fd1ce3961f624dd57a8e75ff65ae0b
source=("git+https://code.videolan.org/videolan/x264.git#commit=${_commit}"
        'soname.patch')
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "${srcdir}"/x264
    local _ver=$(grep '#define X264_BUILD' x264.h | cut -d' ' -f3)
    local _rev=$(git rev-parse --short HEAD)
    echo ${_ver}.r${_rev}
}

prepare() {
    cd "${srcdir}"/x264
    patch -Np1 -i ../soname.patch
}

build() {
    cd "${srcdir}"/x264
    source android-env ${_android_arch}
    unset LDFLAGS CPPFLAGS

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
    cd "${srcdir}"/x264
    source android-env ${_android_arch}

    make DESTDIR="$pkgdir" install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
