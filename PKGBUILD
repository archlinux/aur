# Maintainer: taotieren <admin@taotieren.com>

pkgname=canboat
pkgver=8.1.0
pkgrel=1
epoch=
pkgdesc="CAN Boat provides NMEA 2000 and NMEA 0183 utilities. It contains a NMEA 2000 PGN decoder and can read and write N2K messages. It is not meant as an end-user tool but as a discovery mechanism for delving into NMEA 2000 networks."
arch=($CARCH)
url="https://github.com/canboat/canboat"
license=('Apache-2.0')
groups=()
depends=(
    sh
    libgcc
    perl
    php
    ksh
)
makedepends=(
    #     help2man
    git
    rust
    libftdi
    libxml2
    libxslt
    python3
    python-pip
)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
noextract=()
sha256sums=('cbc2248f325b2149555f4f6f7902dc74a74abefcce159965dc0f323e33bc2f35')
#validpgpkeys=()

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    #     export LDFLAGS="-z relro -z now -z shstk"
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    make
    # make generated
    make rust
}

# check() {
#     cd "${srcdir}/${pkgname}"
#     make tests
# }

package() {
    cd "${srcdir}/${pkgname}"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm0644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/60-canboat-actisense.rules" <<EOF
# Copy this file to /etc/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "sudo udevadm control --reload"

ACTION!="add|change", GOTO="canboat_actisense_rules_end"

SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="canboat_actisense_rules_end"

# Please keep this list sorted by VID:PID

# sudo echo 'ftdi_sio vendor=0x0403 product=0xd9aa' >>/etc/modules
ATTRS{idVendor}=="0403", ATTRS{idProduct}=="d9aa", TAG+="uaccess"

# SUBSYSTEM=="tty", ACTION=="add", ENV{ID_SERIAL}=="Actisense_NGT-1_1FD34", NAME="actisense" compatible adapters
ENV{ID_SERIAL}=="Actisense_NGT-1_1FD34", NAME="actisense", TAG+="uaccess"

LABEL="canboat_actisense_rules_end"

EOF
}
