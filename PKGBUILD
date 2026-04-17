# Maintainer: taotieren <admin@taotieren.com>

pkgbase=x-tools
pkgname=x-tools
pkgver=7.7.1
pkgrel=1
groups=()
pkgdesc="Qt SerialPort-BLE-UDP-TCP-WebSocket-Modbus-CAN Assistant."
arch=($CARCH)
url="https://github.com/x-tools-author/x-tools"
license=('LGPL-3.0-or-later')
provides=(${pkgname} xtools)
conflicts=(${pkgname} xtools)
_qt=qt6
depends=(
    bash
    glibc
    hicolor-icon-theme
    libgcc
    libstdc++
    $_qt-charts
    $_qt-connectivity
    $_qt-base
    $_qt-declarative
    $_qt-serialbus
    $_qt-serialport
    $_qt-websockets
    systemd-libs
    #     google-glog
    #     libusb
    #     hidapi
    #     qmdnsengine
    #     qrencode
    #     qt6-networkauth
    #     qt6-mqtt
    #     qxlsx
)
makedepends=(
    git
    cmake
    ninja
    libiconv
    libunwind
    vulkan-headers
    $_qt-svg
    $_qt-tools
    pkgconf
)
checkdepends=(
    gtest
)
optdepends=()
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('3f4afe1a302423b6e6b100c2a0ed308a6a5f5fbc61edc312c108fa28f03ece88')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/bin/"*/Linux/None/xTools
    install -Dm0755 xTools -t "${pkgdir}/usr/share/${pkgname}/"
    cp -r translations "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 "${srcdir}/${pkgname}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm644 "${srcdir}/${pkgname}/xTools.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.x-tools-author.x-tools.svg"
    #     install -Dm644 "${srcdir}/${pkgname}-${pkgver}/xTools.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/io.github.x-tools-author.x-tools.png"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/env bash

exec /usr/share/x-tools/xTools "\$@"

EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.x-tools-author.x-tools.desktop <<EOF
[Desktop Entry]
Name=${pkgname}
Comment=${pkgdesc}
Exec=${pkgname}
Icon=io.github.x-tools-author.x-tools
Categories=Development;
Terminal=false
Type=Application
EOF
    #     DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}-${pkgver}/build install
}
