# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch343ser-git
pkgname=ch343ser-dkms-git
pkgver=r21.ad5828d
pkgrel=2
pkgdesc="USB serial driver for ch342/ch343/ch344/ch347/ch347f/ch9101/ch9102/ch9103/ch9104, etc (dkms)."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/WCHSoftGroup/ch343ser_linux"
license=('GPL')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(dkms)
makedepends=('git')
optdepends=('linux-headers: build the module against Arch kernel'
  'linux-ck-headers: build the module against Linux-ck kernel'
  'linux-lts-headers: build the module against LTS Arch kernel')
source=("${pkgbase}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgbase}"
#   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
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
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modprobe.d/cdc_acm.conf" <<EOF
blacklist cdc_acm
EOF
}
