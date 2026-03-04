# Maintainer: taotieren <admin@taotieren.com>

pkgbase=kh-ucanfd
pkgname=(kh-ucanfd kh-ucanfd-dkms)
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="KunHong UCANFD Linux driver"
arch=($CARCH)
url="https://gitee.com/ChengDu-KunHong/KH-UCANFD_Linux_SDK"
license=("GPL-2.0-only AND LGPL-2.0-only")
depends=(
    sh
    dkms
    glibc
    popt
)
makedepends=(
    libarchive
)
optdepends=("can-utils: Linux-CAN / SocketCAN user space applications")
backup=()
options=()
install=
_name=KH-UCANFD_Linux_SDK
source=(
    "${_name}-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${_name}.zip"
)
sha256sums=('4b4b1064e0de5d872f30ee7561df780c531946a3b9c85211f34d04f8a3da23d6')
noextract=()

build() {
    cd ${srcdir}/${_name}-v${pkgver}
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
        glibc
    )
    arch=($CARCH)

    cd ${srcdir}/${_name}-v${pkgver}

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
        popt
    )
    arch=(any)

    cd ${srcdir}/${_name}-v${pkgver}/driver

    install -Dm0755 kcanosdiag.sh -t ${pkgdir}/usr/bin/
    install -Dm0755 lskcan -t ${pkgdir}/usr/bin/
    install -Dm0755 kcan_make_devices -t ${pkgdir}/usr/bin/
    install -Dm0755 kcan_monitor -t ${pkgdir}/usr/bin/
    install -Dm0644 *.h -t ${pkgdir}/usr/src/${pkgname}-${pkgver}/src
    install -Dm0644 kcan.conf -t ${pkgdir}/usr/lib/modprobe.d/
    install -Dm0755 udev/kcan_usb_minor_check.bash -t ${pkgdir}/usr/bin/
    install -Dm0644 udev/45-kcan.rules -t ${pkgdir}/usr/lib/udev/rules.d/ 
    install -Dm0644 udev/blacklist-kunhong.conf -t ${pkgdir}/usr/lib/modprobe.d/
    install -Dm0644 src/* -t ${pkgdir}/usr/src/${pkgname}-${pkgver}/src

    install -Dm644 /dev/stdin "${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile" <<EOF
DESTDIR =
MODDIR  = \$(DESTDIR)/lib/modules
KVERS   = \$(shell uname -r)
KVER    = \$(KVERS)
VMODDIR = \$(MODDIR)/\$(KVER)
KSRC    ?= \$(VMODDIR)/build

obj-m := kcan.o
kcan-objs := src/kcan_main.o src/kcan_fops.o src/kcan_fifo.o src/kcan_filter.o
kcan-objs += src/kcan_parse.o src/kcan_sja1000.o src/kcan_common.o src/kcan_timing.o
kcan-objs += src/kcanfd_core.o src/kcanfd_ucan.o
kcan-objs += src/kcan_usb_core.o src/kcan_usb.o src/kcan_usbpro.o src/kcanfd_usb.o
kcan-objs += src/kcan_netdev.o

ccflags-y += -I\$(src) -I\$(src)/src -DNO_DEBUG -DMODVERSIONS -DUSB_SUPPORT -DNETDEV_SUPPORT -DNO_RT -Wno-date-time

all: kcan

check_kernel_dir:
	@if [ ! -d \$(KSRC) ]; then \
		echo "Unable to find the Linux source tree."; \
		exit 1; \
	fi

kcan: check_kernel_dir clean
	\$(MAKE) -C \$(KSRC) M=\$(CURDIR) modules

clean: check_kernel_dir
	\$(MAKE) -C \$(KSRC) M=\$(CURDIR) clean
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf" <<EOF
PACKAGE_NAME="${pkgname}"
PACKAGE_VERSION="${pkgver}"
BUILT_MODULE_NAME[0]="kcan"
BUILT_MODULE_LOCATION[0]="."
DEST_MODULE_LOCATION[0]="/updates"
AUTOINSTALL="yes"
EOF

    install -Dm644 "${srcdir}"/${_name}-v${pkgver}/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
