_godot_repo=https://github.com/godotengine/godot/releases/download
_godot=4.2.2
_system_godot=false

pkgname=thrive
pkgver=0.7.0
pkgrel=2
pkgdesc="the evolution game Thrive."
arch=("x86_64" "aarch64")
url="https://revolutionarygamesstudio.com/"
license=("GPL-3.0-or-later AND LicenseRef-CCPL AND OFL-1.1")
depends=(
    "libxrender" "libxi" "libx11" "libglvnd" "libxinerama" "zlib" "libxrandr"
    "libxext" "glibc" "libxcursor" "fontconfig" "gcc-libs"
)
makedepends=("git" "git-lfs" "dotnet-sdk-8.0" "p7zip" "cmake" "clang" "lld" "ninja")
source=(
    "git+https://github.com/Revolutionary-Games/Thrive.git#tag=v$pkgver"
    "git+https://github.com/Revolutionary-Games/RevolutionaryGamesCommon.git"
    "git+https://github.com/jrouwe/JoltPhysics.git"
    "git+https://github.com/cameron314/concurrentqueue.git"
    "godot-mono-export-templates-$_godot.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_export_templates.tpz"
)
if "$_system_godot"
then
    makedepends+=("godot-mono=$_godot")
else
    # godot-mono's runtime dependencies
    makedepends+=(
        "brotli" "ca-certificates" "embree" "freetype2" "graphite" "harfbuzz" "harfbuzz-icu"
        "libspeechd" "libsquish" "libtheora" "libvorbis" "libwebp" "libwslay" "openxr"
        "miniupnpc" "pcre2" "libogg" "libpng" "zstd"
    )
    source_x86_64+=("godot-$_godot-x86_64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_x86_64.zip")
    source_aarch64+=("godot-$_godot-aarch64.zip::$_godot_repo/$_godot-stable/Godot_v$_godot-stable_mono_linux_arm64.zip")
fi

sha256sums=('daecbb2c5f3c4cc5fa56d79dc7c61eaf01e6f71de7e2478395c2939e45060fba'
            'SKIP'
            'SKIP'
            'SKIP'
            '81a00143da2f8f89e2538843522202e2232be7e3de75fe45524daf919ab16a8b')
sha256sums_x86_64=('4fe073fd99dbcdba4a8bea786b76b25a4dfee2efa6f2aa0d4f40f443d09de3f4')
sha256sums_aarch64=('32beab62973194f9da950d6800a7dd083b0f83547526338bcd0ba6210ee5fe68')

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
        export PATH="$PATH:$HOME/.local/bin"
    fi
}

build(){
    cd "$srcdir/Thrive"

    # -DNDEBUG is required with CMAKE_BUILD_TYPE=None
    # -fno-rtti is required because JoltPhysics is built with it
    # Building libthrive_native without this may results that
    # undefined symbol: _ZTIN3JPH20JobSystemWithBarrierE
    CFALGS+=" -DNDEBUG -fno-rtti"
    CXXFLAGS+=" -DNDEBUG -fno-rtti"

    echo "Building ThriveNative without AVX support..."
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
    cmake -B cmake-build.thrive_native.avx -G Ninja \
        -DCMAKE_INSTALL_PREFIX="$srcdir/Thrive/native_libs" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CXX_COMPILER_AR=llvm-ar \
        -DTHRIVE_AVX=ON
    cmake --build cmake-build.thrive_native.avx
    cmake --install cmake-build.thrive_native.avx

    echo "Running godot-mono to export game..."
    mkdir -p dist
    godot-mono --headless --export-release Linux/X11 dist/Thrive
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
