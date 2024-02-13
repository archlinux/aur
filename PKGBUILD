# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=armv7a-eabi

pkgname=android-${_android_arch}-freetype2-bootstrap
pkgver=2.13.2
pkgrel=2
arch=('any')
pkgdesc='Font rasterization library (android)'
depends=("android-ndk"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-bzip2"
         "android-${_android_arch}-brotli"
         "android-${_android_arch}-libpng")
provides=("android-${_android_arch}-freetype2")
conflicts=("android-${_android_arch}-freetype2")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
license=('GPL')
url='https://www.freetype.org/'
source=("https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz"{,.sig}
        '0001-Enable-table-validation-modules.patch'
        '0002-Enable-subpixel-rendering.patch'
        '0003-Enable-long-PCF-family-names.patch')
b2sums=('cebc82180d9afaeb112a65ba78903d7bf7a9295a803166a033585ad2325add6023f05066852240c4665e56285345ba503b01ecd461d48f0478a8f3f56136988e'
        'SKIP'
        '2c148694e150b3faae9dc46ead824ae6d94cfe34f2918bc9066f45bab7e6b6f77b4d4b2fee00c3d466d866e1985132cea4a774dcf1bab95409b7cf55efff01e1'
        '9598d13eae0411878c1af8e5d875c3b1fc09f4e6649edfbbf3b0a819c4c585648521f0b30ffd1318f5106cfde9c899d3db70c8ffe36dac59f3f98b5fd7dab115'
        '66deb179d1f1f4e2e35f6d50acfbacce80595d5128f5fed8c1871838c210dbf1a7173a87dd937d64997844c8f478c8f81120f71e33b9d59d980e179d103ff31c')
validpgpkeys=(
  E30674707856409FF1948010BE6C3AAC63AD8E3F  # Werner Lemberg <wl@gnu.org>
)

prepare() {
    cd "${srcdir}/freetype-${pkgver}"
    patch -Np1 -i ../0001-Enable-table-validation-modules.patch
    patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
    patch -Np1 -i ../0003-Enable-long-PCF-family-names.patch
}

build() {
    cd "${srcdir}/freetype-${pkgver}"
    source android-env ${_android_arch}

    bzip2opt=enabled

    # Platform specific patches
    case "$_android_arch" in
        x86)
            bzip2opt=disabled
            ;;
        *)
            ;;
    esac

    mkdir -p build
    cd build
    android-${_android_arch}-meson \
        --default-library both \
        -D zlib=enabled \
        -D bzip2="${bzip2opt}" \
        -D png=enabled \
        -D harfbuzz=disabled \
        -D brotli=enabled \
        -D b_lto=false
    ninja
}

package() {
    cd "${srcdir}/freetype-${pkgver}/build"
    DESTDIR="${pkgdir}" ninja install
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}"/${ANDROID_PREFIX_LIB}/*.so
    ${ANDROID_RANLIB} "$pkgdir"/${ANDROID_PREFIX_LIB}/*.a
}
