# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Martchus <martchus@gmx.net>

_android_arch=x86

pkgname=android-${_android_arch}-freetype2-bootstrap
pkgver=2.13.3
pkgrel=1
arch=('any')
pkgdesc="Font rasterization library (Android ${_android_arch})"
url='https://www.freetype.org/'
license=('GPL')
groups=('android-freetype2-bootstrap')
depends=("android-ndk"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-bzip2"
         "android-${_android_arch}-brotli"
         "android-${_android_arch}-libpng")
provides=("android-${_android_arch}-freetype2")
conflicts=("android-${_android_arch}-freetype2")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://download-mirror.savannah.gnu.org/releases/freetype/freetype-${pkgver}.tar.xz"{,.sig}
        '0001-Enable-table-validation-modules.patch'
        '0002-Enable-subpixel-rendering.patch'
        '0003-Enable-long-PCF-family-names.patch')
md5sums=('f3b4432c4212064c00500e1ad63fbc64'
         'SKIP'
         'edae0c9068cd60c4edde79e89534726e'
         '699b3c133ce7006e0e3f2a2f84982acb'
         'b7e77530b5a4197a26729f7d9e535258')
validpgpkeys=(
  'E30674707856409FF1948010BE6C3AAC63AD8E3F'  # Werner Lemberg <wl@gnu.org>
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
    case "${_android_arch}" in
        x86)
            bzip2opt=disabled
            ;;
        *)
            ;;
    esac

    android-${_android_arch}-meson build \
        -D zlib=enabled \
        -D bzip2="${bzip2opt}" \
        -D png=enabled \
        -D harfbuzz=disabled \
        -D brotli=enabled \
        -D b_lto=false
    ninja -C build
}

package() {
    cd "${srcdir}/freetype-${pkgver}"

    DESTDIR="${pkgdir}" ninja -C build install
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
}
