# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Maintainer: Martin Rys <https://rys.rs/contact>
# Contributor: Malte Jürgens <maltejur@dismail.de>

pkgname=libation
pkgver=13.1.0
pkgrel=1
pkgdesc="A free, open-source application for downloading and managing your Audible audiobooks"
arch=('x86_64')
url="https://github.com/rmcrackan/Libation"
license=('GPL-3.0-only')
depends=('bash' 'fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'lame' 'lttng-ust2.12')
makedepends=('dotnet-sdk>=10')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('904e55907eb57eb759d69eb201d356178e46fa6ce697e86fb4b4e62feefdbbd7')

prepare() {
    cd "${pkgname^}-${pkgver}"
    sed -i "s/\"version\":.*/\"version\": \"$(dotnet --list-sdks | awk 'END{print $1}')\"/" global.json
}

build() {
    cd "${pkgname^}-${pkgver}"
    local publish_args=(
        --configuration Release
        --output build
        --runtime linux-x64
        -p:PublishProtocol=FileSystem
        -p:PublishReadyToRun=true
        -p:SelfContained=true
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
