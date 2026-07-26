# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=13.6.0
pkgrel=1
pkgdesc="A free, open-source application for downloading and managing your Audible audiobooks"
arch=('x86_64')
url="https://getlibation.com"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++')
makedepends=('dotnet-sdk>=10')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rmcrackan/Libation/archive/v${pkgver}.tar.gz")
sha256sums=('9b4a5997741ab7c9ed3292f9fc0445b6b46d54c6bb4d46e83f9b2bb06d8e7635')

prepare() {
    cd "${pkgname^}-${pkgver}"
    SDK_VERSION=$(dotnet --list-sdks | awk 'END{print $1}')
    sed -i "s/\"version\": \".*\"/\"version\": \"${SDK_VERSION}\"/" global.json
}

build() {
    cd "${pkgname^}-${pkgver}"
    local publish_args=(
        --configuration Release
        --output build
        --runtime linux-x64
        -p:PublishProtocol=FileSystem
        -p:PublishReadyToRun=true
    )
    dotnet publish "${publish_args[@]}" Source/LibationAvalonia/LibationAvalonia.csproj
    dotnet publish "${publish_args[@]}" Source/LoadByOS/LinuxConfigApp/LinuxConfigApp.csproj
    dotnet publish "${publish_args[@]}" Source/LibationCli/LibationCli.csproj
    dotnet publish "${publish_args[@]}" Source/HangoverAvalonia/HangoverAvalonia.csproj
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
