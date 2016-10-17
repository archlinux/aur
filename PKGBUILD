# Maintainers: Mike Cooper <mythmon at elem.us>, Mikko <mikko at 5x.fi>

pkgname=terraria-server
pkgver=1.3.3.3
pkgrel=11
pkgdesc="Official dedicated server for Terraria"
arch=('x86_64' 'x86')
license=('unknown')
url="https://terraria.org/"
depends=('mono' 'screen')
makedepends=('unzip')
install='terraria-server.install'

_pkgver=$(echo $pkgver | sed 's/\.//g')

source=("http://terraria.org/server/${pkgname}-${_pkgver}.zip"
        'terraria-server'
        'config.txt'
        'terraria-server@.service')

sha256sums=('ecd6ec686d6f46defb3ae0e75d49ce50cd324a4d390fc067177668ea990ad8bc'
            '785b392de5f41654c586e1a323969f07bf09b8f059d917db93d428d785415f49'
            '10cc09e9a49ec0d035f2237b610cca8dcc696d327c6943c575564b5ef83f6860'
            '27dfa3e01b4da26bccace69bcf02fd91293cac701e48ab358d9495070365c2ac')

package() {
    unzip -o "${pkgname}-${_pkgver}.zip"
    cd 'Dedicated Server/Linux'
    dest="${pkgdir}/etc/terraria-server"
    install -o 697 -g 697  -d "${dest}"
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
    install -m755 config.txt "${dest}/"

    install -o 697 -g 697 -d "${pkgdir}/srv/terraria"
    install -o 697 -g 697 -d "${pkgdir}/var/lib/terraria-server/"

    install -d "${pkgdir}/usr/lib/"
    ln -s "/usr/lib/libmonosgen-2.0.so.1.0.0" "${pkgdir}/usr/lib/libmonosgen-2.0.so.0"
}
