#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=steam++-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.7.0.pre1.r127.gcd6d7e72
pkgrel=3
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
makedepends=('git')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++')
conflicts=('steam++')
options=('!strip')
source=(
    'git+https://github.com/BeyondDimension/SteamTools'
    'git+https://github.com/BeyondDimension/Credentials-Public'
    'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh'
    'steamtools.desktop'
    )
sha256sums=('SKIP'
            'SKIP'
            '760596d2e182e0edf05f4a10bd0fa266086d700fdd96438d2663f28e538912e3'
            '8255faa817982a81ee3c12599e6ca4b10b39a21eb49b2dfd6d0ad09939a25d0b')
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags --long | sed 's/v//;s/-/./;s/-/.r/;s/-/./g'
}
prepare(){
    cd "${srcdir}/SteamTools"
    bash "${srcdir}/dotnet-install.sh" --install-dir "${srcdir}/dotnet-sdk"
    git submodule update --init --recursive
    cp "${srcdir}"/Credentials-Public/*.pfx .
    PATH="${srcdir}/dotnet-sdk:${PATH}" dotnet workload install android
}
check(){
    cd "${srcdir}/SteamTools"
    PATH="${srcdir}/dotnet-sdk:${PATH}"
    dotnet test ./tests/Common.UnitTest/Common.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.UnitTest/ST.Client.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.Desktop.UnitTest/ST.Client.Desktop.UnitTest.csproj -c "Release"
}
build(){
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
    PATH="${srcdir}/dotnet-sdk:${PATH}"
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
