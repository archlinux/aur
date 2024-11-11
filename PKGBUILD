# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>

_android_arch=x86

pkgbase=android-${_android_arch}-rubberband
pkgname=(android-${_android_arch}-rubberband
         android-${_android_arch}-rubberband-{ladspa,lv2,vamp})
pkgver=4.0.0
pkgrel=1
arch=('any')
pkgdesc="Time-stretching and pitch-shifting audio library and utility"
url="https://www.breakfastquay.com/rubberband/"
license=('GPL2')
makedepends=('android-meson'
             "android-${_android_arch}-boost"
             "android-${_android_arch}-fftw"
             "android-${_android_arch}-ladspa"
             "android-${_android_arch}-lv2"
             "android-${_android_arch}-libsamplerate"
             "android-${_android_arch}-libsndfile"
             "android-${_android_arch}-vamp-plugin-sdk")
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/breakfastquay/rubberband/archive/v${pkgver}.tar.gz")
md5sums=('87ac2e0fcd62f4fa9d2bf83237adbb77')

_pick() {
    local p="$1" f d; shift

    for f; do
        d="$srcdir/$p/${f#$pkgdir/}"
        mkdir -p "$(dirname "$d")"
        mv "$f" "$d"
        rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

build() {
    cd "${srcdir}/rubberband-${pkgver}"
    source android-env ${_android_arch}

    android-${_android_arch}-meson build \
        -Djni=disabled \
        -Dfft=fftw \
        -Dresampler=libsamplerate \
        -Dcmdline=disabled \
        -Dtests=disabled
    sed -i 's/-DUSE_PTHREADS/-DUSE_PTHREADS -D_NEWLIB_VERSION/g' build/compile_commands.json
    ninja -C build
}

package_android-x86-rubberband() {
    pkgdesc+=" - VAMP plugin (Android ${_android_arch})"
    groups=('android-rubberband')
    depends=("android-${_android_arch}-fftw"
             "android-${_android_arch}-libsamplerate"
             "android-${_android_arch}-libsndfile")

    cd "${srcdir}/rubberband-${pkgver}"
    source android-env ${_android_arch}

    meson install -C build --destdir "${pkgdir}"
    ${ANDROID_STRIP} -g --strip-unneeded "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.so
    ${ANDROID_STRIP} -g "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true
    ${ANDROID_RANLIB} "${pkgdir}/${ANDROID_PREFIX_LIB}"/*.a || true

    _pick rubberband-ladspa "${pkgdir}/${ANDROID_PREFIX_LIB}/ladspa/"
    _pick rubberband-lv2 "${pkgdir}/${ANDROID_PREFIX_LIB}/lv2/"
    _pick rubberband-vamp "${pkgdir}/${ANDROID_PREFIX_LIB}/vamp/"
}

package_android-x86-rubberband-ladspa() {
    pkgdesc+=" - LADSPA plugin (Android ${_android_arch})"
    groups=('android-rubberband-ladspa')
    depends=("android-${_android_arch}-fftw"
             "android-${_android_arch}-libsamplerate"
             "android-${_android_arch}-ladspa")

    mv -v "${srcdir}/rubberband-ladspa"/* "${pkgdir}"
}

package_android-x86-rubberband-lv2() {
    pkgdesc+=" - LV2 plugin (Android ${_android_arch})"
    groups=('android-rubberband-lv2')
    depends=("android-${_android_arch}-fftw"
             "android-${_android_arch}-libsamplerate"
             "android-${_android_arch}-lv2")

    mv -v "${srcdir}/rubberband-lv2"/* "${pkgdir}"
}

package_android-x86-rubberband-vamp() {
    pkgdesc+=" - VAMP plugin (Android ${_android_arch})"
    groups=('android-rubberband-vamp')
    depends=("android-${_android_arch}-fftw"
             "android-${_android_arch}-libsamplerate"
             "android-${_android_arch}-vamp-plugin-sdk")

    mv -v "${srcdir}/rubberband-vamp"/* "${pkgdir}"
}
