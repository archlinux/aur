# Maintainer: Zadkiel AHARONIAN <hello@zadkiel.fr>
# Repository: https://github.com/aslafy-z/aur-packages

pkgname=flite-voices-extra
pkgver=2.2
pkgrel=1
pkgdesc='Flite voices and grapheme lexicon omitted from the flite package'
arch=('x86_64')
url='http://www.festvox.org/flite/'
license=('LicenseRef-Flite')
depends=('flite' 'alsa-lib' 'glibc')
source=("flite-${pkgver}.tar.gz::https://github.com/festvox/flite/archive/v${pkgver}/flite-${pkgver}.tar.gz")
sha256sums=('ab1555fe5adc3f99f1d4a1a0eb1596d329fd6d74f1464a0097c81f53c0cf9e5c')

# Modules built by upstream config/default.lv but dropped by the flite package,
# which compiles a trimmed profile derived from config/android.lv. WebKit builds
# linked against Debian's libflite1 list these as DT_NEEDED, so the dynamic
# linker refuses to start the process when they are absent.
_extra=('cmu_grapheme_lang'
        'cmu_grapheme_lex'
        'cmu_time_awb'
        'cmu_us_awb'
        'cmu_us_kal'
        'cmu_us_rms')

build() {
    cd "${srcdir}/flite-${pkgver}"

    ./configure \
        --prefix=/usr \
        --enable-shared \
        --with-audio=alsa

    # Upstream makefiles race when creating build directories.
    make -j1
}

package() {
    cd "${srcdir}/flite-${pkgver}"

    local _libdir
    _libdir="$(dirname "$(find build -name "libflite.so.${pkgver}" -print -quit)")"

    local _module
    for _module in "${_extra[@]}"; do
        install -D -m755 "${_libdir}/libflite_${_module}.so.${pkgver}" \
            -t "${pkgdir}/usr/lib"
        ln -s "libflite_${_module}.so.${pkgver}" \
            "${pkgdir}/usr/lib/libflite_${_module}.so.1"
    done

    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
