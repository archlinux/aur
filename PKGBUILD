# Maintainer: Mike Cooper <mythmon@elem.us>

pkgname=terraria-server
pkgver=1.3.0.8
pkgrel=7
pkgdesc="Official dedicated server for Terraria"
arch=('x86_64' 'x86')
license=('unknown')
url="https://terraria.org/"
depends=('mono' 'screen')
install='terraria-server.install'

_pkgver=$(echo $pkgver | sed 's/\.//g')

source=("http://terraria.org/server/${pkgname}-linux-${_pkgver}.tar.gz"
        'terraria-server'
        'terraria-server@.service')

sha256sums=('0ab1ee17d78ae1ec039363519840cb1651c6aa22f5a76f014d9cfdca4fb7a333'
            '8a7e23efe3f72d8c88024cf32e53daa4b293bb2b17070dbf80e86876af1e22f9'
            '27dfa3e01b4da26bccace69bcf02fd91293cac701e48ab358d9495070365c2ac')

package() {
    cd "${srcdir}/${pkgname}-linux-${_pkgver}/"
    dest="${pkgdir}/opt/terraria-server"
    install -o 197 -g 197  -d "${dest}"
    install -m644 FNA.dll "${dest}/"
    install -m644 FNA.dll.config "${dest}/"
    install -m644 Ionic.Zip.CF.dll "${dest}/"
    install -m644 Newtonsoft.Json.dll "${dest}/"
    install -m644 TerrariaServer.exe "${dest}/"
    install -m755 TerrariaServer.bin.${CARCH} "${dest}/"

    cd "${srcdir}"
    install -d "${pkgdir}/usr/bin/"
    install -m755 terraria-server "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/lib/systemd/system/"
    install -m644 terraria-server@.service "${pkgdir}/usr/lib/systemd/system/"

    install -o 197 -g 197 -d "${pkgdir}/etc/terraria-server/"
    install -o 197 -g 197 -d "${pkgdir}/var/lib/terraria-server/"

    install -d "${pkgdir}/usr/lib/"
    ln -s "/usr/lib/libmonosgen-2.0.so.1.0.0" "${pkgdir}/usr/lib/libmonosgen-2.0.so.0"
}
