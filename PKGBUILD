# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=dngconverter
pkgver=14.3
pkgrel=1
pkgdesc='Adobe DNG Converter'
arch=('x86_64')
url='http://www.adobe.com/go/dng_converter_win/'
license=('custom: commercial')
depends=('wine')
makedepends=('wine' 'winetricks')
options=('!strip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("http://download.adobe.com/pub/adobe/dng/win/AdobeDNGConverter_x64_${pkgver/./_}.exe"
        'dngconverter'
        '_dngconverter')
sha1sums=('4f2fbe3761868491248997c347420910fd0186b3'
          'SKIP'
          'SKIP')

build() {
    install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
    export WINEPREFIX="$srcdir"/tmp/env
    export XDG_DATA_HOME="$srcdir"/tmp/local
    export WINEDLLOVERRIDES="mscoree=,mshtml="
    winetricks win10
    wine "${srcdir}"/AdobeDNGConverter_x64_${pkgver/./_}.exe /VERYSILENT
}

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/zsh/site-functions"
    cp _dngconverter "${pkgdir}/usr/share/zsh/site-functions/"
    cp -ra "${srcdir}/tmp/env/drive_c/Program Files/Adobe/"* "${pkgdir}/usr/share/${pkgname}/"
    cp -ra "${srcdir}/tmp/env/drive_c/ProgramData/Adobe/"* "${pkgdir}/usr/share/${pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 "{}" \;
    find "${pkgdir}" -type f -exec chmod 644 "{}" \;
    cp dngconverter "${pkgdir}/usr/bin/"
}
