# Maintainer: taotieren <admin@taotieren.com>

pkgname=modbustools-git
pkgver=0.5.0.r1.g4d0a740
pkgrel=3
pkgdesc="ModbusTools are cross-platform Modbus simulator tools with GUI to work with Modbus protocol (TCP,RTU,ASCII)"
arch=($CARCH)
url="https://github.com/serhmarch/ModbusTools"
license=(GPL-3.0-only)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=(
    glibc
    libgcc
    libstdc++
    qt5-base
    qt5-tools
    python
    python-pyqt5
)
makedepends=(
    cmake
    ninja
    git
    doxygen
    graphviz
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
        -DCMAKE_INSTALL_PREFIX=dist \
        -DBUILD_SHARED_LIBS=OFF \
        -Wdeprecated-declarations \
        -Wno-dev \
        -Bbuild \
        -GNinja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm0644 src/server/gui/icons/mbserver.ico -t "${pkgdir}/usr/share/pixmaps/"
    install -vDm0644 src/client/gui/icons/mbclient.ico -t "${pkgdir}/usr/share/pixmaps/"
    install -vDm0755 src/server/python/*.py -t "${pkgdir}/usr/bin/"
    
    install -vdm644 ${pkgdir}/usr/share/doc/${pkgname}/client \
                    ${pkgdir}/usr/share/doc/${pkgname}/server
    cd build
    cp -R doc/output/client/* ${pkgdir}/usr/share/doc/${pkgname}/client/
    cp -R doc/output/server/* -t ${pkgdir}/usr/share/doc/${pkgname}/server/
    install -vDm0644 libmbcore.* -t "${pkgdir}/usr/lib"
    install -vDm0644 libmodbus.* -t "${pkgdir}/usr/lib"
    install -vDm0755 $(ls mbclient-*) "${pkgdir}/usr/bin/mbclient"
    install -vDm0755 $(ls mbserver-*) "${pkgdir}/usr/bin/mbserver"

    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.serhmarch.mbclient.desktop <<EOF
[Desktop Entry]
Name=mbclient
Comment=${pkgdesc} -- client
Exec=mbclient
Icon=mbclient
Categories=Development;
Terminal=false
Type=Application
EOF
    install -Dm0644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.serhmarch.mbserver.desktop <<EOF
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
