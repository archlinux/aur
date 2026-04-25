# Maintainer: taotieren <admin@taotieren.com>

pkgbase=ch34x-mphsi-master-git
pkgname=(ch34x-mphsi-master-dkms-git)
pkgver=r15.da22601
pkgrel=1
pkgdesc="CH341A/B/C/F/H/T | CH347F/T | CH339W Linux USB to SPI/I2C/GPIO Controller Driver"
arch=('any')
url="https://github.com/WCHSoftGroup/ch34x_mphsi_master_linux"
license=('GPL-2.0-or-later')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
    dkms
)
makedepends=(
    git
)
optdepends=(
    'i2c-tools: Heterogeneous set of I2C tools for Linux that used to be part of lm-sensors'
)
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

package() {

    cd "$srcdir/${pkgbase}/driver"
    rm -rf Makefile
    install -Dm755 /dev/stdin  Makefile <<EOF
KERNELDIR := /lib/modules/\$(shell uname -r)/build
obj-m := ch34x_mphsi_master.o
ch34x_mphsi_master-y := ch34x_mphsi_master_usb.o ch34x_mphsi_master_spi.o ch34x_mphsi_master_i2c.o ch34x_mphsi_master_gpio.o

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
PACKAGE_NAME="ch34x_mphsi_master"
PACKAGE_VERSION="${pkgver}"
MAKE[0]="make"
BUILT_MODULE_NAME[0]="ch34x_mphsi_master"
MAKEFILE="Makefile"
DEST_MODULE_LOCATION[0]="/kernel/drivers/usb/misc"
AUTOINSTALL="yes"
EOF
    # autoload
    install -Dm644 /dev/stdin "${pkgdir}/etc/modules-load.d/ch34x_mphsi_master.conf" <<EOF
ch34x_mphsi_master
EOF
}
