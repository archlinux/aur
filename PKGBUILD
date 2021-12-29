# Maintainers: Mike Cooper <mythmon at elem.us>, Mikko <mikko at 5x.fi>

pkgname=terraria-server
pkgver=1.4.3.2
pkgrel=35
pkgdesc="Official dedicated server for Terraria"
arch=('x86_64' 'x86')
license=('unknown')
url="https://terraria.org/"
depends=('mono' 'screen')
makedepends=('unzip')
install='terraria-server.install'

_pkgver=$(echo $pkgver | sed 's/\.//g')

# Traditional server zip URL:
# "http://terraria.org/server/${pkgname}-${_pkgver}.zip"

# https://terraria.org/server/ links after 1402 give a 404, so we use the archive link instead.
source=("https://terraria.org/api/download/pc-dedicated-server/terraria-server-1432.zip"
        "https://github.com/mono/reference-assemblies/raw/main/v4.8/System.dll"
        "https://github.com/mono/reference-assemblies/raw/main/v4.8/System.Core.dll"
        'terraria-server'
        'config.txt'
        'terraria-server@.service')

sha256sums=('fce0a54133bd881450937893bd86e31b570289c288061fb28b6385a6eac9c7c5'
            '6906a72d0c320697cac46820740fd67976e0b270378a772ea42968c463a2b8e5'
            'b06c0c07ffd912013cc35987d05ce9e6415cc04882b4b9b5c8ebf8a65fbea556'
            'fba253786b8668dabd18b03514b24b3aac9b24ed9a74dfdacee35f41659c30c9'
            '6a87f9f758811528913fa4828667b200ab7dcb6623734475ecbd8f8dab337b2f'
            'b2cfeb15b6e5bf97d1b7a0b0bdbec9289a842d37c52414c5b57aadda66b1b6a6')

package() {
    unzip -o "${pkgname}-${_pkgver}.zip"

    # Copy the updated dlls to /Linux so that they work with Mono 5.x
    cp -rv "System.dll" "${_pkgver}/Linux/System.dll";
    cp -rv "System.Core.dll" "${_pkgver}/Linux/System.Core.dll";

    cd "${_pkgver}/Linux"
    dest="${pkgdir}/opt/terraria-server"
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

    install -d "${pkgdir}/usr/lib/"
    ln -s "/usr/lib/libmonosgen-2.0.so.1.0.0" "${pkgdir}/usr/lib/libmonosgen-2.0.so.0"
}
