# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch343ser-git
pkgname=(ch343ser-dkms-git libch343ser-git)
pkgver=r42.05b4e1f
pkgrel=2
pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc."
arch=('any')
url="https://github.com/WCHSoftGroup/ch343ser_linux"
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

package_ch343ser-dkms-git() {
    pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc (dkms)."
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
obj-m := ch343.o

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
PACKAGE_NAME="ch343ser"
PACKAGE_VERSION="${pkgver}"
MAKE[0]="make"
BUILT_MODULE_NAME[0]="ch343"
MAKEFILE="Makefile"
DEST_MODULE_LOCATION[0]="/kernel/drivers/usb/serial"
AUTOINSTALL="yes"
EOF
    # autoload
    install -Dm644 /dev/stdin "${pkgdir}/etc/modules-load.d/ch343.conf" <<EOF
ch343
EOF

    # Blacklists conflicting module
#     install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf" <<EOF
# blacklist cdc_acm
# EOF
}

package_libch343ser-git() {
    pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc (dynamic lib)."
    provides=(${pkgname%-git})
    conflicts=(${pkgname%-git})
    depends=(glibc)
    arch=($CARCH)

    cd "$srcdir/${pkgbase}/lib"
    if [ ${CARCH} = "x86_64" ]; then
        mv x64 libch343ser
    fi
    if [ ${CARCH} = "aarch64" ]; then
       mv aarch64 libch343ser
    fi

    install -dm755 "${pkgdir}/usr/lib/" \
        "${pkgdir}/usr/include/"
    cd libch343ser/dynamic
    install -Dm644 libch343.so -t "${pkgdir}/usr/lib/"
    install -Dm644 libch34xcfg.so -t "${pkgdir}/usr/lib/"
    install -Dm644 ch343_lib.h -t "${pkgdir}/usr/include/"
    install -Dm644 ch34x_parse_cfg.h -t "${pkgdir}/usr/include/"
    install -Dm644 ch9344_lib.h -t "${pkgdir}/usr/include/"
}
