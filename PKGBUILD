# Maintainer: taotieren <admin@taotieren.com>

pkgname=mcuviewer-git
pkgver=1.1.0.r0.g3650ed7
pkgrel=1
pkgdesc="Real-time embedded variable & trace viewer"
arch=($CARCH)
url="https://github.com/klonyyy/MCUViewer"
license=('GPL-3.0-only')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    sh
    gcc-libs
    glfw
    glib2
    glibc
    gtk3
    libglvnd
    libusb
    #     jlink-software-and-documentation
    #     stlink
)
makedepends=(
    cmake
    git
    ninja
    spdlog
    pkgconf
    python
)
optdepends=(
    'jlink-software-and-documentation: Segger JLink software & documentation pack for Linux'
    'stlink: Open source STM32 MCU programming toolset'
)
backup=()
options=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}/"

    sed -e 's|/usr/local/MCUViewer|/usr/share/MCUViewer|g' \
        -e 's|/usr/local/lib|/usr/lib|g' \
        -i \
        CMakeLists.txt \
        launch/install/Unix/MCUViewer.desktop \
        launch/install/Unix/MCUViewer.conf

    sed -e 's|plugdev|uucp|g' \
        -i \
        launch/install/Unix/udevrules/49-stlinkv1.rules \
        launch/install/Unix/udevrules/49-stlinkv2-1.rules \
        launch/install/Unix/udevrules/49-stlinkv2.rules \
        launch/install/Unix/udevrules/49-stlinkv3.rules

    cmake -S . \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -Wno-dev \
        -Bbuild \
        -GNinja

    ninja -C build
}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/$pkgname/build install

    install -Dm755 /dev/stdin "${pkgdir}"/usr/bin/mcuviewer <<EOF
#!/usr/bin/env bash

cd /usr/share/MCUViewer/
./MCUViewer "\$@"
EOF
    #     rm -rf "${pkgdir}"/usr/lib/libjlinkarm.so*
    #     ln -sf /opt/SEGGER/JLink/libjlinkarm.so.8 "${pkgdir}"/usr/lib/libjlinkarm.so
}
