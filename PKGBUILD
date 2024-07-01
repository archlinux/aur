# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch9344ser-git
pkgname=(ch9344ser-dkms-git libch9344ser-git)
pkgver=r36.c9640d2
pkgrel=4
pkgdesc="This driver supports USB to quad serial ports chip ch9344 and USB to octal serial ports chip ch348."
arch=('any')
url="https://github.com/WCHSoftGroup/ch9344ser_linux"
license=('GPL-2.0-or-later')
depends=(dkms
    glibc)
makedepends=('git')
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')
options=(!strip !debug)

pkgver() {
    cd "${srcdir}/${pkgbase}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

package_ch9344ser-dkms-git() {
    pkgdesc+=" (dkms)."
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(dkms)
    optdepends=('linux-headers: build the module against Arch kernel'
  'linux-ck-headers: build the module against Linux-ck kernel'
  'linux-lts-headers: build the module against LTS Arch kernel')
    arch=('any')
    cd "$srcdir/${pkgbase}/driver"
    rm -rf Makefile
    install -Dm755 /dev/stdin  Makefile <<EOF
KERNELDIR := /lib/modules/\$(shell uname -r)/build
obj-m := ch9344.o

ifdef KERNELDIR
all:
	\$(MAKE) -C \$(KERNELDIR) M=\$(PWD) modules
else
all:
	@echo "Error: KERNELDIR is undefined. Please specify KERNELDIR=\$(KERNELDIR)"
	@exit 1
endif

clean:
	\$(MAKE) -C \$(KERNELDIR) M=\$(PWD) clean
EOF
    install -dm755 "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"
    for i in "${srcdir}/${pkgbase}/driver/"{Makefile,*.c,*.h}; do
        install -D -m644 "${i}" "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/"
    done

    install -Dm0644 /dev/stdin "${pkgdir}/usr/src/${pkgbase%-git}-${pkgver#r}/dkms.conf" <<EOF
PACKAGE_NAME="ch9344ser"
PACKAGE_VERSION="${pkgver}"
MAKE[0]="make --uname_r=$kernelver"
CLEAN="make clean"
BUILT_MODULE_NAME[0]="ch9344"
DEST_MODULE_LOCATION[0]="/kernel/drivers/usb/serial"
AUTOINSTALL="yes"
EOF
    # autoload
    install -Dm644 /dev/stdin "${pkgdir}/etc/modules-load.d/ch9344.conf" <<EOF
ch9344
EOF

    # Blacklists conflicting module
#     install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf" <<EOF
# blacklist cdc_acm
# EOF
}

package_libch9344ser-git() {
    pkgdesc+=" (dynamic lib)."
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(glibc)
    arch=($CARCH)

    cd "$srcdir/${pkgbase}/lib"
    if [ ${CARCH} = "x86_64" ]; then
        mv x64 libch9344ser
    fi
    if [ ${CARCH} = "aarch64" ]; then
       mv aarch64 libch9344ser
    fi

    install -dm755 "${pkgdir}/usr/lib/" \
        "${pkgdir}/usr/include/"
    cd libch9344ser/dynamic
    install -Dm644 libch9344.so -t "${pkgdir}/usr/lib/"
    install -Dm644 ch9344_lib.h -t "${pkgdir}/usr/include/"
}
