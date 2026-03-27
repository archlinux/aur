# Maintainer: taotieren <admin@taotieren.com>

pkgname=modbustools-git
pkgver=0.5.0.r1.g4d0a740
pkgrel=1
pkgdesc="ModbusTools are cross-platform Modbus simulator tools with GUI to work with Modbus protocol (TCP,RTU,ASCII)"
arch=($CARCH)
url="https://github.com/serhmarch/ModbusTools"
license=(GPL-3.0-only)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    gcc-libs
    glibc
    qt5-base
    qt5-tools
)
makedepends=(
    cmake
    ninja
    git
)
optdepends=()
backup=()
options=()
install=
source=(
    "${pkgname}::git+${url}.git"
    "modbus::git+https://github.com/serhmarch/ModbusLib.git"
)
sha256sums=('SKIP'
    'SKIP')

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

    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.modbus.url "$srcdir/modbus"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}/"

    cmake -S . \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=OFF \
        -Wdeprecated-declarations \
        -Wno-dev \
        -Bbuild \
        -GNinja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 src/server/gui/icons/mbserver.ico "${pkgdir}/usr/share/pixmaps/mbserver.ico"
    install -Dm644 src/client/gui/icons/mbclient.ico "${pkgdir}/usr/share/pixmaps/mbclient.ico"

    cd build
    install -dm755 "${pkgdir}/usr/lib/"
    cp -rv libmbcore.so* "${pkgdir}/usr/lib/"

    install -Dm755 $(ls mbclient-*) "${pkgdir}/usr/bin/mbclient"
    install -Dm755 $(ls mbserver-*) "${pkgdir}/usr/bin/mbserver"

    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.serhmarch.mbclient.desktop <<EOF
[Desktop Entry]
Name=mbclient
Comment=${pkgdesc} -- client
Exec=mbclient
Icon=mbclient
Categories=Development;
Terminal=false
Type=Application
EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.serhmarch.mbserver.desktop <<EOF
[Desktop Entry]
Name=mbserver
Comment=${pkgdesc} -- server
Exec=mbserver
Icon=mbserver
Categories=Development;
Terminal=false
Type=Application
EOF

}
