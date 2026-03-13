#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>

_dotnet_version=10.0
_download_dotnet_version="$_dotnet_version"

pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=3.1.0.r0.g86122510b
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
options=('staticlibs' '!strip')
source=(
    'git+https://github.com/BeyondDimension/SteamTools'
    'git+https://github.com/BeyondDimension/Credentials-Public'
    'watt-toolkit.desktop'
    'set-cap.hook'
    '0001-fix-MsgPack.diff'
    '0002-fix-X509CertificatePackable-to-byte[].diff'
    'environment_check.sh'
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
    'git+https://github.com/BeyondDimension/appcenter-sdk-dotnet.git'
    'git+https://github.com/reactiveui/Fusillade.git'
    'git+https://github.com/BeyondDimension/Avalonia8.git'
    'git+https://github.com/BeyondDimension/SteamKit.git'
    'Protobufs::git+https://github.com/steamdatabase/protobufs.git')
sha256sums=('SKIP'
            'SKIP'
            '971f095988215965ba7256158a2c23af8be27222ea4f50655acd6c3bf3c4a23a'
            'ee4c5a20eb3a44f9af37b67cc6b5f91e646ac8a35bb1b8be784413dad2ed34ea'
            '382f314cebeba3346c5d59344f72b0e05db6293e3a10185e3f5ceee0c73cbe81'
            'a822f7fb11aa94e7aed682f8f85272a820e20b3169c3856c9ddba6782e514743'
            'da96b337ef8f79f170fb5976dffee4c52ecf5bc842e3dac9d8479a198887b8b1'
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
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


declare -Ag _plugins=(
    [BD.WTTS.Client.Plugins.Accelerator]=Accelerator
    [BD.WTTS.Client.Plugins.Accelerator.ReverseProxy]=Accelerator.ReverseProxy
    [BD.WTTS.Client.Plugins.Authenticator]=Authenticator
    [BD.WTTS.Client.Plugins.GameAccount]=GameAccount
    [BD.WTTS.Client.Plugins.GameList]=GameList
    [BD.WTTS.Client.Plugins.GameTools]=GameTools
    [BD.WTTS.Client.Plugins.SteamIdleCard]=SteamIdleCard
    [BD.WTTS.Client.Plugins.ArchiSteamFarmPlus]=ArchiSteamFarmPlus
    [BD.WTTS.Client.Plugins.SteamIdleCard]=SteamIdleCard
    #[BD.WTTS.Client.Plugins.Update]=Update
)

_fill_submodules_recursively(){
    if [[ -f "$1/.gitmodules" ]]
    then
        while read -r submodule
        do
            echo "Filling submodule $submodule in $1/.gitmodules..."
            local path new_url
            path="$(git config get --file "$1/.gitmodules" "submodule.$submodule.path")"
            new_url="file://$srcdir/$(basename "$path")"
            git -C "$1" submodule set-url "$path" "$new_url"
            echo "Setting url of $path to $new_url"
            git -C "$1" -c protocol.file.allow=always submodule update --init "$path"
            _fill_submodules_recursively "$1/$path"
        done < <(git config list --file "$1/.gitmodules" --name-only | cut -d . -f 2- | rev | cut -d . -f 2- | rev | sort -u)
    fi
}

prepare(){
    #https://wiki.archlinux.org/title/VCS_package_guidelines#Git_submodules
    _fill_submodules_recursively "${srcdir}/SteamTools"
    # Install dotnet-sdk
    export DOTNET_ROOT="$srcdir/dotnet-sdk"
    export PATH="$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH"
    dotnet-install --channel ${_download_dotnet_version} --install-dir "${DOTNET_ROOT}" --no-path
    if [[ "${_dotnet_version}" != "${_download_dotnet_version}" ]]
    then
        dotnet-install --channel ${_dotnet_version} --install-dir "${DOTNET_ROOT}" --no-path --runtime dotnet
    fi
    dotnet --info | grep RID | cut -d : -f 2 | sed 's/arch/linux/' | xargs > _platform
    local _platform
    _platform="$(< _platform)"
    cd "${srcdir}/SteamTools"
    # SteamTools/src/BD.WTTS.Client.Plugins.GameAccount/Models/PlatformSettings.cs(4,22): error MsgPack003: Type must be marked with MessagePackObjectAttribute: global::BD.WTTS.Models.PlatformSettings (https://github.com/MessagePack-CSharp/MessagePack-CSharp/blob/master/doc/analyzers/MsgPack003.md)
    # SteamTools/src/BD.WTTS.Client.Plugins.Accelerator/Settings/GameAcceleratorSettings.cs(34,49): error MsgPack004: Properties and fields of MessagePackObject-attributed types require either KeyAttribute or IgnoreMemberAttribute: global::BD.WTTS.Settings.GameAcceleratorSettings_.MyGames (https://github.com/MessagePack-CSharp/MessagePack-CSharp/blob/master/doc/analyzers/MsgPack004.md)
    patch -Np1 -i ../0001-fix-MsgPack.diff
    # SteamTools/src/BD.WTTS.Client.Plugins.Accelerator.ReverseProxy/Services/Certificate/ICertificateManager.cs(31,63): error CS1503: Argument 1: cannot convert from 'System.Runtime.Serialization.Formatters.X509CertificatePackable' to 'byte[]'
    patch -Np1 -i ../0002-fix-X509CertificatePackable-to-byte[].diff
    dotnet workload restore src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -p:EnableWindowsTargeting=true
    dotnet restore src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        --runtime="$_platform"
    local _id
    for _id in "${!_plugins[@]}"
    do
        dotnet restore "src/${_id}/${_id}.csproj" --runtime="$_platform"
    done
}
pkgver(){
    cd "${srcdir}/SteamTools"
    git describe --tags --long | sed 's/-rc./.rc/;s/-/.r/;s/-/./g'
}
build(){
    cp -v "${srcdir}/Credentials-Public/"*.pfx "${srcdir}/SteamTools"

    _platform="$(< _platform)"
    cd "${srcdir}/SteamTools"
    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

    echo "Building BD.WTTS.Client.Avalonia.App..."
    dotnet publish src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -c Release --framework "net${_dotnet_version}" --runtime "${_platform}"
    for _id in "${!_plugins[@]}"
    do
        echo "Building plugin ${_id}..."
        case "${_id}" in
            "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
                dotnet publish "src/${_id}/${_id}.csproj" --no-restore -c Release --nologo -v q -p:WarningLevel=1 \
                    -p:PublishSingleFile=true --self-contained  --framework "net${_dotnet_version}" --runtime "${_platform}" \
                    -p:EnableWindowsTargeting=true -p:NoWarn=NU1605 -p:WarningsNotAsErrors=CS8604
                ;;
            *)
                dotnet publish "src/${_id}/${_id}.csproj" --no-restore -c Release --nologo -v q -p:WarningLevel=1 \
                    --framework "net${_dotnet_version}" --runtime "${_platform}" \
                    -p:EnableWindowsTargeting=true
                ;;
        esac
    done
}
package(){
    depends+=(
        'libcap' "aspnet-runtime-${_dotnet_version}" "dotnet-runtime-${_dotnet_version}" 'nss' 'bash' 'hicolor-icon-theme'
        # Steam++.Accelerator
        'gcc-libs'
    )

    _platform="$(< _platform)"
    cd "${srcdir}/SteamTools"
    mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/lib"
    cp -av "${srcdir}/SteamTools/src/BD.WTTS.Client.Avalonia.App/bin/Release/net$_dotnet_version/$_platform/publish" \
        "${pkgdir}/usr/lib/watt-toolkit"
    for _id in "${!_plugins[@]}"
    do
        echo "Installing plugin ${_id}..."
        case "${_id}" in
            "BD.WTTS.Client.Plugins.Accelerator.ReverseProxy")
                install -Dvm755 "${srcdir}/SteamTools/src/${_id}/bin/Release/net${_dotnet_version}/${_platform}/publish/Steam++.Accelerator" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[${_id%.*}]}/Steam++.Accelerator"
                install -Dvm644 "${srcdir}/SteamTools/src/${_id}/bin/Release/net${_dotnet_version}/${_platform}/publish/libe_sqlite3.so" \
                    "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[${_id%.*}]}/libe_sqlite3.so"
                ;;
            *)
                install -Dvm644 -t "${pkgdir}/usr/lib/watt-toolkit/modules/${_plugins[$_id]}" \
                    "${srcdir}/SteamTools/src/${_id}/bin/Release/net${_dotnet_version}/${_platform}/publish/${_id}".*
                ;;
        esac
    done
    echo "Installing misc files..."
    # See ./src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj#L8
    local -r appid=net.steampp.app
    for width in 16 24 32 48 64 96 128 256 512
    do
        echo "Processing ${width}x${width} icon..."
        install -Dvm644 \
            "./res/icons/app/v3/Logo_${width}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/${appid}.png"
    done
    install -Dvm644 "./res/icons/app/v3/Icon_Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appid}.svg"
    install -Dvm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/${appid}.desktop"
    install -Dvm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    install -Dvm755 "${srcdir}/environment_check.sh" "${pkgdir}/usr/lib/watt-toolkit/script/environment_check.sh"
    ln -sf /usr/lib/watt-toolkit/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
    echo "Stripping binaries..."
    find "${pkgdir}/usr/lib/watt-toolkit" -type f -name '*.so' -printf "Stripping shared object %f...\n" \
        -exec strip $STRIP_SHARED {} \;
    # Fix https://github.com/BeyondDimension/SteamTools/issues/3403
    ln -srfv "${pkgdir}/usr/lib/watt-toolkit/Steam++" "${pkgdir}/usr/lib/watt-toolkit/Steam++.sh"
}
