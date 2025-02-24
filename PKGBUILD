_godot_repo=https://github.com/godotengine/godot/releases/download
_godot=4.3
_system_godot=true

pkgname=thrive
pkgver=0.8.1.1
pkgrel=1
pkgdesc="the evolution game Thrive."
arch=("x86_64" "aarch64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later AND LicenseRef-CCPL AND OFL-1.1")
depends=(
    "libxrender" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
    "libxext" "glibc" "libxcursor" "fontconfig" "gcc-libs"
)
makedepends=("git" "git-lfs" "dotnet-sdk-9.0" "cmake" "clang" "lld" "ninja" "jq" "python")
source=(
    "git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
    "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
    "git+https://github.com/jrouwe/JoltPhysics.git"
    "git+https://github.com/cameron314/concurrentqueue.git"
    "git+https://github.com/godotengine/godot-cpp.git"
    "godot-mono-export-templates-$_godot.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_export_templates.tpz"
)
if "$_system_godot"
then
    makedepends+=("godot-mono=$_godot")
else
    source_x86_64+=("godot-$_godot-x86_64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_x86_64.zip")
    source_aarch64+=("godot-$_godot-aarch64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_arm64.zip")
fi

sha256sums=('af01ae8c54b44d8225b8624475894e12e2c653721095ff4bb69f877a75ff94f7'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'a640d97e4247883b58d394c6111c13343112f3c49bb857d95586f98659fa3be5')

options=("!lto") # -flto=thin is added in CMakeLists.txt

prepare(){
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
    local templates="${XDG_DATA_HOME:-$HOME/.local/share}/godot/export_templates"
    mkdir -p "$templates"
    cp -r "$srcdir/templates" "$templates/$_godot.stable.mono"
    local _godot_arch
    case "$CARCH" in
        aarch64)
            _godot_arch=arm64
            ;;
        *)
            _godot_arch="$CARCH"
            ;;
    esac
    if ! "$_system_godot"
    then
        mkdir -p "$HOME/.local/bin"
        ln -srfv "$srcdir/Godot_v$_godot-stable_mono_linux_$_godot_arch/Godot_v$_godot-stable_mono_linux.$_godot_arch" \
            "$HOME/.local/bin/godot-mono"
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
}

build(){
    cd "$srcdir/Thrive"

    if ! "$_system_godot" && ! command -v godot-mono > /dev/null
    then
        export PATH="$PATH:$HOME/.local/bin"
    fi

    # gdUnit4 Requires this
    export GODOT_BIN=/usr/bin/godot-mono

    local cmake_build_type thrive_avx
    for thrive_avx in OFF ON
    do
        for cmake_build_type in Debug None
        do
            (
                if [[ "$cmake_build_type" == "None" ]]
                then
                    # -DNDEBUG is required with CMAKE_BUILD_TYPE=None
                    CFALGS+=" -DNDEBUG"
                    CXXFLAGS+=" -DNDEBUG"
                else
                    CFLAGS+=" -Wp,-U_FORTIFY_SOURCE"
                    CXXFLAGS+=" -Wp,-U_FORTIFY_SOURCE"
                fi
                mkdir -p thrive_native/avx_$thrive_avx/$cmake_build_type/api
                pushd thrive_native/avx_$thrive_avx/$cmake_build_type/api
                echo "Generating GDExtension contents..."
                godot-mono --headless --dump-extension-api --dump-gdextension-interface
                popd
                echo "Building ThriveNative with THRIVE_AVX=$thrive_avx and CMAKE_BUILD_TYPE=$cmake_build_type..."
                cmake -B thrive_native/avx_$thrive_avx/$cmake_build_type -G Ninja \
                    -DCMAKE_INSTALL_PREFIX="$srcdir/Thrive/native_libs" \
                    -DCMAKE_BUILD_TYPE=$cmake_build_type \
                    -DCMAKE_C_COMPILER=clang \
                    -DCMAKE_CXX_COMPILER=clang++ \
                    -DCMAKE_CXX_COMPILER_AR=llvm-ar \
                    -DTHRIVE_AVX=$thrive_avx
                cmake --build thrive_native/avx_$thrive_avx/$cmake_build_type
                cmake --install thrive_native/avx_$thrive_avx/$cmake_build_type
            )
        done
    done

    echo "Copying built native libraries..."
    cp -r native_libs/release/lib/. lib
    mkdir -p lib/debug
    cp -r native_libs/debug/lib/. lib/debug

    echo "Building C# project..."
    # /Scripts/PackageTool.cs
    dotnet build Thrive.csproj
    
    echo "Running godot-mono to export game..."
    mkdir -p dist
    # /Scripts/GodotProjectCompiler.cs
    #mv assets .skip-import-assets
    #godot-mono --headless --build-solutions --quit-after 2
    #mv .skip-import-assets assets
    # /Scripts/PackageTool.cs
    godot-mono --headless --export-release "Linux/X11" dist/Thrive
}

check(){
    cd "$srcdir/Thrive"
    dotnet test
}

package(){
    depends+=("hicolor-icon-theme")
    local _godot_arch
    case "$CARCH" in
        aarch64)
            _godot_arch=arm64
            ;;
        *)
            _godot_arch="$CARCH"
            ;;
    esac
    cd "$srcdir/Thrive"
    mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/bin"
    cp -a dist "$pkgdir/usr/lib/$pkgname"
    ln -srfv "$pkgdir/usr/lib/thrive/Thrive" "$pkgdir/usr/bin/Thrive"
    install -Dm644 LICENSE.txt doc/GodotLicense.txt doc/RuntimeLicenses.txt \
        -t  "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 native_libs/release/lib/lib*.so \
        -t "$pkgdir/usr/lib/thrive/data_Thrive_linuxbsd_$_godot_arch"
    install -Dm644 assets/misc/icon.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/Thrive.png"
    install -Dm644 assets/misc/Thrive.desktop "$pkgdir/usr/share/applications/Thrive.desktop"
    # Hack to fix permission
    find "$pkgdir/usr/lib/thrive" -type f -perm 666 -exec chmod 644 {} +
}
