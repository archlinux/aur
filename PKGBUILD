# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=0.1.r7271.g5b590d4
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(GPL-3.0-only Apache-2.0)
depends=(
    sh
    glibc
    gcc-libs
    "sdl2>=2.30.6"
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
    jq
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
    shaderc::git+https://github.com/stenzek/shaderc.git
    spirv-cross::git+https://github.com/KhronosGroup/SPIRV-Cross.git
    libbacktrace::git+https://github.com/ianlancetaylor/libbacktrace.git
    cpuinfo::git+https://github.com/stenzek/cpuinfo.git
    discord-rpc::git+https://github.com/stenzek/discord-rpc.git
    soundtouch::git+https://github.com/stenzek/soundtouch.git
    duckstation-qt.desktop
    duckstation-qt.sh)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'ec2d7358f81598390a8ceca2d1974be3e5f7c45602b550c89a1e9323ab45474b'
            '221a8fc0d1f0cebdf281acc26484e98ebbb59f876e12fdef3f03cf91380e31f5')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # checkout correct versions of deps
    jq -cr '.modules[] | select(type == "string")' "$srcdir/duckstation/scripts/flatpak/org.duckstation.DuckStation.json" \
      | while read -r dep ; do
            local dep_name=$(jq -cr ".name" "$srcdir/duckstation/scripts/flatpak/$dep")
            for src in "${source[@]}"; do
                local src_name=${src%%::*}
                if [ "$src_name" = "$dep_name" ]; then
                    local dep_ver=$(jq -cr ".sources[0].tag // .sources[0].commit" "$srcdir/duckstation/scripts/flatpak/$dep")
                    echo "Checking out $dep_ver for $dep_name..."
                    git -C "$srcdir/$dep_name" checkout -q "$dep_ver"
                fi
            done
        done
}

build() {
    # Build deps with cmake
    jq -cr '.modules[] | select(type == "string")' "$srcdir/duckstation/scripts/flatpak/org.duckstation.DuckStation.json" \
      | while read -r dep ; do
            local dep_name=$(jq -cr 'select(.buildsystem == "cmake-ninja").name' "$srcdir/duckstation/scripts/flatpak/$dep")
            if [ -n "$dep_name" ]; then
                for src in "${source[@]}"; do
                    local src_name=${src%%::*}
                    if [ "$src_name" = "$dep_name" ]; then
                        echo "Building $dep_name..."
                        cmake -B "build-$dep_name" -S "$dep_name" \
                            -G Ninja \
                            -DCMAKE_C_COMPILER=clang \
                            -DCMAKE_CXX_COMPILER=clang++ \
                            -DCMAKE_EXE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
                            -DCMAKE_MODULE_LINKER_FLAGS_INIT="-fuse-ld=lld" \
                            -DCMAKE_SHARED_LINKER_FLAGS_INIT="-fuse-ld=lld" \
                            -DCMAKE_INSTALL_PREFIX=/usr \
                            $(jq -cr '."config-opts" | join(" ")' "$srcdir/duckstation/scripts/flatpak/$dep")
                        ninja -C "build-$dep_name"
                        DESTDIR="$srcdir/deps" ninja -C "build-$dep_name" install
                    fi
                done
            fi
      done

    echo "Building libbacktrace..."

    pushd libbacktrace
    autoreconf -fi
    CFLAGS="$CFLAGS -ffat-lto-objects" ./configure --prefix="$srcdir/deps/usr"
    make
    make install
    popd

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
    # Install bundled libraries
    find "${srcdir}/deps/usr/lib" -name '*.so*' -exec cp -dv --no-preserve='ownership' '{}' "${pkgdir}/usr/lib/${_pkgname}/" \;

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

    # Install additional license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    mv "${pkgdir}/usr/share/${_pkgname}/resources/thirdparty.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/share/licenses/${pkgname}/thirdparty.html" "${pkgdir}/usr/share/${_pkgname}/resources/"

    install -Dvm755 "${srcdir}/duckstation-qt.sh" "${pkgdir}/usr/bin/duckstation-qt"
    install -Dvm644 "${srcdir}/duckstation-qt.desktop" "${pkgdir}/usr/share/applications/duckstation-qt.desktop"
    install -Dvm644 "${pkgdir}/usr/share/${_pkgname}/resources/images/duck.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}

