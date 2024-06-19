_godot_repo=https://github.com/godotengine/godot/releases/download
_godot=4.2.2

pkgname=thrive
pkgver=0.6.7.1
pkgrel=1
pkgdesc="the evolution game Thrive."
arch=("x86_64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later" "LicenseRef-CCPL" "OFL-1.1")
depends=(
    "libxrender" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
    "libxext" "glibc" "libxcursor" "fontconfig"
)
makedepends=("git" "git-lfs" "dotnet-sdk-8.0" "p7zip" "cmake" "clang" "llvm" "lld" "godot-mono")
checkdepends=("dotnet-runtime-6.0")
source=(
    "git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
    "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
    "git+https://github.com/jrouwe/JoltPhysics.git"
    "git+https://github.com/cameron314/concurrentqueue.git"
    "$_godot.stable.mono.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_export_templates.tpz"
)
sha256sums=('21259ee2a6f30801f12656be82d597f5acb919ec3e2471b8f0dc1527abbfec21'
            'SKIP'
            'SKIP'
            'SKIP'
            '81a00143da2f8f89e2538843522202e2232be7e3de75fe45524daf919ab16a8b')


prepare(){
    declare _godot
    _godot="$(godot --version | cut -d . -f 1-3)"
    target_dirs=(
        "$srcdir/Thrive"
    )
    for dir in "${target_dirs[@]}"
    do
        cd $dir
        git submodule init
        grep submodule .gitmodules | sed 's/\[submodule "//;s/"\]//' | while read -r module
        do
            repo=$(basename $module)
            git config "submodule.$module.url" "$srcdir/$repo"
        done
        git -c protocol.file.allow=always submodule update
    done
    cd "$srcdir/Thrive"
    git lfs install --local
    git lfs fetch
    git lfs checkout
    sed -i "s/GODOT_VERSION = \".*\"/GODOT_VERSION = \"$_godot\"/" Scripts/GodotVersion.cs
    local templates="${XDG_DATA_HOME:-$HOME/.local/share}/godot/export_templates"
    mkdir -p "$templates"
    if [[ "$(< "$srcdir/templates/version.txt")" == "$_godot.stable.mono" ]]
    then
        echo "Using existing templates"
        cp -r "$srcdir/templates" "$templates/$_godot.stable.mono"
    else
        echo "Downloading templates using Thrive's tool"
        dotnet run --project Scripts -- godot-templates
    fi
}

build(){
    cd "$srcdir/Thrive"
    dotnet run --project Scripts -- native Build
    dotnet run --project Scripts -- native Build --disable-avx
    mkdir -p native_libs/distributable/linux
    ln -s ../../linux native_libs/distributable/linux/ThriveNative
    ln -s ../../linux native_libs/distributable/linux/EarlyCheck
    dotnet run --project Scripts -- package Linux --compress=false
}

check(){
    cd "$srcdir/Thrive"
    dotnet run --project Scripts -- test
}

package(){
    depends+=("hicolor-icon-theme" "lttng-ust2.12")
    cd "$srcdir/Thrive"
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/thrive"
    cp -a builds/Thrive_*_linux_x11 "$pkgdir/opt/thrive"
    ln -s /opt/thrive/Thrive "$pkgdir/usr/bin/Thrive"
    ln -s /opt/thrive/{ThriveAssetsLICENSE,GodotLicense,LICENSE}.txt "$pkgdir/usr/share/licenses/thrive/"
    ln -s /opt/thrive/lib/libthrive_native{,_without_avx}.so "$pkgdir/opt/thrive/data_Thrive_linuxbsd_$CARCH/"
    # /opt/thrive/Thrive.png is 1000x1000 and seems to be broken...
    install -Dm644 assets/misc/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/Thrive.png"
    install -Dm644 "$pkgdir/opt/thrive/Thrive.desktop" "$pkgdir/usr/share/applications/Thrive.desktop"
}
