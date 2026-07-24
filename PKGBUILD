# Maintainer: Pavel Dobiáš <git at paveldobias dot eu>

pkgname=floating-sandbox
pkgver=1.20.0
pkgrel=4
pkgdesc="Mass-spring network in C++, simulating physical bodies floating in water and sinking"
arch=('x86_64')
url="https://github.com/GabrieleGiuseppini/Floating-Sandbox"
license=('CC-BY-4.0')

install=$pkgname.install

depends=(
    'gtk3'
    'libx11'
    'openal'
    'libvorbis'
    'libsm'
    'flac'
    'libpng'
    'libnotify'
    'libjpeg-turbo'
)

makedepends=(
    'cmake'
    'git'
    'make'
    'gcc'
)

source=(
    "floating-sandbox.sh"
    "floating-sandbox.desktop"
    "custom-ships-dir.patch"
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "git+https://github.com/wxWidgets/wxWidgets.git#tag=v3.1.4"
    "git+https://github.com/google/googletest.git#tag=v1.12.0"
    "git+https://github.com/kazuho/picojson.git#tag=v1.3.0"
    "git+https://github.com/SFML/SFML.git#tag=2.6.2"
)

sha256sums=(
    'aa3800b629de788d5df30777d41a16ce3f46b218c8252086722dfa849a43a597'
    '15cc756fd0abb38d62058744422e60fce08d02377f34394d814ec72f08c8fbcb'
    '7f2d22ac951fd72fd6dbfd5ffad94abf32db82e4e4d907dbd1af7380ac06a657'
    '5b8085c469c373854ab281d7c9b19eb7b30fac4aad5592aa6d3a5b2f21750889'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    mkdir -p "${srcdir}/libs"

    cd "${srcdir}/wxWidgets"
    git submodule update --init --recursive

    cd "${srcdir}/Floating-Sandbox-${pkgver}"
    # Patches support for custom ships directory using env var
    patch -Np1 -i "${srcdir}/custom-ships-dir.patch"

    # Create custom UserSettings.cmake to setup correct build environment
    cat <<EOF >UserSettings.cmake
set(FS_USE_STATIC_LIBS ON)

set(SDK_ROOT "${srcdir}/libs")
set(REPOS_ROOT "${srcdir}")

set(BENCHMARK_ROOT_DIR "\${SDK_ROOT}/benchmark")
set(wxWidgets_ROOT "\${SDK_ROOT}/wxWidgets")
set(wxWidgets_CONFIG_EXECUTABLE "\${SDK_ROOT}/wxWidgets/bin/wx-config")
set(SFML_ROOT "\${SDK_ROOT}/sfml")
set(SFML_STATIC_LIBRARIES ON)
set(GTEST_DIR "\${REPOS_ROOT}/googletest")
set(PICOJSON_DIR "\${REPOS_ROOT}/picojson")

# Fix SFML 2.6 static target naming issue for OpenAL
find_package(OpenAL REQUIRED)
if(TARGET OpenAL::OpenAL AND NOT TARGET OpenAL)
    add_library(OpenAL UNKNOWN IMPORTED)
    if(OPENAL_LIBRARY)
        set_target_properties(OpenAL PROPERTIES IMPORTED_LOCATION "\${OPENAL_LIBRARY}")
    endif()
    if(OPENAL_INCLUDE_DIR)
        set_target_properties(OpenAL PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "\${OPENAL_INCLUDE_DIR}")
    endif()
endif()

# Define macro that creates post-install actions
macro(DefineUserPostInstall)
endmacro()
EOF
}

build() {
    export LC_ALL=C.UTF-8

    export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=."
    export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=."

    msg2 "Building static wxWidgets..."
    cd "${srcdir}/wxWidgets"
    mkdir -p wx_build
    cd wx_build
    ../configure \
        --disable-shared \
        --with-gtk=3 \
        --with-libpng \
        --with-libxpm \
        --with-libjpeg \
        --without-libtiff \
        --without-expat \
        --disable-pnm \
        --disable-gif \
        --disable-pcx \
        --disable-iff \
        --with-opengl \
        --prefix="${srcdir}/libs/wxWidgets" \
        --exec_prefix="${srcdir}/libs/wxWidgets" \
        --disable-tests \
        --disable-rpath

    make install -j$(nproc)

    msg2 "Building static SFML..."
    cmake -B "${srcdir}/libs/sfml" -S "${srcdir}/SFML" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=OFF \
        -DSFML_BUILD_EXAMPLES=OFF \
        -DSFML_BUILD_DOC=OFF
    cmake --build "${srcdir}/libs/sfml" -j$(nproc)

    msg2 "Building Floating Sandbox..."
    cd "${srcdir}/Floating-Sandbox-${pkgver}"

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DFS_BUILD_BENCHMARKS=OFF \
        -DFS_USE_STATIC_LIBS=ON \
        -DSFML_ROOT="${srcdir}/libs/sfml" \
        -DSFML_DIR="${srcdir}/libs/sfml" \
        -DSFML_STATIC_LIBRARIES=ON \
        -DwxWidgets_USE_DEBUG=OFF \
        -DwxWidgets_USE_UNICODE=ON \
        -DFS_INSTALL_DIRECTORY="${pkgdir}/opt/floating-sandbox"

    cmake --build build -j$(nproc)
}

package() {
    # Directories
    install -dm755 "${pkgdir}/opt"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"
    install -dm755 "${pkgdir}/usr/share/pixmaps"

    # Install the game
    cd "${srcdir}/Floating-Sandbox-${pkgver}"
    cmake --install build

    # Prevents a crash when loading ships from these directories
    chmod 1777 "${pkgdir}/opt/floating-sandbox/Ships"
    chmod 1777 "${pkgdir}/opt/floating-sandbox/Data/Built-in Ships"

    # Symlink regional English variants to 'en' only if they don't already exist, prevents language default to be broken
    local lang_dir="${pkgdir}/opt/floating-sandbox/Data/Languages"
    if [ -d "${lang_dir}/en" ]; then
        for lang in en_GB en_US en_AU en_CA; do
            if [ ! -e "${lang_dir}/${lang}" ]; then
                ln -s "en" "${lang_dir}/${lang}"
            fi
        done
    fi

    # Launcher script
    install -m755 "$srcdir/floating-sandbox.sh" \
        "$pkgdir/usr/bin/floating-sandbox"

    # Desktop integration
    install -m644 "${srcdir}/floating-sandbox.desktop" \
        "${pkgdir}/usr/share/applications/floating-sandbox.desktop"

    install -m644 "${pkgdir}/opt/floating-sandbox/Data/Built-in Ships/fs_logo_texture.png.dat" \
        "${pkgdir}/usr/share/pixmaps/floating-sandbox.png"
}
