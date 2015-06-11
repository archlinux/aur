# Maintainer: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>

pkgname=cudahashcat
_pkgname=cudaHashcat
pkgver=1.36
pkgrel=1
pkgdesc="Worlds fastest password cracker with dictionary mutation engine"
url=('http://hashcat.net/oclhashcat/')
arch=('i686' 'x86_64')
license=('custom')
depends=('nvidia-utils>=346')
source=("http://hashcat.net/files/${_pkgname}-${pkgver}.7z")
sha512sums=('28ed89d22698978ce3f84120019699cca4afe6a7e5264de06a3d3b12f451e41539a0a93f58ce3279cffcd5c67e6029c27a70b3db9eb80dbc0aed25c4f8372f59')
options=('!strip')
replaces=('oclhashcat-nvidia')
conflicts=('oclhashcat-nvidia')

package() {
    find "${srcdir}/${_pkgname}-${pkgver}" \( -name "*.cmd" -o -name "*.exe" \) -print | xargs -i rm {}
    mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
    if [ "${CARCH}" = "x86_64" ]; then
        rm "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}32.bin"
        mv "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}64.bin" "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"
    else
        rm "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}64.bin"
        mv "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}32.bin" "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}"
    fi
    echo -e "#!/bin/bash\n/opt/${_pkgname}/${_pkgname} \$@" > "$pkgdir/usr/bin/${_pkgname}"
    chmod a+x "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${_pkgname}"
    chmod 666 ${pkgdir}/opt/${_pkgname}/kernels/*/*
    install -d -m777 "${pkgdir}/opt/${_pkgname}"
}
