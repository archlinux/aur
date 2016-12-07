# Maintainers: Mike Cooper <mythmon at elem.us>, Mikko <mikko at 5x.fi>

pkgname=terraria-server
pkgver=1.3.4.4
pkgrel=18
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

sha256sums=('ef95d59c921e36766cbbd3a36a7494e88bb9cd47454942a84adf59050905a0dd'
            '100b68ee3b88e7b095d23cd9d56e9480b21788b5165ebbf752c16b19693299f7'
            '3823fcecd3c9d4144167c30e69f69c39c6b17d75bd40dc0abe7dc88f0d4b28cb'
            '24478cfa6e4e21066454ab47a7748c49d6a07d644bfb740d9c284275d6428e3a')

package() {
    unzip -o "${pkgname}-${_pkgver}.zip"
    cd 'Dedicated Server/Linux'
    dest="${pkgdir}/etc/terraria-server"
    install -o 697 -g 697  -d "${dest}"
    install -m644 FNA.dll "${dest}/"
    install -m644 FNA.dll.config "${dest}/"
    install -m644 Ionic.Zip.CF.dll "${dest}/"
    install -m644 Steamworks.NET.dll "${dest}/"
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
