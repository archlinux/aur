# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=0.1.r7059.g487eb10
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(GPL-3.0-only Apache-2.0)
depends=(
    sh
    glibc
    gcc-libs
    sdl2
    qt6-base
    libwebp.so
    libjpeg.so
    libpng16.so
    libxrandr
    libx11
    freetype2 libfreetype.so
    libzstd.so
    libz.so
    libdbus-1.so
    libcurl.so
    systemd-libs libudev.so
    hicolor-icon-theme
    glslang
    spirv-tools
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
    alsa-lib
    sndio
    ninja
    jack
    python
    spirv-headers
    patchelf
)
optdepends=(
    'qt6-wayland: Wayland support'
    'libpulse: Pulseaudio support'
    'sndio: Small audio support'
    'alsa-lib: ALSA support'
    'jack: JACK support'
)
provides=(duckstation)
conflicts=(duckstation)
source=(
    git+"$url".git
    git+https://github.com/google/shaderc.git#tag=v2024.1
    git+https://github.com/KhronosGroup/SPIRV-Cross.git#tag=vulkan-sdk-1.3.283.0
    git+https://github.com/ianlancetaylor/libbacktrace.git#commit=ad106d5fdd5d960bd33fae1c48a351af567fd075
    git+https://github.com/pytorch/cpuinfo.git#commit=05332fd802d9109a2a151ec32154b107c1e5caf9
    git+https://github.com/stenzek/discord-rpc#commit=842c15192041f8e71c512851834f4dadb1a554fb
    duckstation-qt.desktop
    duckstation-qt.sh)
sha256sums=('SKIP'
            'f1dbf3270fc21bf6871ae8693ddfb467ce142009d3371fd407512b956c25ace0'
            '9c2a148a1e4c7ca16ab54991980ed6393c1c21794081083f2779d880b3dbf1d4'
            '6463c6d54b99dddaa0f3da7a84926eb543672a4414dc2835bf35bb9eada9339f'
            '0e192b397f79a0f0567d32350cbe4f1b68177d7500222985167ae456465c77da'
            'f3851102c4986695acd2049b6111c52998e736abe075a680fb1bdc6f84c31cf4'
            'ec2d7358f81598390a8ceca2d1974be3e5f7c45602b550c89a1e9323ab45474b'
            '221a8fc0d1f0cebdf281acc26484e98ebbb59f876e12fdef3f03cf91380e31f5')

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/shaderc"
    # apply duckstation patch
    git apply "$srcdir/$_pkgname/scripts/deps/shaderc-changes.patch"

    # de-vendor libs and disable git versioning
    sed '/examples/d;/third_party/d' -i CMakeLists.txt
    sed '/build-version/d' -i glslc/CMakeLists.txt
    cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
    cd "$srcdir/SPIRV-Cross"
    # apply duckstation patch
    git apply "$srcdir/$_pkgname/scripts/deps/spirv-cross-changes.patch"

    cd "$srcdir/cpuinfo"
    git apply "$srcdir/$_pkgname/scripts/deps/cpuinfo-changes.patch"
}

build() {
    echo "Building discord-rpc..."

    cmake -B build-discord-rpc -S discord-rpc \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    ninja -C build-discord-rpc
    DESTDIR="$srcdir/deps" ninja -C build-discord-rpc install

    echo "Building cpuinfo..."

    cmake -B build-cpuinfo -S cpuinfo \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCPUINFO_LIBRARY_TYPE=shared \
        -DCPUINFO_RUNTIME_TYPE=shared \
        -DCPUINFO_LOG_LEVEL=error \
        -DCPUINFO_LOG_TO_STDIO=ON \
        -DCPUINFO_BUILD_TOOLS=OFF \
        -DCPUINFO_BUILD_UNIT_TESTS=OFF \
        -DCPUINFO_BUILD_MOCK_TESTS=OFF \
        -DCPUINFO_BUILD_BENCHMARKS=OFF \
        -DUSE_SYSTEM_LIBS=ON
    ninja -C build-cpuinfo
    DESTDIR="$srcdir/deps" ninja -C build-cpuinfo install

    echo "Building libbacktrace..."

    pushd libbacktrace
    autoreconf -fi
    CFLAGS="$CFLAGS -ffat-lto-objects" ./configure --prefix="$srcdir/deps/usr"
    make
    make install
    popd

    echo "Building shaderc..."

    cmake -B build-shaderc -S shaderc \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSHADERC_SKIP_TESTS=ON \
        -DSHADERC_SKIP_EXAMPLES=ON \
        -DSHADERC_SKIP_COPYRIGHT_CHECK=ON \
        -Dglslang_SOURCE_DIR=/usr/include/glslang
    ninja -C build-shaderc
    DESTDIR="$srcdir/deps" ninja -C build-shaderc install

    echo "Building SPIRV-Cross..."

    cmake -B build-SPIRV-Cross -S SPIRV-Cross \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSPIRV_CROSS_SHARED=ON \
        -DSPIRV_CROSS_STATIC=OFF \
        -DSPIRV_CROSS_CLI=OFF \
        -DSPIRV_CROSS_ENABLE_TESTS=OFF \
        -DSPIRV_CROSS_ENABLE_GLSL=ON \
        -DSPIRV_CROSS_ENABLE_HLSL=OFF \
        -DSPIRV_CROSS_ENABLE_MSL=OFF \
        -DSPIRV_CROSS_ENABLE_CPP=OFF \
        -DSPIRV_CROSS_ENABLE_REFLECT=OFF \
        -DSPIRV_CROSS_ENABLE_C_API=ON \
        -DSPIRV_CROSS_ENABLE_UTIL=ON
    ninja -C build-SPIRV-Cross
    DESTDIR="$srcdir/deps" ninja -C build-SPIRV-Cross install

    echo "Building duckstation..."

    cmake -B build -S duckstation \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_C_COMPILER=clang \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_C_FLAGS="$CFLAGS -Wno-error=format-security" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=format-security" \
        -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
        -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON \
        -DCMAKE_PREFIX_PATH="$srcdir/deps/usr" \
        -DCMAKE_BUILD_RPATH=/usr/lib/duckstation \
        -DCMAKE_SKIP_RPATH=ON \
        -DBUILD_NOGUI_FRONTEND=OFF \
        -DBUILD_QT_FRONTEND=ON \
        -Wno-dev
    ninja -C build
}

package() {
    # Initially install everything into /usr/lib/duckstation
    install -m 755 -d "${pkgdir}/usr/lib"
    cp -drv --no-preserve='ownership' build/bin "${pkgdir}/usr/lib/${_pkgname}"

    # rpath
    patchelf --force-rpath --set-rpath "/usr/lib/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/$_pkgname-qt"

    # Move shared data to /usr/share/duckstation
    cd "${pkgdir}/usr/lib/${_pkgname}"
    install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
    for _dir in resources translations
    do
        mv "${_dir}" "${pkgdir}/usr/share/${_pkgname}"
        ln -s "/usr/share/${_pkgname}/${_dir}" .
    done

    # Install bundled shaderc
    install -vm755 \
        "${srcdir}/deps/usr/lib/libshaderc_shared.so" \
        "${srcdir}/deps/usr/lib/libspirv-cross-c-shared.so" \
        "${srcdir}/deps/usr/lib/libcpuinfo.so" \
        "${srcdir}/deps/usr/lib/libdiscord-rpc.so" \
        "${pkgdir}/usr/lib/${_pkgname}"

    # Install additional license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    mv "${pkgdir}/usr/share/${_pkgname}/resources/thirdparty.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/share/licenses/${pkgname}/thirdparty.html" "${pkgdir}/usr/share/${_pkgname}/resources/"

    install -Dvm755 "${srcdir}/duckstation-qt.sh" "${pkgdir}/usr/bin/duckstation-qt"
    install -Dvm644 "${srcdir}/duckstation-qt.desktop" "${pkgdir}/usr/share/applications/duckstation-qt.desktop"
    install -Dvm644 "${pkgdir}/usr/share/${_pkgname}/resources/images/duck.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}

