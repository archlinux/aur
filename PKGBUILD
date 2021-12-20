#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steam++-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.6.1_302_gb947d6cd
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
depends=('dotnet-runtime>=6.0.1')
makedepends=('git' 'dotnet-sdk>=6.0.1')
checkdepends=('aspnet-runtime>=6.0.1')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++')
conflicts=('steam++')
options=('!strip')
source=('git+https://github.com/BeyondDimension/SteamTools' 'git+https://github.com/BeyondDimension/Credentials-Public' 'steamtools.desktop')
sha256sums=('SKIP'
            'SKIP'
            '8255faa817982a81ee3c12599e6ca4b10b39a21eb49b2dfd6d0ad09939a25d0b')
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags | sed "s/-/_/g;s/v//"
}
prepare(){
    cd "${srcdir}/SteamTools"
    git submodule update --init --recursive
    cp "${srcdir}"/Credentials-Public/*.pfx .
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
    if [ ${CARCH} == "aarch64" ]
    then
    	_arch=arm64
    else
        _arch=x64
    fi
    dotnet publish ./src/ST.Client.Desktop.Avalonia.App/ST.Client.Avalonia.App.csproj -c "Release" -p:PublishProfile="linux-${_arch}" -p:DeployOnBuild=true -p:ExtraDefineConstants="linux-${_arch}" --nologo
}
package(){
    mkdir -p "${pkgdir}/opt/steam++"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/SteamTools/src/ST.Client.Desktop.Avalonia.App/bin/Release/Publish/linux-x64/"
    cp -a * "${pkgdir}/opt/steam++"
    cd "${srcdir}/SteamTools/resources/AppIcon"
    for width in 16 24 32 48 64 96 128 256 512 1024
    do
        echo "Processing ${width}x${width} icon..."
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps"
        install -Dm644 Logo_${width}.png "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/steam++.png"
    done
    ln -sf /opt/steam++/Steam++ "${pkgdir}/usr/bin/steam++"
    install -Dm644 "${srcdir}/steamtools.desktop" "${pkgdir}/usr/share/applications/steam++.desktop"
}
