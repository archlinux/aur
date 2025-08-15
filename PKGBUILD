# Maintainer: zhang <zhangzizhuo2@gmail.com>

pkgname=vserial
pkgver=1.0.0
pkgrel=1
pkgdesc="Virtual serialport kernel module"
arch=('x86_64' 'aarch64')
url="https://github.com/33671/vserial"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('linux-headers' 'gcc')
source=("vserial::git+https://github.com/33671/vserial"
        "dkms.conf"
        "vserial_startup.conf")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$srcdir/vserial"
}

package() {
    dkmsdir="$pkgdir/usr/src/vserial-${pkgver}"
    install -dm755 "$dkmsdir"
    cd "$srcdir/vserial"
    cp -a --parents *.c Makefile Kbuild 99-vserial.rules "$dkmsdir"
    cd "$srcdir"
    install -Dm644 dkms.conf "$dkmsdir/dkms.conf"
    install -Dm644 vserial_startup.conf "$pkgdir/etc/modules-load.d/vserial.conf"
    install -Dm644 "$srcdir/vserial/99-vserial.rules" \
                   "$pkgdir/usr/lib/udev/rules.d/99-vserial.rules"
    install -Dm755 "$srcdir/vserial/vserialctl" "$pkgdir/usr/bin/vserialctl"

}
build() {
    cd "$srcdir/vserial"
    make -C /lib/modules/$(uname -r)/build M="$PWD" modules
    gcc -o vserialctl vserialctl.c
}

pre_remove() {
    dkms remove "vserial/${pkgver}" --all 2>/dev/null || true
}
