# Maintainer: Michał Przybyś <michal@przybys.eu>
_sdk=3.1
pkgname=roslynpad
pkgver=15.1
pkgrel=3
pkgdesc='A cross-platform C# editor based on Roslyn and AvalonEdit'
arch=(any)
url='https://roslynpad.net/'
license=(Apache)
depends=("dotnet-runtime-${_sdk}"
        desktop-file-utils)
makedepends=("dotnet-sdk-${_sdk}")
source=("https://github.com/roslynpad/roslynpad/archive/refs/tags/${pkgver}.tar.gz"
        config_path.patch
        roslynpad
        roslynpad.desktop
        roslynpad.install)
md5sums=(8e3ef5f289445c155b76664d42f610f2
        7d8cd9ff78a48d5b5a9a2f282322ba11
        18214346078c30228f41454d4ad73e42
        d6788321c8bf62a8b5198039dbbee2d3
        a91349cbede88402f0b44728ad9b443f)

prepare() {
    cd "${srcdir}/roslynpad-${pkgver}"
    rm global.json
    latest_sdk=$(dotnet --list-sdks | sed -E "s/^(${_sdk/./\.}\.[0-9]+) .*/\1/; t; d" | tail -1)
    dotnet new globaljson --force --sdk-version "${latest_sdk}"

    cd "${srcdir}/roslynpad-${pkgver}/src"
    patch -Np1 -i "${srcdir}/config_path.patch"

}

build() {
    cd "${srcdir}/roslynpad-${pkgver}/src/RoslynPad.Avalonia"
    dotnet build -c Release /p:DebugType=None /p:TreatWarningsAsErrors=False
}

package() {
    cd "${srcdir}/roslynpad-${pkgver}/src/RoslynPad.Avalonia"
    dotnet publish --no-build -c Release -o "${pkgdir}/opt/roslynpad" /p:DebugType=None || :

    cd "${srcdir}"
    install -Dm755 roslynpad "${pkgdir}/usr/bin/roslynpad"
    install -Dm644 roslynpad.desktop "${pkgdir}/usr/share/applications/roslynpad.desktop"
    install -Dm644 "roslynpad-${pkgver}/src/RoslynPad/Resources/RoslynPad.svg" "${pkgdir}/usr/share/pixmaps/roslynpad.svg"
}
