# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch343ser-git
pkgname=(ch343ser-git ch343ser-dkms-git libch343ser-git)
pkgver=r58.9e6eb31
pkgrel=3
pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc."
arch=($CARCH)
url="https://github.com/WCHSoftGroup/ch343ser_linux"
license=('GPL-2.0-or-later')
depends=(dkms
    glibc)
makedepends=('git')
source=("${pkgbase}::git+${url}.git"
    "ch343ser-dkms-git.install")
sha256sums=('SKIP'
    '6cd61719a10c54747b9794a684e68eedd8c6b38424b1710940c13434b2ec7d55')
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

package_ch343ser-git() {
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(
        ch343ser-dkms-git
        libch343ser-git
    )
}

package_ch343ser-dkms-git() {
    pkgdesc+="= (dkms)."
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git} brltty-udev-generic)
    depends=(dkms)
    optdepends=('linux-headers: build the module against Arch kernel'
        'linux-ck-headers: build the module against Linux-ck kernel'
        'linux-lts-headers: build the module against LTS Arch kernel')
    arch=('any')
    install=${pkgname}.install
    cd "$srcdir/${pkgbase}/driver"
    rm -rf Makefile
    install -Dm755 /dev/stdin Makefile <<EOF
obj-m := ch343.o

KVER ?= \$(shell uname -r)
KDIR ?= /lib/modules/\$(KVER)/build
VERSION ?= \$(shell cat VERSION)
SRC_DIR=\$(shell pwd)

default:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) modules

clean:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) clean

install:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) modules_install

unload:
	/sbin/rmmod ch343

load: unload
	/sbin/insmod ch343.ko

dkms.conf: dkms.conf.in
	sed "s/@@VERSION@@/\$(VERSION)/" $^ > \$@

dkms-add: dkms.conf
	/usr/sbin/dkms add \$(SRC_DIR)

dkms-build: dkms.conf
	/usr/sbin/dkms build ch343/\$(VERSION)

dkms-install: dkms.conf
	/usr/sbin/dkms install ch343/\$(VERSION)

dkms-remove: dkms.conf
	/usr/sbin/dkms remove ch343/\$(VERSION) --all

modprobe-install:
	modprobe ch343

modprobe-remove:
	modprobe -r ch343

dev: modprobe-remove dkms-remove dkms-add dkms-builddkms-install modprobe-install
EOF
    install -dm755 "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"
    for i in "${srcdir}/${pkgbase}/driver/"{Makefile,*.c,*.h}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"
    done

    install -Dm0644 /dev/stdin "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/dkms.conf" <<EOF
PACKAGE_NAME="ch343ser"
PACKAGE_VERSION="#MODULE_VERSION#"
AUTOINSTALL="yes"

MAKE="make KVER=\$kernelver"
CLEAN="make clean"

BUILT_MODULE_NAME[0]="ch343"
DEST_MODULE_LOCATION[0]="/kernel/drivers/usb/serial"
EOF
    # autoload
    install -Dm644 /dev/stdin "${pkgdir}/etc/modules-load.d/ch343.conf" <<EOF
ch343
EOF
    sed -i 's|GROUP="plugdev"|TAG+="uaccess"|g' "${srcdir}/${pkgbase}/udev/99-ch34x.rules"
    install -Dm644 "${srcdir}/${pkgbase}/udev/99-ch34x.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"
    # Blacklists conflicting module
    #     install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf" <<EOF
    # blacklist cdc_acm
    # EOF
}

package_libch343ser-git() {
    pkgdesc+=" (dynamic lib)."
    provides=(${pkgname%-git} libch9344ser)
    conflicts=(${pkgname%-git} libch9344ser)
    depends=(glibc)
    arch=($CARCH)

    cd "$srcdir/${pkgbase}/lib"
    if [ ${CARCH} = "x86_64" ]; then
        install -vDm644 x64/dynamic/*.so -t "${pkgdir}/usr/lib/"
        install -vDm644 x64/dynamic/*.h -t "${pkgdir}/usr/include/"
    fi
    if [ ${CARCH} = "aarch64" ]; then
        install -vDm644 aarch64/dynamic/*.so -t "${pkgdir}/usr/lib/"
        install -vDm644 aarch64/dynamic/*.h -t "${pkgdir}/usr/include/"
    fi
}
