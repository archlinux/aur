# Maintainers: Mike Cooper <mythmon at elem.us>, Mikko <mikko at 5x.fi>

pkgname=terraria-server
pkgver=1.3.5.2
pkgrel=20
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

sha256sums=('5a37f56c0cc59ba82d4cd07cea16e2b215a2e78ca75294411749897434844c59'
            '100b68ee3b88e7b095d23cd9d56e9480b21788b5165ebbf752c16b19693299f7'
            '6a87f9f758811528913fa4828667b200ab7dcb6623734475ecbd8f8dab337b2f'
            '24478cfa6e4e21066454ab47a7748c49d6a07d644bfb740d9c284275d6428e3a')

package() {
    unzip -o "${pkgname}-${_pkgver}.zip"
    cd 'Linux'
    dest="${pkgdir}/etc/terraria-server"
    install -o 697 -g 697  -d "${dest}"

    install -m644 FNA.dll "${dest}/"
    install -m644 FNA.dll.config "${dest}/"

    install -m644 Mono.Posix.dll "${dest}/"
    install -m644 Mono.Security.dll "${dest}/"

    install -m644 monoconfig "${dest}/"
    install -m644 monomachineconfig "${dest}/"
    install -m644 mscorlib.dll "${dest}/"
    install -m644 open-folder "${dest}/"

    install -m644 System.Configuration.dll "${dest}/"
    install -m644 System.Core.dll "${dest}/"
    install -m644 System.Data.dll "${dest}/"
    install -m644 System.dll "${dest}/"
    install -m644 System.Drawing.dll "${dest}/"
    install -m644 System.Numerics.dll "${dest}/"
    install -m644 System.Runtime.Serialization.dll "${dest}/"
    install -m644 System.Security.dll "${dest}/"
    install -m644 System.Windows.Forms.dll "${dest}/"
    install -m644 System.Windows.Forms.dll.config "${dest}/"
    install -m644 System.Xml.dll "${dest}/"
    install -m644 System.Xml.Linq.dll "${dest}/"

    install -m644 TerrariaServer.exe "${dest}/"
    install -m755 TerrariaServer.bin.${CARCH} "${dest}/"

    install -m644 WindowsBase.dll "${dest}/"

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
