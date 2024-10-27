_godot_repo=https://github.com/godotengine/godot/releases/download
_godot=4.3
_system_godot=true

pkgname=thrive
pkgver=0.7.1
pkgrel=1
pkgdesc="the evolution game Thrive."
arch=("x86_64" "aarch64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later AND LicenseRef-CCPL AND OFL-1.1")
depends=(
    "libxrender" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
    "libxext" "glibc" "libxcursor" "fontconfig" "gcc-libs"
)
makedepends=("git" "git-lfs" "dotnet-sdk-8.0" "cmake" "clang" "lld" "ninja" "jq")
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

sha256sums=('35817b933489968b15f236bcfd50ff43c7df7ec5e2c622221f84ad35533f246f'
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

    # -DNDEBUG is required with CMAKE_BUILD_TYPE=None
    # -fno-rtti is required because JoltPhysics is built with it
    # Building libthrive_native without this may results that
    # undefined symbol: _ZTIN3JPH20JobSystemWithBarrierE
    CFALGS+=" -DNDEBUG"
    CXXFLAGS+=" -DNDEBUG"

    if ! "$_system_godot" && ! command -v godot-mono > /dev/null
    then
        export PATH="$PATH:$HOME/.local/bin"
    fi

    echo "Generating godot GDExtension contents..."
    mkdir gdextension
    cd gdextension
    godot-mono --headless --dump-extension-api --dump-gdextension-interface
    cd ..
    
    echo "Building ThriveNative without AVX support..."
    mkdir cmake-build.thrive_native
    ln -sfv ../gdextension cmake-build.thrive_native/api
    cmake -B cmake-build.thrive_native -G Ninja \
        -DCMAKE_INSTALL_PREFIX="$srcdir/Thrive/native_libs" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CXX_COMPILER_AR=llvm-ar \
        -DTHRIVE_AVX=OFF
    cmake --build cmake-build.thrive_native
    cmake --install cmake-build.thrive_native

    echo "Building ThriveNative with AVX support..."
    mkdir cmake-build.thrive_native.avx
    ln -sfv ../gdextension cmake-build.thrive_native.avx/api
    cmake -B cmake-build.thrive_native.avx -G Ninja \
        -DCMAKE_INSTALL_PREFIX="$srcdir/Thrive/native_libs" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CXX_COMPILER_AR=llvm-ar \
        -DTHRIVE_AVX=ON
    cmake --build cmake-build.thrive_native.avx
    cmake --install cmake-build.thrive_native.avx

    echo "Copying built native libraries..."
    cp -r native_libs/release/lib/. lib
    
    echo "Running godot-mono to export game..."
    mkdir -p dist
    godot-mono --headless --build-solutions --quit-after 2
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
    find "$pkgdir/usr/lib/thrive" -type f -perm 666 -exec chmod 644 {} \;
}
