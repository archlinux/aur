_godot_repo=https://github.com/godotengine/godot/releases/download
# See Scripts/GodotVersion.cs
_godot=4.5
_system_godot=false

pkgname=thrive
pkgver=1.0.0
pkgrel=1
pkgdesc="the evolution game Thrive."
arch=("x86_64" "aarch64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later AND LicenseRef-CCPL AND OFL-1.1")
depends=("libxrender" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
         "libxext" "glibc" "libxcursor" "fontconfig" "gcc-libs")
makedepends=("git" "git-lfs" "dotnet-sdk-9.0" "cmake" "clang" "lld" "ninja" "jq" "python")
source=("git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
        "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
        "git+https://github.com/jrouwe/JoltPhysics.git"
        "git+https://github.com/cameron314/concurrentqueue.git"
        "git+https://github.com/godotengine/godot-cpp.git"
        "git+https://github.com/Revolutionary-Games/Arch.Extended.git"
        "git+https://github.com/Revolutionary-Games/Arch.git"
        "godot-mono-export-templates-$_godot.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_export_templates.tpz")
if "$_system_godot"
then
    makedepends+=("godot-mono=$_godot")
else
    source_x86_64+=("godot-$_godot-x86_64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_x86_64.zip")
    source_aarch64+=("godot-$_godot-aarch64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_arm64.zip")
fi

sha256sums=('a908d2339b1df2065da38487ce36ca939d2d298cd3f44c66daff3116bd990da9'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ad118205d8ae304bab84fa937590bd1b43a9567bb7f82be778678c891ce858bb')
sha256sums_x86_64=('54563c82bf3b6c1329e74862df1ee23f653e8a41355140434649bb6479158100')
sha256sums_aarch64=('cb4c86d9e92130db51ae1b98ef9c0ffc212ba4f9e5d4141370fdf59279cec8d1')

options=("!lto") # -flto=thin is added in CMakeLists.txt

case "$CARCH" in
    aarch64)
        _godot_arch=arm64
        ;;
    *)
        _godot_arch="$CARCH"
        ;;
esac

prepare(){
    target_dirs=("$srcdir/Thrive")
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
    local templates="${XDG_DATA_HOME:-$HOME/.local/share}/godot/export_templates"
    mkdir -p "$templates"
    cp -r "$srcdir/templates" "$templates/$_godot.stable.mono"
    mkdir -p "$HOME/.local/bin"
    if ! "$_system_godot"
    then
        ln -srfv "$srcdir/Godot_v$_godot-stable_mono_linux_$_godot_arch/Godot_v$_godot-stable_mono_linux.$_godot_arch" \
            "$HOME/.local/bin/godot"
    else
        ln -srfv /usr/bin/godot-mono "$HOME/.local/bin/godot"
    fi
    local _build_info_path="$srcdir/Thrive/simulation_parameters/revision.json"
    local _commit _branch _built_at _dev_build
    _commit=$(git rev-parse --verify HEAD)
    _branch=master
    _built_at="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%FT%T.%NZ)"
    _dev_build=false
    jq -n \
        --arg commit "$_commit" \
        --arg branch $_branch \
        --arg builtat "$_built_at" \
        --argjson devbuild $_dev_build \
       --raw-output \
        '{"Commit": $commit, "Branch": $branch, "BuiltAt": $builtat, "DevBuild": $devbuild}' | sed '1s/^/\xef\xbb\xbf/' | install -Dm644 /dev/stdin \
            "$_build_info_path"
    dotnet restore Thrive.csproj
}

build(){
    cd "$srcdir/Thrive"

    export PATH="$PATH:$HOME/.local/bin"
    local EXPORT_DIR=dist

    # Use --disable-avx if your PC is too old
    dotnet run --project Scripts -- native Build Install
    # This command requires Windows dll and non-avx native so
    #dotnet run --project Scripts -- package Linux --compress=false
    dotnet build Thrive.csproj
    mkdir -p $EXPORT_DIR
    godot --headless --export-release "Linux/X11" $EXPORT_DIR/Thrive
}

package(){
    depends+=("hicolor-icon-theme")
    cd "$srcdir/Thrive"
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    cp -a dist "$pkgdir/usr/lib/$pkgname"
    ln -srfv "$pkgdir/usr/lib/thrive/Thrive" "$pkgdir/usr/bin/Thrive"
    install -Dm644 LICENSE.txt doc/GodotLicense.txt doc/RuntimeLicenses.txt \
        -t  "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 assets/misc/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/Thrive.png"
    install -Dm644 assets/misc/Thrive.desktop "$pkgdir/usr/share/applications/Thrive.desktop"
    # Hack to fix permission
    find "$pkgdir/usr/lib/thrive" -type f -perm 666 -exec chmod 644 {} +
    # Hack to fix native lib searching
    install -Dm644 native_libs/linux/20/release/lib/libthrive_native.so -t "$pkgdir/usr/lib/thrive/data_Thrive_linuxbsd_$_godot_arch"
}
