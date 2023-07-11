#Maintainer: rmbgame<rmb@rmbgame.net>
#Maintainer: AigioL<https://github.com/AigioL>
pkgname=watt-toolkit-git
pkgdesc=一个开源跨平台的多功能Steam工具箱。
pkgver=3.0.0.r425.gde2faef6b
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://steampp.net/"
license=('GPL3')
depends=('libcap')
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
    )
sha256sums=('SKIP'
            'SKIP'
            'e8480ba1b19e8375c80e8ae776645ca3bb86e45731c4938e059d37a09227a60e'
            '495418217e895deed32c8166c5d85718b23676e52b91d1bb412d69d5f945b2e9'
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
_dotnet_version=7.0

prepare(){
    target_dirs=(
        "${srcdir}/SteamTools" "${srcdir}/SteamTools/ref/ArchiSteamFarm"
        "${srcdir}/SteamTools/ref/Avalonia.Image2" "${srcdir}/SteamTools/ref/Common"
        "${srcdir}/SteamTools/ref/SteamClient" "${srcdir}/SteamTools/ref/dotnet-packaging"
        "${srcdir}/SteamTools/ref/WTTS.MicroServices.ClientSDK" "${srcdir}/SteamTools/ref/WinAuth"
        "${srcdir}/SteamTools/ref/SteamClient/ref/ValveKeyValue"
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
    #git describe --tags --long | sed 's/v//;s/-/.r/;s/-/./g'
    # Workaround for no tag on v3.x branch
    echo "v3.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)" | sed 's/v//;s/-/.r/;s/-/./g'
}
build(){
    workloads=(
        android
        #ios
        #macos
        #maccatalyst
        #maui
        #wasm-tools
    )
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
    for workload in "${workloads[@]}"
    do
        dotnet workload install "${workload}"
    done
    dotnet workload restore
    dotnet publish src/BD.WTTS.Client.Avalonia.App/BD.WTTS.Client.Avalonia.App.csproj \
        -c "Release" --output "${srcdir}/SteamTools/linux-out" --framework net7.0
}
check(){
    cd "${srcdir}/SteamTools"
    export DOTNET_ROOT="${srcdir}/dotnet-sdk"
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/tools:$PATH

    dotnet test ./src/BD.WTTS.UnitTest/BD.WTTS.UnitTest.csproj \
        -c Release -p:GeneratePackageOnBuild=false --framework net7.0
}
package(){
    cd "${srcdir}/SteamTools"
    mkdir -p "${pkgdir}/usr/share/applications" "${pkgdir}/usr/share/icons/hicolor" "${pkgdir}/usr/bin" "${pkgdir}/opt"
    cp -av "${srcdir}/SteamTools/linux-out" "${pkgdir}/opt/watt-toolkit"
    for width in 16 24 32 48 64 96 128 256 512 1024
    do
        echo "Processing ${width}x${width} icon..."
        install -Dm644 \
            "./res/icons/app/v2/Logo_${width}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${width}x${width}/apps/watt-toolkit.png"
    done
    install -Dm644 "./res/icons/app/v2/Icon_Logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/watt-toolkit.svg"
    install -Dm644 "${srcdir}/watt-toolkit.desktop" "${pkgdir}/usr/share/applications/watt-toolkit.desktop"
    install -Dm644 "${srcdir}/set-cap.hook" "${pkgdir}/usr/share/libalpm/hooks/watt-toolkit-set-cap.hook"
    ln -sf /opt/watt-toolkit/Steam++ "${pkgdir}/usr/bin/watt-toolkit"
}
