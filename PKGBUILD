makedepends=('git')
source=("git+https://github.com/kswit/USB_driver.git")
sha256sums=('SKIP')

pkgname=gspca_aveo-dkms
pkgver=1.0
pkgrel=1
arch=('x86_64')
depends=('dkms')



package() {
    cd "$srcdir/USB_driver/gspca_aveo"

    install -dm755 "$pkgdir/usr/src/gspca_aveo-${pkgver}"

    # kopiuj tylko potrzebne pliki
     install -m644 *.c *.h Makefile dkms.conf \
        "$pkgdir/usr/src/gspca_aveo-${pkgver}/"

    # dkms.conf
    cat > "$pkgdir/usr/src/gspca_aveo-${pkgver}/dkms.conf" <<EOF
PACKAGE_NAME="gspca_aveo"
PACKAGE_VERSION="${pkgver}"

BUILT_MODULE_NAME[0]="gspca_aveo"
DEST_MODULE_LOCATION[0]="/kernel/drivers/media/usb/gspca"

MAKE[0]="make -C /lib/modules/\${kernelver}/build M=\${dkms_tree}/gspca_aveo/${pkgver}/build modules"
CLEAN="make -C /lib/modules/\${kernelver}/build M=\${dkms_tree}/gspca_aveo/${pkgver}/build clean"

AUTOINSTALL="yes"
EOF
}