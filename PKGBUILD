# Maintainer: taotieren <admin@taotieren.com>

pkgname=canboat
pkgver=6.0.1
pkgrel=1
epoch=
pkgdesc="CAN Boat provides NMEA 2000 and NMEA 0183 utilities. It contains a NMEA 2000 PGN decoder and can read and write N2K messages. It is not meant as an end-user tool but as a discovery mechanism for delving into NMEA 2000 networks."
arch=($CARCH)
url="https://github.com/canboat/canboat"
license=('Apache-2.0')
groups=()
depends=(bash
    glibc
    perl
    php
    ksh)
makedepends=(
    #     help2man
    git
    libftdi
    libxml2
    libxslt
    python3
    python-pip)
checkdepends=()
optdepends=()
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('291c5c5fb71a72593ba170afd3f53ddc7401f822b3da66cbcdf27dcb740c5bf7')
#validpgpkeys=()

build() {
    #     export LDFLAGS="-z relro -z now -z shstk"
    cd "${srcdir}/${pkgname}-${pkgver}"

    make
    make generated
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make tests
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm0644 docs/* -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/60-canboat-actisense.rules" <<EOF
# Copy this file to /etc/udev/rules.d/
# If rules fail to reload automatically, you can refresh udev rules
# with the command "sudo udevadm control --reload"

ACTION!="add|change", GOTO="canboat_actisense_rules_end"

SUBSYSTEM=="gpio", MODE="0660", TAG+="uaccess"

SUBSYSTEM!="usb|tty|hidraw", GOTO="canboat_actisense_rules_end"

# Please keep this list sorted by VID:PID

# sudo echo 'ftdi_sio vendor=0x0403 product=0xd9aa' >>/etc/modules
ATTRS{idVendor}=="0403", ATTRS{idProduct}=="d9aa", MODE="660", TAG+="uaccess"

# SUBSYSTEM=="tty", ACTION=="add", ENV{ID_SERIAL}=="Actisense_NGT-1_1FD34", NAME="actisense" compatible adapters
ENV{ID_SERIAL}=="Actisense_NGT-1_1FD34", NAME="actisense", MODE="660", TAG+="uaccess"

LABEL="canboat_actisense_rules_end"

EOF
}
