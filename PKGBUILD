# Maintainer: taotieren <admin@taotieren.com>

pkgbase=x-tools
pkgname=x-tools
pkgver=7.1.0
pkgrel=1
groups=()
pkgdesc="Qt SerialPort-BLE-UDP-TCP-WebSocket-Modbus-CAN Assistant."
arch=($CARCH)
url="https://github.com/x-tools-author/x-tools"
license=('LGPL-3.0-or-later')
provides=(${pkgname} xtools)
conflicts=(${pkgname} xtools)
depends=(
    bash
    gcc-libs
    glibc
    hicolor-icon-theme
    libiconv
    libunwind
    qt6-charts
    qt6-connectivity
    qt6-base
    qt6-serialbus
    qt6-serialport
    qt6-websockets
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
    qt6-svg
    qt6-tools
    pkgconf
)
checkdepends=(
    gtest
)
optdepends=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7f11a188d8dba6497ee8fad4cac42abb1636bd9e241f52f38c9a91be622c6f6b')

build() {
    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS}"
    export LDFLAGS+=" ${LDFLAGS}"

    cd "${srcdir}/${pkgname}-${pkgver}"

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -B build \
        -G Ninja \
        -Wno-dev

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/bin/Linux/None/xTools"
    install -Dm0755 xTools -t "${pkgdir}/usr/share/${pkgname}/"
    cp -r 3rd_styles "${pkgdir}/usr/share/${pkgname}/"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENCE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/xTools.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.x-tools-author.x-tools.svg"
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
