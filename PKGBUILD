# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=12.0.0
pkgrel=1
pkgdesc="Audible audiobook manager: liberate your Library"
arch=('x86_64')
url="https://github.com/rmcrackan/Libation"
license=('GPL-3.0-only')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'lttng-ust2.12')
makedepends=('dotnet-sdk>=9')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b04589f3473bebad39ab51733315a171b82fe1efab6998db7d2cf48a0a3a4f67')

build() {
    cd "${pkgname^}-${pkgver}"
    dotnet publish Source/LibationCli/LibationCli.csproj -c Release -o build -r linux-x64 -p:PublishProfile=Source/LibationCli/Properties/PublishProfiles/LinuxProfile.pubxml
    dotnet publish Source/LibationAvalonia/LibationAvalonia.csproj -c Release -o build -r linux-x64 -p:PublishProfile=Source/LibationAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
    dotnet publish Source/HangoverAvalonia/HangoverAvalonia.csproj -c Release -o build -r linux-x64 -p:PublishProfile=Source/HangoverAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
    dotnet publish Source/LoadByOS/LinuxConfigApp/LinuxConfigApp.csproj -c Release -o build -r linux-x64 -p:PublishProfile=Source/LoadByOS/LinuxConfigApp/Properties/PublishProfiles/LinuxProfile.pubxml
}

package() {
    cd "${pkgname^}-${pkgver}"
    install -Dm755 build/* -t "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 Source/LoadByOS/LinuxConfigApp/Libation.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 Images/libation_glass.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/Libation" "${pkgdir}/usr/bin/libation"
    ln -s "/usr/lib/${pkgname}/Hangover" "${pkgdir}/usr/bin/hangover"
    ln -s "/usr/lib/${pkgname}/LibationCli" "${pkgdir}/usr/bin/libationcli"
}
