# Maintainer: taotieren <admin@taotieren.com>

pkgbase=sigrok-bridge-bin
pkgname=sigrok-bridge-bin
_tagname=2026-04-23
pkgver=${_tagname//-/.}
pkgrel=1
pkgdesc="Sigrok bridge server exposing Sipeed SLogic logic analyzers to ngscopeclient over twinlan"
license=('LicenseRef-custom')
url="https://wiki.sipeed.com/hardware/zh/logic_analyzer/ngscopeclient/ngscopeclient.html"
arch=(x86_64)
options=(!strip !debug)
depends=(
    glibc
    libgcc
)
makedepends=()
optdepends=(
    "scopehal-apps: ngscopeclient and other client applications for libscopehal"
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
backup=()
install=${pkgname%-bin}.install
source=(
    "${pkgname%-bin}.service"
    "${pkgname%-bin}-analog.service"
    "${pkgname%-bin}.install"
    "${pkgname%-bin}.firewalld.xml"
    "${pkgname%-bin}.ufw.profile"
    "${pkgname%-bin}-${pkgver}::https://dl.sipeed.com/fileList/SLogic/ngscopeclient/sigrok-bridge"
)
sha256sums=('34c28e155ba95aa5bfd8b860fb96efb1278f1ecd47828f02022fc8c14c0fcf0d'
            '2da520518fdffa1ef90a9d050db64733fd5c5fae7e16fcf813f97be7a4d991a3'
            '1fd8b0a373cd2ae411b638a50d5f0a6a18f5c673509c4d1973a7d2b81f88d4e4'
            '942eef957c299252ea43d39b8eb45d7a8ff0bc09110764fb4761ff33a1f26598'
            'd8cc3c9e3db53a1595bd0c0483589bf78f85187a65247be7d5a7fb99eaf6d29b'
            '905589a3e68e7af20c4c808fed1a22795fd61780116cf3239c20a154fc9a489e')
noextract=()

package() {
    install -vDm755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -vDm644 ${srcdir}/*.service -t ${pkgdir}/usr/lib/systemd/system/

    # Optional firewall definitions. They stay inert until the admin opts in
    # ("firewall-cmd --add-service=sigrok-bridge" / "ufw allow sigrok-bridge")
    # and are only needed when the analyzer is attached to a remote host.
    install -vDm644 "${srcdir}/${pkgname%-bin}.firewalld.xml" \
        ${pkgdir}/usr/lib/firewalld/services/sigrok-bridge.xml
    install -vDm644 "${srcdir}/${pkgname%-bin}.ufw.profile" \
        ${pkgdir}/etc/ufw/applications.d/sigrok-bridge

    install -vDm644 /dev/stdin ${pkgdir}/usr/lib/udev/rules.d/60-sigrok-slogic.rules <<EOF
SUBSYSTEM!="usb|usb_device", GOTO="sipeed_rules_end"
ACTION!="add", GOTO="sipeed_rules_end"
ATTRS{idVendor}=="359f", MODE="0666", TAG+="uaccess"
ENV{ID_MM_DEVICE_IGNORE}="1"
LABEL="sipeed_rules_end"
EOF
}
