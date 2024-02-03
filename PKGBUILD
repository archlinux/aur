#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>

_dotnet_version=8.0

pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=3.0.0.rc3.r17.g62efead06
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://steampp.net/"
license=('GPL-3.0-only')
depends=(
    # libe_sqlite3.so libHarfBuzzSharp.so libSkiaSharp.so
    'glibc'
    # libSkiaSharp.so
    'fontconfig' 'freetype2' 'expat' 'zlib' 'bzip2' 'libpng' 'harfbuzz' 'brotli' 'glib2' 'graphite' 'pcre2'
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


declare -Arg _plugins=(
    [BD.WTTS.Client.Plugins.Accelerator]=Accelerator
    [BD.WTTS.Client.Plugins.Accelerator.ReverseProxy]=Accelerator.ReverseProxy
    [BD.WTTS.Client.Plugins.Authenticator]=Authenticator
    [BD.WTTS.Client.Plugins.GameAccount]=GameAccount
    [BD.WTTS.Client.Plugins.GameList]=GameList
    [BD.WTTS.Client.Plugins.GameTools]=GameTools
    [BD.WTTS.Client.Plugins.SteamIdleCard]=SteamIdleCard
    [BD.WTTS.Client.Plugins.ArchiSteamFarmPlus]=ArchiSteamFarmPlus
    #[BD.WTTS.Client.Plugins.Update]=Update
)

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
    msg2 "Building BD.WTTS.Client.Avalonia.App..."
    dotnet publish src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -c Release --output "${srcdir}/SteamTools/linux-out" --framework "net${_dotnet_version}"
    msg2 "Building plugins..."
    for _id in "${!_plugins[@]}"
    do
        echo "Building ${_id}..."
        case "${_id}" in
            "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
                dotnet publish "src/${_id}/${_id}.csproj" -c Release --nologo -v q -p:WarningLevel=1 \
                    -p:PublishSingleFile=true --self-contained \
                    --output "${srcdir}/SteamTools/linux-plugins-out/${_plugins[${_id}]}" --framework "net${_dotnet_version}"
                ;;
            *)
                dotnet publish "src/${_id}/${_id}.csproj" -c Release --nologo -v q -p:WarningLevel=1 \
                    --output "${srcdir}/SteamTools/linux-plugins-out/${_plugins[${_id}]}" --framework "net${_dotnet_version}"
                ;;
        esac
    done
}
check(){
    # Hacking about missing depends
    cd "${srcdir}/SteamTools/src/BD.WTTS.UnitTest"
    dotnet add package System.DirectoryServices

    cd "${srcdir}/SteamTools"
    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

    dotnet test src/BD.WTTS.UnitTest/BD.WTTS.UnitTest.csproj \
        -c Release -p:GeneratePackageOnBuild=false --nologo -v q -p:WarningLevel=1
}
package(){
    depends+=(
        'libcap' "aspnet-runtime-${_dotnet_version}" "dotnet-runtime-${_dotnet_version}" 'nss' 'sh' 'hicolor-icon-theme'
        # Steam++.Accelerator
        'gcc-libs'
    )

    cd "${srcdir}/SteamTools"
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
    cp -av "${srcdir}/SteamTools/linux-out" "${pkgdir}/usr/lib/watt-toolkit"
    msg2 "Removing useless runtimes..."
    case ${CARCH} in
        x86_64)
            _platform=linux-x64
            ;;
        armv7l)
            _platform=linux-arm
            ;;
        aarch64)
            _platform=linux-arm64
            ;;
        *)
            _platform=linux-${CARCH}
            ;;
    esac
    find "${pkgdir}/usr/lib/watt-toolkit/runtimes" -mindepth 1 -maxdepth 1 ! -name "${_platform}" -exec rm -rf {} \;
    msg2 "Installing plugins..."
    for _id in "${!_plugins[@]}"
    do
        echo "Installing ${_id}..."
        case "${_id}" in
            "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
                install -Dm755 "${srcdir}/SteamTools/linux-plugins-out/${_plugins[${_id}]}/Steam++.Accelerator" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/Accelerator/Steam++.Accelerator"
                install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/${_plugins[${_id}]}/libe_sqlite3.so" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/Accelerator/libe_sqlite3.so"
                ;;
            *)
                install -Dm644 "${srcdir}/SteamTools/linux-plugins-out/${_plugins[${_id}]}/${_id}.dll" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[${_id}]}/${_id}.dll"
                ;;
        esac
    done
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
