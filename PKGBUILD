# Maintainer: devome <evinedeng@hotmail.com>

_pkgname="tsac"
pkgname="${_pkgname}-bin"
pkgver=2024.04.08
_pkgver=$(echo ${pkgver} | sed -e 's|\.|-|g')
pkgrel=1
pkgdesc="Very Low Bitrate Audio Compression"
provides=("${_pkgname}")
arch=("x86_64")
url="https://bellard.org/${_pkgname}"
license=("MIT")
optdepends=("nvidia-libgl: for CUDA support")
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/${_pkgname}-${_pkgver}.tar.gz")
sha256sums=('6adfb6b340d118ac47f093dc07db6ace97ac00fc7b387635b1958d919ecfb05d')

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
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" readme.txt Changelog
    install -dm755 "${pkgdir}/"{usr/bin,opt}
    cp --preserve=mode -r "${_pkgname}-${_pkgver}" "${pkgdir}/opt/${_pkgname}"
    ln -s "/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
