_godot_repo=https://github.com/godotengine/godot/releases/download
# See Scripts/GodotVersion.cs
_godot=4.7.2
_system_godot=${MAKEPKG_THRIVE_SYSTEM_GODOT:-false}

pkgname=thrive
pkgver=1.6.0
pkgrel=1
pkgdesc="the evolution game Thrive."
arch=("x86_64" "aarch64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later AND LicenseRef-CCPL AND OFL-1.1")
depends=("libgcc" "libstdc++" "glibc")
makedepends=("git" "git-lfs" "dotnet-sdk-10.0" "cmake" "clang" "lld" "ninja" "jq" "python")
source=("git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
        "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
        "git+https://github.com/jrouwe/JoltPhysics.git"
        "git+https://github.com/cameron314/concurrentqueue.git"
        "git+https://github.com/godotengine/godot-cpp.git"
        "git+https://github.com/Revolutionary-Games/Arch.Extended.git"
        "git+https://github.com/Revolutionary-Games/Arch.git")
sha256sums=('4da333d20999f835ce5853a41d795ffabfae3091002e070aca3f104d9d65161b'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

if "$_system_godot"
then
    depends+=("brotli" "libpng" "miniupnpc" "libogg" "graphite" "pcre2" "openxr" "libtheora" "libwebp" "libvorbis"
              "embree" "freetype2" "zlib" "zstd")
    makedepends+=("godot-mono" "godot-mono-export-templates-linux")
else
    source_x86_64+=("godot-$_godot-x86_64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_x86_64.zip")
    sha256sums_x86_64+=('129f82db7bafd54ae14bb5bb284041c73860e8c7a009a3a026ca5e946cbff247')
    source_aarch64+=("godot-$_godot-aarch64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_arm64.zip")
    sha256sums_aarch64+=('0dc8ad63feacc6c19d7cb5c89ae828085b0ac3fa8039bc816a08a0537744e523')
    source+=("godot-mono-export-templates-$_godot.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_export_templates.tpz")
    sha256sums+=('92f8681e349ef1f90891b792da95e3b2b0bd1ed610b78018c58feb2d87e15a9d')
    noextract+=("godot-mono-export-templates-$_godot.zip")
fi

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
    mkdir -p "$templates" "$HOME/.local/bin"
    if ! "$_system_godot"
    then
        ln -srfv "$srcdir/Godot_v$_godot-stable_mono_linux_$_godot_arch/Godot_v$_godot-stable_mono_linux.$_godot_arch" \
            "$HOME/.local/bin/godot"
        mkdir -p "$templates/$_godot.stable.mono"
        bsdtar -x -C "$templates/$_godot.stable.mono" -f "$srcdir/godot-mono-export-templates-$_godot.zip" --strip-components 1 "templates/*"
    else
        ln -srfv /usr/bin/godot-mono "$HOME/.local/bin/godot"
        local installed_godot
        installed_godot="$(LANG=C pacman -Qi godot-mono | grep Version | cut -d : -f 2 | cut -d - -f 1 | xargs)"
        if [[ "$installed_godot" != "$_godot" ]]
        then
            echo "Installed godot does not match requirements in source. Needs $_godot, but $installed_godot installed."
            echo "Applying simple substitution to continue anyway..."
            sed -i "s/$_godot/$installed_godot/g" \
                Scripts/GodotVersion.cs \
                Thrive.csproj
        fi
        cp -r "/usr/share/godot/export_templates/$installed_godot.stable.mono" "$templates"
        echo "$installed_godot.stable.mono" > "$templates/$installed_godot.stable.mono/version.txt"
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
    # Hack to fix native lib searching
    local libbasename
    for file in native_libs/linux/*/release/lib/libthrive_*.so*
    do
        libbasename="$(basename "$file")"
        if [[ ! -e "$pkgdir/usr/lib/thrive/lib/$libbasename" ]]
        then
            install -Dvm755 "$file" "$pkgdir/usr/lib/thrive/lib/$libbasename"
        fi
    done
    # Hack to fix permission
    find "$pkgdir/usr/lib/thrive" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/lib/thrive" -type f -name "*.so*" -exec chmod 755 {} +
    find "$pkgdir/usr/lib/thrive" -type l -exec chmod 777 {} +
    find "$pkgdir/usr/lib/thrive" -type d -exec chmod 755 {} +
    chmod 755 "$pkgdir/usr/lib/thrive/Thrive"
}
