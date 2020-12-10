# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=dngconverter
pkgver=13.1
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
source=("http://download.adobe.com/pub/adobe/dng/win/DNGConverter_${pkgver/./_}.exe"
        'dngconverter'
        '_dngconverter')
sha1sums=('3552c924a6928aa092384cae54a2511bc056d1eb'
          'SKIP'
          'SKIP')

build() {
    install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
    export WINEPREFIX="$srcdir"/tmp/env
    export XDG_DATA_HOME="$srcdir"/tmp/local
    export WINEDLLOVERRIDES="mscoree=,mshtml="
    winetricks win10
    wine "${srcdir}"/DNGConverter_${pkgver/./_}.exe /S
    pkill -f 'C\:\\windows\\system32\\explorer\.exe C:\\Program Files\\Adobe'
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
