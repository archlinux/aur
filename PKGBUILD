#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=2.8.4.r26.g07385d00
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://steampp.net/
license=('GPL3')
depends=('libcap')
makedepends=('git' 'curl')
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('!strip')
source=(
    'git+https://github.com/BeyondDimension/SteamTools'
    'git+https://github.com/BeyondDimension/Credentials-Public'
    'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh'
    'watt-toolkit.desktop'
    'set-cap.hook'
    )
sha256sums=('SKIP'
            'SKIP'
            'aaa889cd9fd06f098144fc065db3ab8525133666d9a21c2ca45017aabfef4d23'
            'e8480ba1b19e8375c80e8ae776645ca3bb86e45731c4938e059d37a09227a60e'
            '495418217e895deed32c8166c5d85718b23676e52b91d1bb412d69d5f945b2e9')
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
}
prepare(){
    cd "${srcdir}/SteamTools"
    bash "${srcdir}/dotnet-install.sh" --install-dir "${srcdir}/dotnet-sdk" --channel Current --no-path
    git submodule update --init --recursive
    for key in aes-key.pfx rsa-public-key-debug.pfx rsa-public-key-release.pfx
    do
        cp "${srcdir}/Credentials-Public/${key}" ${key}
    done
    PATH="${srcdir}/dotnet-sdk:${PATH}" 
    dotnet workload install android
    #dotnet workload install maui
}
check(){
    cd "${srcdir}/SteamTools"
    PATH="${srcdir}/dotnet-sdk:${PATH}"

    # Fix ST.Client.UnitTest, it just works :P
    _unit_test_out=tests/ST.Client.UnitTest/bin/Release/net6.0
    [[ ! -f ${_unit_test_out}/libSkiaSharp.so ]] && \
        install -Dm644 linux-out/libSkiaSharp.so ${_unit_test_out}/libSkiaSharp.so

    dotnet test ./tests/Common.UnitTest/Common.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.UnitTest/ST.Client.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.Desktop.UnitTest/ST.Client.Desktop.UnitTest.csproj -c "Release"
    dotnet test ./tests/ST.Client.Desktop.UnitTest/ST.Client.Desktop.UnitTest.csproj
}
build(){
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
    PATH="${srcdir}/dotnet-sdk:${PATH}" \
    dotnet publish "${srcdir}/SteamTools/src/ST.Client.Desktop.Avalonia.App/ST.Client.Avalonia.App.csproj" \
        -c "Release" \
        -p:PublishProfile=${_profile} -p:DeployOnBuild=true -p:ExtraDefineConstants=${_profile} \
        --nologo --output "${srcdir}/SteamTools/linux-out"
}
package(){
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/icons/hicolor"
    mkdir -p "${pkgdir}/usr/bin"
    for file in libe_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so Steam++
    do
        install -Dm755 \
            "${srcdir}/SteamTools/linux-out/${file}" "${pkgdir}/opt/watt-toolkit/${file}"
    done
    for width in 16 24 32 48 64 96 128 256 512 1024
    do
        echo "Processing ${width}x${width} icon..."
        install -Dm644 \
            "${srcdir}/SteamTools/resources/AppIcon/Logo_${width}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/watt-toolkit.png"
    done
    ln -sf /opt/watt-toolkit/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
}
