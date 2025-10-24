# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=12.5.6
pkgrel=1
pkgdesc="Audible audiobook manager: liberate your Library"
arch=('x86_64')
url="https://github.com/rmcrackan/Libation"
license=('GPL-3.0-only')
depends=('bash' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'lttng-ust2.12')
makedepends=('dotnet-sdk>=9')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e795351556cb736ee4ba5e4c0691eaee8d4d15ae156990d694c9f78bc1a3b3ec')

build() {
    cd "${pkgname^}-${pkgver}"
    dotnet publish Source/LibationAvalonia/LibationAvalonia.csproj \
        --configuration Release \
        --output build \
        --runtime linux-x64 \
        -p:PublishProfile=Source/LibationAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
    dotnet publish Source/LoadByOS/LinuxConfigApp/LinuxConfigApp.csproj \
        --configuration Release \
        --output build \
        --runtime linux-x64 \
        -p:PublishProfile=Source/LoadByOS/LinuxConfigApp/Properties/PublishProfiles/LinuxProfile.pubxml
    dotnet publish Source/LibationCli/LibationCli.csproj \
        --configuration Release \
        --output build \
        --runtime linux-x64 \
        -p:PublishProfile=Source/LibationCli/Properties/PublishProfiles/LinuxProfile.pubxml
    dotnet publish Source/HangoverAvalonia/HangoverAvalonia.csproj \
        --configuration Release \
        --output build \
        --runtime linux-x64 \
        -p:PublishProfile=Source/HangoverAvalonia/Properties/PublishProfiles/LinuxProfile.pubxml
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
