# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch343ser-git
pkgname=(ch343ser-git ch343ser-dkms-git libch343ser-git)
pkgver=r61.b5515b9
pkgrel=4
pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc."
arch=($CARCH)
url="https://github.com/WCHSoftGroup/ch343ser_linux"
license=('GPL-2.0-or-later')
makedepends=('git')
source=(
    "${pkgbase}::git+${url}.git"
    "ch343ser-dkms-git.install"
)
sha256sums=('SKIP'
            '92dee6db2b97fc397d5182a289d633d728bb64aca7e6a5cb757830a2d40b1363')
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
    install=${pkgname}.install
    cd "$srcdir/${pkgbase}/driver"
    install -dm755 "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"
    install -vDm644 ch343.c ch343.h -t "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"

    install -vDm0644 /dev/stdin "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/Makefile" <<EOF
obj-m := ch343.o

KVER ?= \$(shell uname -r)
KDIR ?= /lib/modules/\$(KVER)/build
VERSION ?= \$(shell cat VERSION)
SRC_DIR=\$(shell pwd)

default:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) modules

install:
	\$(MAKE) -C \$(KDIR) M=\$(SRC_DIR) modules_install

unload:
	/sbin/rmmod ch343

load: unload
	/sbin/insmod ch343.ko

dkms.conf: dkms.conf.in
	sed "s/@@VERSION@@/\$(VERSION)/" \$^ > \$@

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

    install -vDm0644 /dev/stdin "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/dkms.conf" <<EOF
PACKAGE_NAME="ch343ser"
PACKAGE_VERSION="#MODULE_VERSION#"
AUTOINSTALL="yes"

MAKE[0]="make KVER=\$kernelver"

BUILT_MODULE_NAME[0]="ch343"
DEST_MODULE_LOCATION[0]="/updates"
EOF
    # autoload
    install -vDm644 /dev/stdin "${pkgdir}/etc/modules-load.d/ch343.conf" <<EOF
ch343
EOF
    sed 's|GROUP="plugdev"|TAG+="uaccess"|g' \
        "${srcdir}/${pkgbase}/udev/99-ch34x.rules" \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-ch34x.rules"
    # Blacklists conflicting module
    #     install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf" <<EOF
    # blacklist cdc_acm
    # EOF
}

package_libch343ser-git() {
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
    install -vDm644 "${_libdir}/dynamic/"ch34*.h -t "${pkgdir}/usr/include/"
}
