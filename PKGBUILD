# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=0.1.r6679.g17b9736
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(GPL-3.0-only)
depends=(
    sh
    glibc
    gcc-libs
    sdl2
    qt6-base
    libwebp libwebp.so
    libjpeg-turbo libjpeg.so
    libpng libpng16.so
    libxrandr
    libx11
    freetype2 libfreetype.so
    zstd libzstd.so
    zlib libz.so
    dbus libdbus-1.so
    curl libcurl.so
    systemd-libs libudev.so
    hicolor-icon-theme
)
makedepends=(
    git
    cmake
    clang
    lld
    llvm
    extra-cmake-modules
    qt6-tools
    qt6-wayland
    libdrm
    libpulse
    libwebp
    alsa-lib
    sndio
    ninja
    jack
    python
)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
    'sndio: Small audio support'
    'alsa-lib: ALSA support'
    'jack: JACK support'
)
provides=('duckstation')
conflicts=('duckstation')
source=(
    git+"$url".git
    git+https://github.com/google/shaderc.git#tag=v2024.0
    git+https://github.com/KhronosGroup/glslang.git#commit=d73712b8f6c9047b09e99614e20d456d5ada2390
    git+https://github.com/KhronosGroup/SPIRV-Headers.git#commit=8b246ff75c6615ba4532fe4fde20f1be090c3764
    git+https://github.com/KhronosGroup/SPIRV-Tools.git#commit=04896c462d9f3f504c99a4698605b6524af813c1
    duckstation-qt.desktop
    duckstation-qt.sh)
sha256sums=(
    'SKIP'
    'c1f935c1e0338e274cea4f106fc3b13e02f4150e504a255ddb18221bd80bb416'
    '8c97fbe90abb311903b29d1fec8799e6e8a618ed2b69de6833dfed9252c85dad'
    'bbbdf1f65d11a5e6a1f03da5804e555af9c027e76f9dd22135a092f88b8a9b2b'
    '56bb21ba0a74b6a489398d5a6d429d7e38346ef67c21ee6df00395c990224701'
    'ec2d7358f81598390a8ceca2d1974be3e5f7c45602b550c89a1e9323ab45474b'
    '221a8fc0d1f0cebdf281acc26484e98ebbb59f876e12fdef3f03cf91380e31f5'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    echo "Building shaderc..."
    cd "$srcdir/shaderc"
    pushd third_party
        ln -sf ../../glslang ./
        ln -sf ../../SPIRV-Headers ./spirv-headers
        ln -sf ../../SPIRV-Tools ./spirv-tools
    popd
    git apply "$srcdir/$_pkgname/scripts/shaderc-changes.patch" \
      --exclude=CMakeLists.txt \
      --exclude=libshaderc/CMakeLists.txt \
      --exclude third_party/CMakeLists.txt

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_PREFIX_PATH="$srcdir/deps" \
        -DCMAKE_INSTALL_PREFIX="$srcdir/deps" \
        -DSHADERC_SKIP_TESTS=ON \
        -DSHADERC_SKIP_EXAMPLES=ON \
        -DSHADERC_SKIP_COPYRIGHT_CHECK=ON \
        -G Ninja
    cmake --build build --parallel
    cmake --install build

    echo "Building duckstation..."
    cd "$srcdir"

    # preparation for find shaderc as static
    sed -e 's|shaderc_shared|shaderc_combined|g' \
        -e 's|PUBLIC Shaderc|PRIVATE Shaderc|g' \
        -i duckstation/CMakeModules/FindShaderc.cmake \
        -i duckstation/src/util/CMakeLists.txt
    sed '/INTERFACE_COMPILE/d' -i duckstation/CMakeModules/FindShaderc.cmake

    cmake -B build -S duckstation \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_FLAGS="$CFLAGS -Wno-error=format-security" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=format-security" \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_PREFIX_PATH="$srcdir/deps" \
        -DCMAKE_SKIP_RPATH=ON \
        -DBUILD_NOGUI_FRONTEND=OFF \
        -DBUILD_QT_FRONTEND=ON \
        -G Ninja \
        -Wno-dev
    cmake --build build --parallel
}

package() {
    # Initially install everything into /usr/lib/duckstation
    install -m 755 -d "${pkgdir}/usr/lib"
    cp -drv --no-preserve='ownership' build/bin "${pkgdir}/usr/lib/${_pkgname}"

    # Move shared data to /usr/share/duckstation
    cd "${pkgdir}/usr/lib/${_pkgname}"
    install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
    for _dir in resources translations
    do
        mv "${_dir}" "${pkgdir}/usr/share/${_pkgname}"
        ln -s "/usr/share/${_pkgname}/${_dir}" .
    done

    # Install additional license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    mv "${pkgdir}/usr/share/${_pkgname}/resources/thirdparty.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/share/licenses/${pkgname}/thirdparty.html" "${pkgdir}/usr/share/${_pkgname}/resources/"

    install -Dvm755 "${srcdir}/duckstation-qt.sh" "${pkgdir}/usr/bin/duckstation-qt"
    install -Dvm644 "${srcdir}/duckstation-qt.desktop" "${pkgdir}/usr/share/applications/duckstation-qt.desktop"
    install -Dvm644 "${pkgdir}/usr/share/${_pkgname}/resources/images/duck.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}
