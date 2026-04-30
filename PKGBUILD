# Maintainer: taotieren <admin@taotieren.com>

pkgbase=k230-burning-tool
pkgname=k230-burning-tool
pkgver=2.2.4
pkgrel=3
groups=()
pkgdesc="Kendryte K230 Flash Tool Cpp GUI version"
arch=($CARCH)
url="https://github.com/kendryte/k230_burning_tool"
license=('GPL-3.0-or-later AND LGPL-3.0-or-later AND MIT')
provides=(${pkgname} ${pkgname}-avalon)
conflicts=(${pkgname} ${pkgname}-avalon)
depends=(
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    libusb
    qt6-base
)
makedepends=(
    git
    cmake
    ninja
    qt6-tools
    qt6-svg
    openssl
    pkgconf
    sed
    vulkan-headers
)
checkdepends=(
    gtest
)
optdepends=()
source=(
    "${pkgname}::git+${url}.git#tag=v${pkgver}"
    "git+https://github.com/arsenm/sanitizers-cmake.git"
    "git+https://github.com/kendryte747/libusb-cmake.git"
    "git+https://github.com/libusb/libusb.git"
)
sha256sums=('2f5cabf2fdf5f7a8b20250455adb10e50e79bb77b1fe15e4fec76338069ba5e7'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    #     git submodule update --init --recursive
    git submodule init
    git config submodule.canaan-burn/3rdparty/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
    git config submodule.canaan-burn/3rdparty/libusb-cmake.url "$srcdir/libusb-cmake"
    git -c protocol.file.allow=always submodule update
    cd "${srcdir}/${pkgname}/canaan-burn/3rdparty/libusb-cmake"
    git submodule init
    git config submodule.libusb.url "$srcdir/libusb"
    git -c protocol.file.allow=always submodule update
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=calloc-transposed-args -Wno-error=discarded-qualifiers" \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build

    cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTARGET_AVALON_NANO3=ON \
    -DCMAKE_C_FLAGS="${CFLAGS} -Wno-error=calloc-transposed-args -Wno-error=discarded-qualifiers" \
    -B build_avalon \
    -G Ninja \
    -Wno-dev

    ninja -C build_avalon
}

package() {
    cd "${srcdir}/${pkgname}"
    # DESTDIR="${pkgdir}" ninja -C build install
    install -vDm0755 build/gui/K230BurningTool ${pkgdir}/usr/bin/${pkgname//-/}
    install -vDm0755 build_avalon/gui/K230BurningTool ${pkgdir}/usr/bin/${pkgname//-/}-avalon
    install -vDm0755 build/canaan-burn/libkburn.so -t ${pkgdir}/usr/lib/
    install -vDm0644 gui/resources/K230BurningTool.desktop ${pkgdir}/usr/share/applications/${pkgname//-/}.desktop
    sed -i -e 's|K230BurningTool|k230burningtool|g'\
        -e 's|=icon|=k230burningtool.png|g' \
        ${pkgdir}/usr/share/applications/${pkgname//-/}.desktop

    install -vDm0644 gui/resources/K230BurningTool.desktop ${pkgdir}/usr/share/applications/${pkgname//-/}-avalon.desktop
    sed -i -e 's|K230BurningTool|k230burningtool-avalon|g'\
        -e 's|=icon|=k230burningtool.png|g' \
        ${pkgdir}/usr/share/applications/${pkgname//-/}-avalon.desktop

    sed -i 's/^#include "\.\//#include "/g' canaan-burn/include/public/*.h

    install -vDm0644 gui/resources/icon.png ${pkgdir}/usr/share/icons/hicolor/256x256/${pkgname//-/}.png
    install -vDm0644 canaan-burn/include/public/*.h -t ${pkgdir}/usr/include/lib${pkgname//-/}/
    install -vDm0644 Licenses/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 "canaan-burn/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}/canaan-burn/"
    install -vDm0644 /dev/stdin "${pkgdir}/usr/lib/pkgconfig/lib${pkgname//-/}.pc" << EOF
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include/lib${pkgname//-/}

Name: lib${pkgname//-/}
Description: K230 Burning Tool library
Version: ${pkgver}
Libs: -L\${libdir} -lkburn
Cflags: -I\${includedir}
EOF

    install -vDm0644 /dev/stdin ${pkgdir}/usr/share/cmake/Modules/Findlib${pkgname//-/}.cmake <<EOF
find_path(lib${pkgname//-/}_INCLUDE_DIR
    NAMES canaan-burn.h
    PATHS /usr/include/lib${pkgname//-/}
)

find_library(lib${pkgname//-/}_LIBRARY
    NAMES kburn
    PATHS /usr/lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(lib${pkgname//-/} DEFAULT_MSG
    lib${pkgname//-/}_LIBRARY
    lib${pkgname//-/}_INCLUDE_DIR
)

if(lib${pkgname//-/}_FOUND)
    set(lib${pkgname//-/}_LIBRARIES \${lib${pkgname//-/}_LIBRARY})
    set(lib${pkgname//-/}_INCLUDE_DIRS \${lib${pkgname//-/}_INCLUDE_DIR})
endif()

mark_as_advanced(lib${pkgname//-/}_INCLUDE_DIR lib${pkgname//-/}_LIBRARY)
EOF
}
