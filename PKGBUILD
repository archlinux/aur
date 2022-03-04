#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steam++-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.6.9
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
makedepends=('git' 'dotnet-sdk>=6.0')
checkdepends=('aspnet-runtime>=6.0')
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
    git describe --tags | sed "s/-/./g;s/v//"
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
    # If you build failed because dotnet-sdk used by this project is too new,
    # you can download required sdk at https://dotnet.microsoft.com/en-us/download 
    # and set PATH to /path/to/your/dotnet/sdk:$PATH to solve this problem.
    cd "${srcdir}/SteamTools"
    case ${CARCH} in
        x86_64)
            _profile=linux-x64
            ;;
        aarch64)
            _profile=linux-arm64
            ;;
        *)
            _profile=linux-${CARCH}
            ;;
    esac
    dotnet restore ./SteamToolsV2+.Linux.slnf
    dotnet build ./src/ST.Client.Desktop.Avalonia.App/ST.Client.Avalonia.App.csproj -c "Release"
    dotnet publish ./src/ST.Client.Desktop.Avalonia.App/ST.Client.Avalonia.App.csproj -c "Release" \
        -p:PublishProfile=${_profile} -p:DeployOnBuild=true -p:ExtraDefineConstants=${_profile} \
        --nologo --output ./linux-out
}
package(){
    mkdir -p "${pkgdir}/opt/steam++"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/SteamTools/linux-out"
    cp -a * "${pkgdir}/opt/steam++"
    for file in libe_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so Steam++
    do
        chmod 755 "${pkgdir}/opt/steam++/${file}"
    done
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
