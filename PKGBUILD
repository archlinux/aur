# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="tsac"
pkgname="${_pkgname}-bin"
_pkgver="2024-04-08"
pkgver=$(echo ${_pkgver} | sed -e 's|-|\.|g')
pkgrel=2
pkgdesc="Very Low Bitrate Audio Compression"
provides=("${_pkgname}")
arch=("x86_64")
url="https://bellard.org/${_pkgname}"
license=("MIT")
depends=("ffmpeg")
optdepends=("cuda: for --cuda options support")
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/${_pkgname}-${_pkgver}.tar.gz"
        "${_pkgname}")
sha256sums=('6adfb6b340d118ac47f093dc07db6ace97ac00fc7b387635b1958d919ecfb05d'
            'cc1f895927bcd8aaefb2049de325293a190b69f12c011727f479cf0c3672464c')

prepare() {
    cd "${_pkgname}-${_pkgver}"
    local linenum=$(grep -n License readme.txt | awk -F: '{print $1}')
    awk -v linenum="${linenum}" '{if(NR>linenum){print $0}}' readme.txt > ../LICENSE
    awk -v linenum="${linenum}" '{if(NR<linenum){print $0}}' readme.txt > ../readme.txt
    rm readme.txt
    mv Changelog ..
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      readme.txt Changelog
    install -Dm755 -t "${pkgdir}/usr/bin"                        "${_pkgname}"

    cd "${_pkgname}-${_pkgver}"
    install -Dm755 -t "${pkgdir}/usr/lib/${_pkgname}"            "${_pkgname}" *.so*
    install -Dm644 -t "${pkgdir}/usr/share/${_pkgname}"          *.bin
}
