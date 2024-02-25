_godot=3.5.3 # We need a newer godot version than aur/godot-headless
_godot_template=$_godot # Set to empty to download them through Scripts project
# Note: please let those variables be set to same version if $_godot_template is not empty.
_godot_repo=https://github.com/godotengine/godot/releases/download

pkgname=thrive
pkgver=0.6.5
pkgrel=1
pkgdesc="the evolution game Thrive."
arch=("x86_64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later" "License-Ref-CCPL" "OFL-1.1")
depends=(
    "libxrender" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
    "libxext" "glibc" "libxcursor"
)
makedepends=("git" "git-lfs" "dotnet-sdk-8.0" "p7zip" "cmake" "clang" "llvm" "lld")
source=(
    "git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
    "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
    "git+https://github.com/jrouwe/JoltPhysics.git"
    "git+https://github.com/cameron314/concurrentqueue.git"
    "godot-$_godot.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_headless_64.zip"
    "$_godot_template.stable.mono.zip::$_godot_repo/$_godot_template-stable/Godot_v$_godot_template-stable_mono_export_templates.tpz"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    '9602657c95a6fb0d8411ac6603aca4dd1bb1700373b06e6358c01c63eb2cca51'
    '5984f7452187a00b3f606c7790d7470784663442a0ba9f73b0a9a2c84ef4d541')


prepare(){
    git lfs install
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
    git lfs pull
    sed -i "s/\"3.5\"/\"$_godot\"/" Scripts/GodotVersion.cs
    rm -rf "$srcdir/godot-$_godot"
    mv "$srcdir/Godot_v$_godot-stable_mono_linux_headless_64" "$srcdir/godot-$_godot"
    mv "$srcdir/godot-$_godot/Godot_v$_godot-stable_mono_linux_headless.64" "$srcdir/godot-$_godot/godot"
    export PATH="$srcdir/godot-$_godot:$PATH"
    mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates"
    cp -r "$srcdir/templates" "${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates/$_godot_template.stable.mono"
    install -Dm644 podman/ci/editor_settings-3.tres "${XDG_CACHE_HOME:-$HOME/.config}/godot/editor_settings-3.tres"
}

build(){
    cd "$srcdir/Thrive"
    export PATH="$srcdir/godot-$_godot:$PATH"
    dotnet run --project Scripts -- native Build Install
    mkdir -p native_libs/distributable/linux
    ln -s ../../linux native_libs/distributable/linux/ThriveNative
    ln -s ../../linux native_libs/distributable/linux/EarlyCheck
    dotnet run --project Scripts -- package Linux --compress=false
}

check(){
    cd "$srcdir/Thrive"
    export PATH="$srcdir/godot-$_godot:$PATH"
    dotnet run --project Scripts -- test
}

package(){
    depends+=("hicolor-icon-theme")
    cd "$srcdir/Thrive"
    mkdir -p "$pkgdir/opt" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/thrive"
    cp -a builds/Thrive_*_linux_x11 "$pkgdir/opt/thrive"
    # This is actually very annoying to portable apps...
    mkdir -p "$pkgdir/usr/lib"
    ln -s ../../opt/thrive/.mono/assemblies/Release/libthrive_native.so \
        "$pkgdir/usr/lib/libthrive_native.so"
    ln -s ../../opt/thrive/.mono/assemblies/Release/libearly_checks.so \
        "$pkgdir/usr/lib/libearly_checks.so"
    ln -s /opt/thrive/Thrive "$pkgdir/usr/bin/Thrive"
    ln -s /opt/thrive/ThriveAssetsLICENSE.txt "$pkgdir/usr/share/licenses/thrive/ThriveAssetsLICENSE.txt"
    ln -s /opt/thrive/GodotLicense.txt "$pkgdir/usr/share/licenses/thrive/GodotLicense.txt"
    ln -s /opt/thrive/LICENSE.txt "$pkgdir/usr/share/licenses/thrive/LICENSE.txt"
    # /opt/thrive/Thrive.png is 1000x1000 and seems to be broken...
    install -Dm644 assets/misc/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/Thrive.png"
    install -Dm644 "$pkgdir/opt/thrive/Thrive.desktop" "$pkgdir/usr/share/applications/Thrive.desktop"
}
