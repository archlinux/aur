# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kh-ucanfd
pkgname=(kh-ucanfd kh-ucanfd-dkms)
pkgver=1.5.0
pkgrel=3
epoch=
pkgdesc="KunHong UCANFD Linux driver"
arch=($CARCH)
url="https://gitee.com/ChengDu-KunHong/KH-UCANFD_Linux_SDK"
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=(
    sh
    python
)
makedepends=(
    libarchive
)
optdepends=(
    "can-utils: Linux-CAN / SocketCAN user space applications"
    "dm-tools: DM-USB2FDCAN (Damiao 达妙) host computer software supports DM-USB2FDCAN series CAN cards"
    "python-can: Controller Area Network support for Python"
    "openarm-can: A C++ library for CAN communication with OpenArm robotic hardware, supporting Damiao motors over CAN/CAN-FD interfaces."
    "python-openarm-can: Python bindings for the OpenArm CAN library, enabling easy integration and communication with OpenArm robotic hardware over CAN/CAN-FD interfaces."
)
backup=()
options=()
install=
_name=KH-UCANFD_Linux_SDK
source=(
    "${_name}-${pkgver}.zip::${url}/releases/download/${pkgver}/${_name}.zip"
)
sha256sums=('17be02f91b88ada249b19610421750620b290aa95e9e556462eb9295d1dca805')
noextract=()

build() {
    cd ${srcdir}/${_name}-${pkgver}
    sed -i -e 's|sudo ||g' \
        -e 's|$(INSTALL_DIR)|$(DESTDIR)$(INSTALL_DIR)|g' \
        -e 's|$(SCRIPT_DIR)|$(DESTDIR)$(SCRIPT_DIR)|g' \
        -e 's|-m|-Dm|g' KH-socket-can-test/Makefile

    make -C tools/fw_tool/ 
    make -C KH-socket-can-test/

    sed -i -e 's|usr/local/bin|usr/bin|g' \
        -e 's|etc/modprobe.d|usr/lib/modprobe.d|g' \
        -e 's|etc/udev|usr/lib/udev|g' \
        -e 's|sudo ||g' \
        driver/kcanosdiag.sh \
        driver/Makefile 
}

package_kh-ucanfd() {
    pkgdesc="KCAN-USB device firmware upgrade tool kit supports firmware version query, upgrade, APP switching and other functions."
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        sh
        python
    )
    arch=($CARCH)

    cd ${srcdir}/${_name}-${pkgver}

    make -C tools/fw_tool/ PREFIX="/usr" DESTDIR="$pkgdir" install
    make -C KH-socket-can-test INSTALL_DIR="/usr/bin" DESTDIR="$pkgdir" install
    install -Dm0755 tools/fw_tool/kcan_fw_upgrade.py -t ${pkgdir}/usr/bin/
    install -Dm644 tools/fw_tool/README.md -t ${pkgdir}/usr/share/doc/${pkgname}/
    install -Dm644 LICENSE* -t ${pkgdir}/usr/share/licenses/${pkgname}/
    rm -rf ${pkgdir}/build
}

package_kh-ucanfd-dkms() {
    pkgdesc="KunHong UCANFD Linux driver for dkms"
    provides=(${pkgname})
    conflicts=(${pkgname})
    depends=(
        sh
        dkms
    )
    arch=(any)
    options=('!strip' '!debug')

    cd ${srcdir}/${_name}-${pkgver}/driver

    local _src_dir="${pkgdir}/usr/src/${pkgname}-${pkgver}"

    install -Dm0755 kcanosdiag.sh -t ${pkgdir}/usr/bin/
    install -Dm0755 lskcan -t ${pkgdir}/usr/bin/
    install -Dm0755 kcan_make_devices -t ${pkgdir}/usr/bin/
    install -Dm0755 kcan_monitor -t ${pkgdir}/usr/bin/
    install -Dm0755 udev/kcan_usb_minor_check.bash -t ${pkgdir}/usr/bin/
    install -Dm0644 kcan.conf -t ${pkgdir}/usr/lib/modprobe.d/
    install -Dm0644 udev/45-kcan.rules -t ${pkgdir}/usr/lib/udev/rules.d/
    install -Dm0644 udev/blacklist-kunhong.conf -t ${pkgdir}/usr/lib/modprobe.d/

    install -Dm0644 Makefile -t "${_src_dir}/"
    install -Dm0644 *.h -t "${_src_dir}/"
    install -Dm0644 src/* -t "${_src_dir}/src"

    install -Dm644 /dev/stdin "${_src_dir}/dkms.conf" <<EOF
PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
MAKE[0]="make DKMS_KERNEL_DIR=\${kernel_source_dir} MOD=MODVERSIONS USB=USB_SUPPORT NET=NETDEV_SUPPORT RT=NO_RT COMPAT_SUPPORT=NO"
BUILT_MODULE_NAME[0]="kcan"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/updates"
AUTOINSTALL="yes"
EOF
    install -Dm644 /dev/stdin "${pkgdir}/etc/modules-load.d/${pkgname}.conf" <<EOF
kcan
EOF
    install -Dm644 "${srcdir}"/${_name}-${pkgver}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
