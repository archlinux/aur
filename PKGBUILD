# Maintainer: Michał Przybyś <michal@przybys.eu>
_sdk=2.2
pkgname=roslynpad
pkgver=14.1
pkgrel=3
pkgdesc='A cross-platform C# editor based on Roslyn and AvalonEdit'
arch=(any)
url='https://roslynpad.net/'
license=(Apache)
depends=("dotnet-runtime-${_sdk}"
   desktop-file-utils)
makedepends=("dotnet-sdk-${_sdk}")
source=("https://github.com/aelij/RoslynPad/archive/${pkgver}.tar.gz"
    config_path.patch
    roslynpad
    roslynpad.desktop
    roslynpad.install)
md5sums=(93f43b4ca8107a8ba6d940bc6bbdf7e6
    8fe1f6f59439d1c09a779d10496241e5
    2bbafbadd0b5f3d088ce8a248058a06f
    d6788321c8bf62a8b5198039dbbee2d3
    a91349cbede88402f0b44728ad9b443f)

prepare() {
    cd "${srcdir}/RoslynPad-${pkgver}/src"
    patch -Np1 -i "${srcdir}/config_path.patch"
}

build() {
    cd "${srcdir}/RoslynPad-${pkgver}/src"
    latest_sdk=$(dotnet --list-sdks | sed -E "s/^(${_sdk/./\.}}\.[0-9]+) .*/\1/; t; d" | tail -1)
    dotnet new globaljson --force --sdk-version "${latest_sdk}"

    cd RoslynPad.NetCore
    dotnet publish -c Release /p:DebugType=None
}

package() {
    cd "${srcdir}"
    install -Dm755 roslynpad "${pkgdir}/usr/bin/roslynpad"
    install -Dm644 roslynpad.desktop "${pkgdir}/usr/share/applications/roslynpad.desktop"

    cd "RoslynPad-${pkgver}/src"
    install -Dm644 RoslynPad/Resources/RoslynPad.svg "${pkgdir}/usr/share/pixmaps/roslynpad.svg"

    cd "RoslynPad.NetCore/bin/Release/netcoreapp${_sdk}/publish"
    install -dm755 "${pkgdir}/opt/roslynpad"
    cp -aR * "${pkgdir}/opt/roslynpad"
}
