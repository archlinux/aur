# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=14.1.0
pkgrel=1
pkgdesc="A free, open-source application for downloading and managing your Audible audiobooks"
arch=('x86_64')
url="https://getlibation.com"
license=('GPL-3.0-only')
depends=('bash' 'dotnet-runtime=10.0' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++')
makedepends=('dotnet-sdk=10.0')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rmcrackan/Libation/archive/v${pkgver}.tar.gz")
sha256sums=('85be5bcee9ad83d7d1216585ef1aec71a7f7652ec73108619fdbb07f56880872')

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
        -p:SelfContained=false
    )
    dotnet publish "${publish_args[@]}" Source/LibationAvalonia/LibationAvalonia.csproj
    dotnet publish "${publish_args[@]}" Source/LoadByOS/LinuxConfigApp/LinuxConfigApp.csproj
    dotnet publish "${publish_args[@]}" Source/LibationCli/LibationCli.csproj
    dotnet publish "${publish_args[@]}" Source/HangoverAvalonia/HangoverAvalonia.csproj
}

package() {
    cd "${pkgname^}-${pkgver}"
    install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
    cp -r build "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 Source/LoadByOS/LinuxConfigApp/Libation.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 Images/libation_glass.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    ln -s "/usr/lib/${pkgname}/Hangover" "${pkgdir}/usr/bin/hangover"
    ln -s "/usr/lib/${pkgname}/Libation" "${pkgdir}/usr/bin/libation"
    ln -s "/usr/lib/${pkgname}/LibationCli" "${pkgdir}/usr/bin/libationcli"
}
