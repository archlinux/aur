# Maintainer: aik2 <aik2mlj at gmail dot com>

pkgname=sparta-plugins-bin
_name=sparta-plugins
_long_pkgver=2026_01_25_v1.8.2
pkgver="${_long_pkgver##*_v}"
pkgrel=2
pkgdesc='A collection of open-source VST, VST3, AU, LV2 and AAX audio plug-ins for the production and playback of spatial sound scenes'
arch=('x86_64')
url="https://leomccormack.github.io/sparta-site/"
license=('GPL-3.0-or-later')
groups=('pro-audio')
depends=('bubblewrap')
provides=($_name)
conflicts=($_name)
_format=VST3 # can be VST, VST3, LV2
_target_d=Linux_SPARTA_${_format}_${_long_pkgver}
source=("https://github.com/leomccormack/SPARTA/releases/download/v$pkgver/$_target_d.zip")
sha256sums=('a5a64ceb4534950ede09101358d6b639450713ca4d60d467852635abb0dd3310')

package() {
    cd "$_target_d"

    # Custom mkl lib needed for the installation
    install -Dm755 "libsaf_mkl_custom_lp64.so" "$pkgdir/usr/lib/libsaf_mkl_custom_lp64.so"

    case "$_format" in
    VST3)
        install -d "$pkgdir/usr/lib/vst3/"
        find . -name '*.vst3' -exec cp -ar {} "$pkgdir/usr/lib/vst3/" \;
        ;;
    VST)
        install -d "$pkgdir/usr/lib/vst/"
        find . -name '*.so' ! -name 'libsaf_mkl_custom_lp64.so' \
            -exec cp -ar {} "$pkgdir/usr/lib/vst/" \;
        ;;
    LV2)
        install -d "$pkgdir/usr/lib/lv2/"
        find . -name '*.lv2' -exec cp -ar {} "$pkgdir/usr/lib/lv2/" \;
        ;;
    *)
        echo "Unknown _format: $_format (expected VST, VST3, or LV2)" >&2
        return 1
        ;;
    esac
}
