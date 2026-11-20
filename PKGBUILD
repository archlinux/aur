# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch34xpar-git
pkgname=(ch34xpar-git ch34xpar-dkms-git libch34xpar-git)
pkgver=r15.2ccc018
pkgrel=1
pkgdesc="This driver and application support the USB bus interface chips from WCH (Qinheng Microelectronics): CH341, CH346, CH347, CH339, CH9341, CH9346, as well as the WCH USB-to-serial series chips."
arch=($CARCH)
url="https://github.com/WCHSoftGroup/ch341par_linux"
license=('GPL-2.0-or-later')
makedepends=('git')
optdepends=(
    "ch34x-mphsi-master: CH341A/B/C/F/H/T | CH347F/T | CH339W Linux USB to SPI/I2C/GPIO Controller Driver"
    "ch343ser-dkms: USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc"
)
source=(
    "${pkgbase}::git+${url}.git"
)
sha256sums=('SKIP')
options=(!strip !debug)

pkgver() {
    cd "${srcdir}/${pkgbase}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
    #cd "${srcdir}/${pkgbase}"
    #git apply -p1 <${srcdir}/49.patch
}

package_ch34xpar-git() {
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        ch34xpar-dkms-git
        libch34xpar-git
    )
}

package_ch34xpar-dkms-git() {
    pkgdesc+=" (DKMS)"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    depends=(dkms)
    optdepends=(
        'linux-headers: build the module against Arch kernel'
        'linux-lts-headers: build the module against LTS Arch kernel'
        'linux-zen-headers: build the module against Zen kernel'
    )
    arch=('any')
    cd "$srcdir/${pkgbase}/driver"
    install -dm755 "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"
    install -vDm644 ch34x_pis* -t "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"

    install -vDm0644 /dev/stdin "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/Makefile" <<EOF
obj-m := ch34x_pis.o

KVER ?= \$(shell uname -r)
KDIR ?= /lib/modules/\$(KVER)/build
VERSION ?= \$(shell cat VERSION)
SRC_DIR=\$(shell pwd)

default:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) modules

install:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) modules_install

unload:
	/sbin/rmmod ch34x_pis

load: unload
	/sbin/insmod ch34x_pis.ko

dkms.conf: dkms.conf.in
	sed "s/@@VERSION@@/\$(VERSION)/" \$^ > \$@

dkms-add: dkms.conf
	/usr/sbin/dkms add \$(SRC_DIR)

dkms-build: dkms.conf
	/usr/sbin/dkms build ch34x_pis/\$(VERSION)

dkms-install: dkms.conf
	/usr/sbin/dkms install ch34x_pis/\$(VERSION)

dkms-remove: dkms.conf
	/usr/sbin/dkms remove ch34x_pis/\$(VERSION) --all

modprobe-install:
	modprobe ch34x_pis

modprobe-remove:
	modprobe -r ch34x_pis

dev: modprobe-remove dkms-remove dkms-add dkms-builddkms-install modprobe-install
EOF

    install -vDm0644 /dev/stdin "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/dkms.conf" <<EOF
PACKAGE_NAME="ch34xpar"
PACKAGE_VERSION="#MODULE_VERSION#"
AUTOINSTALL="yes"

MAKE[0]="make KVER=\$kernelver"

BUILT_MODULE_NAME[0]="ch34x_pis"
DEST_MODULE_LOCATION[0]="/updates"
EOF
    # autoload
    install -vDm644 /dev/stdin "${pkgdir}/etc/modules-load.d/ch34x_pis.conf" <<EOF
ch34x_pis
EOF
    # sed 's|GROUP="plugdev"|TAG+="uaccess"|g' \
    #     "${srcdir}/${pkgbase}/udev/99-ch34x_pis.rules" \
    #     | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-ch34x.rules"
    # Blacklists conflicting module
    #     install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf" <<EOF
    # blacklist cdc_acm
    # EOF
}

package_libch34xpar-git() {
    pkgdesc+=" (dynamic lib)"
    provides=("${pkgname%-git}")
    conflicts=("${pkgname%-git}")
    depends=(glibc)
    arch=($CARCH)

    case "$CARCH" in
        x86_64)  _libdir=x64 ;;
        aarch64) _libdir=aarch64 ;;
        *) echo "Unsupported arch for libch343ser-git: $CARCH" >&2; return 1 ;;
    esac

    cd "$srcdir/${pkgbase}/lib"
    install -vDm755 "${_libdir}/dynamic/"*.so -t "${pkgdir}/usr/lib/"
    install -vDm644 "${_libdir}/dynamic/"*.h -t "${pkgdir}/usr/include/"
}
