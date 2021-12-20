#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steamtools-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.6.1_301_ge8e64c1c
pkgrel=2
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
depends=('dotnet-runtime>=6.0.1')
makedepends=('git' 'dotnet-sdk>=6.0.1')
checkdepends=('aspnet-runtime>=6.0.1')
optdepends=('steam: need official or flatpak version of steam')
provides=('steamtools')
conflicts=('steamtools')
options=('!strip')
source=('git+https://github.com/BeyondDimension/SteamTools' 'steamtools.desktop')
sha256sums=('SKIP'
            'c5ad80f74cfbcf89f2285f15eb7987766313f2c6393d0b09dadc335979050746')
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags | sed "s/-/_/g;s/v//"
}
prepare(){
    cd "${srcdir}/SteamTools"
    git submodule update --init --recursive
}
check(){
    cd "${srcdir}/SteamTools"
    dotnet test ./tests/Common.UnitTest/Common.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.UnitTest/ST.Client.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.Desktop.UnitTest/ST.Client.Desktop.UnitTest.csproj -c "Release"
}
build(){
    cd "${srcdir}/SteamTools"
    dotnet restore ./SteamToolsV2+.Linux.slnf
    dotnet build ./src/ST.Client.Desktop.Avalonia.App/ST.Client.Avalonia.App.csproj -c "Release"
    dotnet build ./src/ST.Tools.Publish/ST.Tools.Publish.csproj -c "Release"
    dotnet publish ./src/ST.Client.Desktop.Avalonia.App/ST.Client.Avalonia.App.csproj -c "Release" -p:PublishProfile="linux-x64" -p:DeployOnBuild=true -p:ExtraDefineConstants="linux-x64" --nologo
}
package(){
    mkdir -p "${pkgdir}/opt/steamtools"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/SteamTools/src/ST.Client.Desktop.Avalonia.App/bin/Release/Publish/linux-x64/"
    cp -a * "${pkgdir}/opt/steamtools"
    cd "${srcdir}/SteamTools/resources/AppIcon"
    for width in 16 24 32 48 64 96 128 256 512 1024
    do
        echo "Processing ${width}x${width} icon..."
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps"
        install -Dm644 Logo_${width}.png "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/steamtools.png"
    done
    ln -sf /opt/steamtools/Steam++ "${pkgdir}/usr/bin/steamtools"
    install -Dm644 "${srcdir}/steamtools.desktop" "${pkgdir}/usr/share/applications/steamtools.desktop"
}
