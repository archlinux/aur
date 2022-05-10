#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.7.2.r44.g60c8395e
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
makedepends=('git' 'curl' 'lsb-release' 'tar' 'unzip')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('!strip')
source=(
    'git+https://github.com/BeyondDimension/SteamTools'
    'git+https://github.com/BeyondDimension/Credentials-Public'
    'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh'
    'watt-toolkit.desktop'
    )
sha256sums=('SKIP'
            'SKIP'
            '760596d2e182e0edf05f4a10bd0fa266086d700fdd96438d2663f28e538912e3'
            'c0350e404913647813bffe4d200ca22651046c743f07d438925de0a58b585fe3')
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
prepare(){
    cd "${srcdir}/SteamTools"
    [[ -d "${srcdir}/dotnet-sdk" ]] && rm -rf "${srcdir}/dotnet-sdk"
    bash "${srcdir}/dotnet-install.sh" --install-dir "${srcdir}/dotnet-sdk" --channel Current --no-path
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
    mkdir -p "${pkgdir}/opt/watt-toolkit"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    mkdir -p "${pkgdir}/usr/bin"
    cd "${srcdir}/SteamTools/linux-out"
    cp -a * "${pkgdir}/opt/watt-toolkit"
    for file in libe_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so Steam++
    do
        chmod 755 "${pkgdir}/opt/watt-toolkit/${file}"
    done
    cd "${srcdir}/SteamTools/resources/AppIcon"
    for width in 16 24 32 48 64 96 128 256 512 1024
    do
        echo "Processing ${width}x${width} icon..."
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps"
        install -Dm644 Logo_${width}.png "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/watt-toolkit.png"
    done
    ln -sf /opt/steam++/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
}
