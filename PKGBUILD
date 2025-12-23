# Maintainer: Lotte V
# Contributor: Lotte V
pkgname=dataset-tools-git
pkgver=linux.v0.0.1.r0.g07d4f2e
pkgrel=1
pkgdesc="DiffSinger dataset processing tools, including audio processing, labeling."
arch=('x86_64')
url="https://github.com/openvpi/dataset-tools"
license=('Apache-2.0')
groups=('dataset-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-declarative'
    'libsndfile'
    'fftw'
    'onnxruntime'
    'ffmpeg5.1'
)
makedepends=(
    'git'
    'cmake'
    'ninja'
    'gcc'
    'python'
    'curl'
    'zip'
)
options=('!emptydirs')
source=(
    "dataset-tools::git+https://github.com/lottev1991/dataset-tools.git"
    "vcpkg::git+https://github.com/microsoft/vcpkg.git"
)
sha512sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/dataset-tools"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/vcpkg"
    [ ! -f "vcpkg" ] && ./bootstrap-vcpkg.sh

    local _target_root="$srcdir/dataset-tools/src/vcpkg_installed"

    ./vcpkg install \
        --x-manifest-root="$srcdir/dataset-tools/scripts/vcpkg-manifest" \
        --x-install-root="$_target_root" \
        --triplet="x64-linux"
    find "$_target_root" -name "build" -exec rm -rf {} +

    local _share="$_target_root/x64-linux/share"
    if [ -d "$_share/qbreakpad" ]; then
        cd "$_share"
        ln -sf qbreakpad qBreakpad
        cd qbreakpad
        ln -sf qBreakpadConfig.cmake QBreakpadConfig.cmake
        ln -sf qBreakpadConfig.cmake QBreakpad-config.cmake
        ln -sf qBreakpadTargets.cmake QBreakpadTargets.cmake
    fi

    if [ -d "$_share/fftw3" ]; then
        cd "$_share"
        cd fftw3
        ln -sf FFTW3Config.cmake fftw3Config.cmake
        ln -sf FFTW3Config.cmake fftw3-config.cmake
        ln -sf FFTW3Targets.cmake fftw3Targets.cmake
    fi

    echo "==> Wiping broken compiler flags globally..."
    find "$srcdir/dataset-tools" -type f -exec sed -i 's/-include cstring cstdint//g' {} +

    find "$srcdir/dataset-tools" -name "CMakeLists.txt" -exec sed -i \
        's|/usr/local/opt/fftw/include|/usr/include|g; s|/usr/local/opt/openblas/include|/usr/include|g' {} +
    
    echo "==> Patching hardcoded config paths..."
    
    find "$srcdir/dataset-tools/src/apps" -type f \( -name "*.cpp" -o -name "*.h" \) -exec sed -i \
        's|QApplication::applicationDirPath() + "/config"|QStandardPaths::writableLocation(QStandardPaths::AppConfigLocation)|g' {} +

    find "$srcdir/dataset-tools/src/apps" -type f -name "*.cpp" -exec sed -i \
        '1i #include <QStandardPaths>' {} +
}

build() {
    local _pkgsrc="$srcdir/dataset-tools"
    local _vcpkg_inst="$_pkgsrc/src/vcpkg_installed/x64-linux"

    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"

    export CXXFLAGS="$CXXFLAGS -include cstring -include cstdint"

    cd "$_pkgsrc/src/libs"
    cmake -Dep=cpu -P ../../scripts/setup-onnxruntime.cmake
    
    cd "$srcdir/build"
    cmake -S "$_pkgsrc" -B . -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_TOOLCHAIN_FILE="$srcdir/vcpkg/scripts/buildsystems/vcpkg.cmake" \
        -DVCPKG_TARGET_TRIPLET="x64-linux" \
        -DVCPKG_INSTALLED_DIR="$_pkgsrc/src/vcpkg_installed" \
        -DVCPKG_MANIFEST_MODE=OFF \
        -DCMAKE_POLICY_DEFAULT_CMP0144=NEW \
        -DqBreakpad_ROOT="$_vcpkg_inst/share/qbreakpad" \
        -Dfftw3_ROOT="$_vcpkg_inst/share/fftw3" \
        -DCMAKE_PREFIX_PATH="$_vcpkg_inst/share/qbreakpad;$_vcpkg_inst/share/fftw3;/usr/lib/cmake/Qt6/"

    cmake --build .
}

package() {
    cd "$srcdir/build"

    echo "==> Manually installing binaries..."
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/lib"

    cp "$srcdir/vcpkg/installed/x64-linux/lib"/* "$pkgdir/usr/lib/"

    cp "$srcdir/build/bin"/* "$pkgdir/usr/bin/"
    cp "$srcdir/build/lib"/* "$pkgdir/usr/lib/"

    local appIcons=(
        "AudioSlicer|AudioSlicer|Slice audio into segments"
        "MinLabel|MinLabel|Label dataset phonemes"
        "SlurCutter|SlurCutter|Edit fundamental frequency"
        "LyricFA|LyricFA|Convert lyrics to alignments"
        "SomeInfer|SomeInfer|Inference audio with SOME"
    )

    for appIcon in "${appIcons[@]}"; do
        IFS="|" read -r bin_name friendly_name description <<< "$appIcon"

        echo "[Desktop Entry]
Name=$friendly_name
Comment=$description
Exec=$bin_name
Icon=audio-x-generic
Terminal=false
Type=Application
Categories=AudioVideo;Audio;
GenericName=Dataset Tool" > "${bin_name}.desktop"

        install -Dm644 "${bin_name}.desktop" \
            "$pkgdir/usr/share/applications/${bin_name}.desktop"
        done
}