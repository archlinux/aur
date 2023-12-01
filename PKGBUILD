#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>

_dotnet_version=8.0

pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=3.0.0.rc3.r1.g4e2cfc23a
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://steampp.net/"
license=('GPL3')
depends=(
    'libcap' "aspnet-runtime-${_dotnet_version}" 'nss'
    # extra/skia-sharp
    'fontconfig' 'expat' 'libfreetype.so' 'libheif' 'libjpeg-turbo' 'libpng' 'libwebp' 'zlib'
)
makedepends=('git' 'dotnet-install') # We need to install some workloads so dotnet-sdk is not available here
optdepends=('steam: need official or flatpak version of steam')
provides=('steam++' 'watt-toolkit')
conflicts=('steam++' 'watt-toolkit')
options=('!strip')
source=(
    'git+https://github.com/BeyondDimension/SteamTools'
    'git+https://github.com/BeyondDimension/Credentials-Public'
    'watt-toolkit.desktop'
    'set-cap.hook'
    # Submodules
    'git+https://github.com/BeyondDimension/DirectoryPackages.git'
    'git+https://github.com/BeyondDimension/ArchiSteamFarm.git'
    'git+https://github.com/BeyondDimension/Avalonia.Image2.git'
    'git+https://github.com/BeyondDimension/Gameloop.Vdf.git'
    'git+https://github.com/BeyondDimension/Steam4NET.git'
    'git+https://github.com/BeyondDimension/Titanium-Web-Proxy.git'
    'git+https://github.com/BeyondDimension/SteamAchievementManager.git'
    'git+https://github.com/JustArchiNET/ASF-ui.git'
    'wiki::git+https://github.com/JustArchiNET/ArchiSteamFarm.wiki.git'
    'git+https://github.com/BeyondDimension/SteamClient.git'
    'git+https://github.com/quamotion/dotnet-packaging.git'
    'git+https://github.com/BeyondDimension/WTTS.MicroServices.ClientSDK.git'
    'git+https://github.com/BeyondDimension/Common.git'
    'git+https://github.com/BeyondDimension/WinAuth.git'
    'git+https://github.com/BeyondDimension/ValveKeyValue.git'
    'git+https://github.com/BeyondDimension/WTTS.Public.git'
    'git+https://github.com/BeyondDimension/Facepunch.Steamworks.git'
    )
sha256sums=('SKIP'
            'SKIP'
            'e8480ba1b19e8375c80e8ae776645ca3bb86e45731c4938e059d37a09227a60e'
            '2a906c968f25e7e8a8fd949a7f024da7277bf31098371bdb066b8d422982fa8a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare(){
    target_dirs=(
        "${srcdir}/SteamTools" "${srcdir}/SteamTools/ref/ArchiSteamFarm"
        "${srcdir}/SteamTools/ref/Avalonia.Image2" "${srcdir}/SteamTools/ref/Common"
        "${srcdir}/SteamTools/ref/SteamClient" "${srcdir}/SteamTools/ref/dotnet-packaging"
        "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK" "${srcdir}/SteamTools/ref/WinAuth"
        "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK/ref/WTTS.Public"
    )
    #https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    for target_dir in "${target_dirs[@]}"
    do
        cd "${target_dir}"
        git submodule init
        grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
        do
            repo=$(basename "${module}")
            git config "submodule.${module}.url" "${srcdir}/${repo}"
        done
        git -c protocol.file.allow=always submodule update
    done
    # Install dotnet-sdk
    dotnet-install --channel ${_dotnet_version} --install-dir "${srcdir}/dotnet-sdk" --no-path

    # Hacking about missing depends
    missing_depends=("SkiaSharp" "SkiaSharp.NativeAssets.Linux" "System.DirectoryServices")
    cd "${srcdir}/SteamTools/src/BD.WTTS.UnitTest"
    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH
    dotnet restore

    sed -i "$ i <ItemGroup>" BD.WTTS.UnitTest.csproj
    for missing_depend in "${missing_depends[@]}"
    do
        if ! dotnet list package | grep -q "${missing_depend}"
        then
            sed -i "$ i <PackageReference Include=\"${missing_depend}\" />" BD.WTTS.UnitTest.csproj
        fi
    done
    sed -i "$ i </ItemGroup>" BD.WTTS.UnitTest.csproj

    sed -i "2 a <ItemGroup>\n<PackageVersion Include=\"System.DirectoryServices\" Version=\"7.0.1\" />\n</ItemGroup>" \
        "${srcdir}/SteamTools/src/Directory.Packages.props"
}
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags --long | sed 's/-rc./.rc/;s/-/.r/;s/-/./g'
}
build(){
    keys=(
        aes-key.pfx rsa-public-key-debug.pfx rsa-public-key-release.pfx
    )
    cd "${srcdir}/SteamTools"
    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

    for key in "${keys[@]}"
    do
        cp "${srcdir}/Credentials-Public/${key}" "${key}"
    done

    dotnet workload restore src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj
#     dotnet build src/BD.WTTS.Client.AppHost/BD.WTTS.Client.AppHost.csproj \
#         -c Release --nologo -v q /property:WarningLevel=1
#     dotnet build src/BD.WTTS.Client.Plugins.Accelerator.ReverseProxy/BD.WTTS.Client.Plugins.Accelerator.ReverseProxy.csproj \
#         -c Release --nologo -v q /property:WarningLevel=1
#     dotnet build src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
#         -c Release --nologo -v q /property:WarningLevel=1
#     dotnet build src/BD.WTTS.Client.Avalonia.Designer.HostApp/BD.WTTS.Client.Avalonia.Designer.HostApp.csproj \
#         -c Release --nologo -v q /property:WarningLevel=1
    msg2 "Building main program..."
    dotnet publish src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-out" --framework "net${_dotnet_version}"
    msg2 "Building accelerator plugin..."
    dotnet publish src/BD.WTTS.Client.Plugins.Accelerator/BD.WTTS.Client.Plugins.Accelerator.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-plugins-out/Accelerator" --framework "net${_dotnet_version}"
    dotnet publish src/BD.WTTS.Client.Plugins.Accelerator.ReverseProxy/BD.WTTS.Client.Plugins.Accelerator.ReverseProxy.csproj \
        -c Release -p:PublishSingleFile=true --self-contained --framework "net${_dotnet_version}" \
        --output "${srcdir}/SteamTools/linux-plugins-out/Accelerator.ReverseProxy"
    msg2 "Building authenticator plugin..."
    dotnet publish src/BD.WTTS.Client.Plugins.Authenticator/BD.WTTS.Client.Plugins.Authenticator.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-plugins-out/Authenticator" --framework "net${_dotnet_version}"
    msg2 "Building gameaccount plugin..."
    dotnet publish src/BD.WTTS.Client.Plugins.GameAccount/BD.WTTS.Client.Plugins.GameAccount.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-plugins-out/GameAccount" --framework "net${_dotnet_version}"
    msg2 "Building gamelist plugin..."
    dotnet publish src/BD.WTTS.Client.Plugins.GameList/BD.WTTS.Client.Plugins.GameList.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-plugins-out/GameList" --framework "net${_dotnet_version}"
    msg2 "Building gametools plugin..."
    dotnet publish src/BD.WTTS.Client.Plugins.GameTools/BD.WTTS.Client.Plugins.GameTools.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-plugins-out/GameTools" --framework "net${_dotnet_version}"
    msg2 "Building steamidlecard plugin..."
    dotnet publish src/BD.WTTS.Client.Plugins.SteamIdleCard/BD.WTTS.Client.Plugins.SteamIdleCard.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-plugins-out/SteamIdleCard" --framework "net${_dotnet_version}"
#     msg2 "Building archisteamfarmplus plugin..."
#     dotnet publish src/BD.WTTS.Client.Plugins.ArchiSteamFarmPlus/BD.WTTS.Client.Plugins.ArchiSteamFarmPlus.csproj \
#         -c Release --output "${srcdir}/SteamTools/linux-plugins-out/ArchiSteamFarmPlus" --framework "net${_dotnet_version}"
#     msg2 "Building update plugin..."
#     dotnet publish src/BD.WTTS.Client.Plugins.Update/BD.WTTS.Client.Plugins.Update.csproj \
#         -c Release --output "${srcdir}/SteamTools/linux-plugins-out/Update" --framework "net${_dotnet_version}"
}
check(){
    cd "${srcdir}/SteamTools"
    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

    dotnet test src/BD.WTTS.UnitTest/BD.WTTS.UnitTest.csproj \
        -c Release -p:GeneratePackageOnBuild=false --nologo -v q /property:WarningLevel=1
}
package(){
    depends+=("hicolor-icon-theme")

    cd "${srcdir}/SteamTools"
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
    cp -av "${srcdir}/SteamTools/linux-out" "${pkgdir}/usr/lib/watt-toolkit"
    msg2 "Removing useless runtimes..."
    case ${CARCH} in
        x86_64)
            _id=linux-x64
            ;;
        armv7l)
            _id=linux-arm
            ;;
        aarch64)
            _id=linux-arm64
            ;;
        *)
            _id=linux-${CARCH}
            ;;
    esac
    find "${pkgdir}/usr/lib/watt-toolkit/runtimes" -mindepth 1 -maxdepth 1 -type d ! -name "${_id}" -exec rm -rf {} \;
    msg2 "Installing plugins..."
    install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/Accelerator/BD.WTTS.Client.Plugins.Accelerator.dll" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/Accelerator/BD.WTTS.Client.Plugins.Accelerator.dll"
    install -Dm755 "${srcdir}/SteamTools/linux-plugins-out/Accelerator.ReverseProxy/Steam++.Accelerator" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/Accelerator/Steam++.Accelerator"
    install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/Accelerator.ReverseProxy/libe_sqlite3.so" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/Accelerator/libe_sqlite3.so"
    install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/Authenticator/BD.WTTS.Client.Plugins.Authenticator.dll" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/Authenticator/BD.WTTS.Client.Plugins.Authenticator.dll"
    install -Dm64 "${srcdir}/SteamTools/linux-plugins-out/GameAccount/BD.WTTS.Client.Plugins.GameAccount.dll" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/GameAccount/BD.WTTS.Client.Plugins.GameAccount.dll"
    install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/GameList/BD.WTTS.Client.Plugins.GameList.dll" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/GameList/BD.WTTS.Client.Plugins.GameList.dll"
    install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/GameTools/BD.WTTS.Client.Plugins.GameTools.dll" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/GameTools/BD.WTTS.Client.Plugins.GameTools.dll"
    install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/SteamIdleCard/BD.WTTS.Client.Plugins.SteamIdleCard.dll" \
        "${pkgdir}/usr/lib/watt-toolkit/modules/SteamIdleCard/BD.WTTS.Client.Plugins.SteamIdleCard.dll"
#     install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/ArchiSteamFarmPlus/BD.WTTS.Client.Plugins.ArchiSteamFarmPlus.dll" \
#         "${pkgdir}/usr/lib/watt-toolkit/modules/ArchiSteamFarmPlus/BD.WTTS.Client.Plugins.ArchiSteamFarmPlus.dll"
#     install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/Update/BD.WTTS.Client.Plugins.Update.dll" \
#         "${pkgdir}/usr/lib/watt-toolkit/modules/Update/BD.WTTS.Client.Plugins.Update.dll"
    msg2 "Installing misc files..."
    for width in 16 24 32 48 64 96 128 256 512
    do
        echo "Processing ${width}x${width} icon..."
        install -Dm644 \
            "./res/icons/app/v3/Logo_${width}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/watt-toolkit.png"
    done
    install -Dm644 "./res/icons/app/v3/Icon_Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/watt-toolkit.svg"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    install -Dm755 "./build/linux/environment_check.sh" "${pkgdir}/usr/lib/watt-toolkit/script/environment_check.sh"
    ln -sf /usr/lib/watt-toolkit/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
}
