pkgname=sealant
pkgver=1.0.2.26
pkgrel=1
arch=('x86_64')
license=('GPL2')
depends=('dkms')
install=sealant.install
options=('!debug')
source=("https://github.com/zelphroso/sealant/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7609181f06dcc70ba48c437bc5fbd000ce10982fbde12dc33741f6f7bfd41a78')

build() {
    cd "sealant-${pkgver}"
    make -C userspace
}

package() {
    cd "sealant-${pkgver}"
    install -Dm755 userspace/sealant "$pkgdir/usr/bin/sealant"
    install -Dm755 userspace/watch.py "$pkgdir/usr/local/share/sealant/watch.py"
    install -d "$pkgdir/usr/src/sealant-${pkgver}"
    install -Dm644 kernel/dkms.conf "$pkgdir/usr/src/sealant-${pkgver}/dkms.conf"
    install -Dm644 kernel/Makefile "$pkgdir/usr/src/sealant-${pkgver}/Makefile"
    install -Dm644 kernel/*.c "$pkgdir/usr/src/sealant-${pkgver}/"
    install -Dm644 include/sealant.h "$pkgdir/usr/src/sealant-${pkgver}/sealant.h"
    sed -i 's|../include/sealant.h|sealant.h|g' "$pkgdir/usr/src/sealant-${pkgver}/"*.c
    install -Dm644 /dev/null "$pkgdir/etc/udev/rules.d/99-sealant.rules"
    echo 'KERNEL=="sealant", GROUP="sealant", MODE="0660"' > "$pkgdir/etc/udev/rules.d/99-sealant.rules"
    install -Dm644 /dev/null "$pkgdir/etc/modules-load.d/sealant.conf"
    echo "sealant" > "$pkgdir/etc/modules-load.d/sealant.conf"
}
