# Contributor: katt <magunasu.b97@gmail.com>

pkgname=duckstation-git
_pkgname=duckstation
pkgver=0.1.r6886.g015804c
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
    glslang
    spirv-tools
    libbacktrace libbacktrace.so
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
    duckstation-qt.desktop
    duckstation-qt.sh)
sha256sums=('SKIP'
            'f1dbf3270fc21bf6871ae8693ddfb467ce142009d3371fd407512b956c25ace0'
            'ec2d7358f81598390a8ceca2d1974be3e5f7c45602b550c89a1e9323ab45474b'
            '4e1c4ff072f0bf7df589b5c7160b0a4add5de326abd7570a2d1a4657f09e47a6')

pkgver() {
    cd "$srcdir/$_pkgname"
    git checkout f0c2832d031640f9e833ac0589b47b54dabbdf0d
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/shaderc"
    # apply duckstation patch
    git apply "$srcdir/$_pkgname/scripts/shaderc-changes.patch"

    # de-vendor libs and disable git versioning
    sed '/examples/d;/third_party/d' -i CMakeLists.txt
    sed '/build-version/d' -i glslc/CMakeLists.txt
    cat <<- EOF > glslc/src/build-version.inc
"${pkgver}\\n"
"$(pacman -Q spirv-tools|cut -d \  -f 2|sed 's/-.*//')\\n"
"$(pacman -Q glslang|cut -d \  -f 2|sed 's/-.*//')\\n"
EOF
}

build() {
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

    # Move shared data to /usr/share/duckstation
    cd "${pkgdir}/usr/lib/${_pkgname}"
    install -m 755 -d "${pkgdir}/usr/share/${_pkgname}"
    for _dir in resources translations
    do
        mv "${_dir}" "${pkgdir}/usr/share/${_pkgname}"
        ln -s "/usr/share/${_pkgname}/${_dir}" .
    done

    # Install bundled shaderc
    install -vm644 "${srcdir}/deps/usr/lib/libshaderc_shared.so.1" "${pkgdir}/usr/lib/${_pkgname}"

    # Install additional license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}/"
    mv "${pkgdir}/usr/share/${_pkgname}/resources/thirdparty.html" "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/usr/share/licenses/${pkgname}/thirdparty.html" "${pkgdir}/usr/share/${_pkgname}/resources/"

    install -Dvm755 "${srcdir}/duckstation-qt.sh" "${pkgdir}/usr/bin/duckstation-qt"
    install -Dvm644 "${srcdir}/duckstation-qt.desktop" "${pkgdir}/usr/share/applications/duckstation-qt.desktop"
    install -Dvm644 "${pkgdir}/usr/share/${_pkgname}/resources/images/duck.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/duckstation-qt.png"
}
