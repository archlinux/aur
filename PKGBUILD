# Maintainer: taotieren <admin@taotieren.com>

pkgname=modbustools-git
pkgver=0.4.0.r3.gd5a3cbd
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
        -Wno-dev \
        -Bbuild \
        -GNinja

    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm644 src/server/gui/icons/server.ico "${pkgdir}/usr/share/pixmaps/${pkgname%-git}-server.ico"
    install -Dm644 src/client/gui/icons/client.ico "${pkgdir}/usr/share/pixmaps/${pkgname%-git}-client.ico"

    cd build
    install -Dm755 $(ls client-*) "${pkgdir}/usr/bin/${pkgname%-git}-client"
    install -Dm755 $(ls server-*) "${pkgdir}/usr/bin/${pkgname%-git}-server"

    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.serhmarch.${pkgname%-git}-client.desktop <<EOF
[Desktop Entry]
Name=${pkgname%-git}-client
Comment=${pkgdesc} -- client
Exec=${pkgname%-git}-client
Icon=${pkgname%-git}-client
Categories=Development;
Terminal=false
Type=Application
EOF
    install -Dm644 /dev/stdin ${pkgdir}/usr/share/applications/io.github.serhmarch.${pkgname%-git}-server.desktop <<EOF
[Desktop Entry]
Name=${pkgname%-git}-server
Comment=${pkgdesc} -- server
Exec=${pkgname%-git}-server
Icon=${pkgname%-git}-server
Categories=Development;
Terminal=false
Type=Application
EOF
    #
    #     export RUSTUP_TOOLCHAIN=stable
    #     cargo install --no-track --all-features --path ./vnt-cli --root "$pkgdir/usr/" --bins
    #
    #     install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/system/vnt-cli@.service" <<EOF
    # [Unit]
    # Description=VNT CLI Service for %i.
    # After = network.target syslog.target
    # Wants = network.target
    #
    # [Service]
    # Type=forking
    # User=%i
    # Restart=on-abort
    # ExecStart=/usr/bin/vnt-cli
    # ExecStop=/usr/bin/vnt-cli --stop
    #
    # [Install]
    # WantedBy=multi-user.target
    # EOF
    #
    #     install -Dm644 /dev/stdin "${pkgdir}/etc/sysctl.d/80-vnt.conf" <<EOF
    # net.ipv4.ip_forward = 1
    # EOF
    #
    #     install -Dm644 /dev/stdin "${pkgdir}/etc/vnt/iptables-vnt.rules" <<EOF
    # *nat
    # :POSTROUTING ACCEPT [0:0]
    # -A POSTROUTING ! -o vnt-tun -s 10.26.0.0/24 -j MASQUERADE
    # COMMIT
    # EOF
}
