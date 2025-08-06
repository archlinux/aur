# Maintainer: zhang <zhangzizhuo2@gmail.com>

pkgname=vtty
pkgver=1.0.0
pkgrel=1
pkgdesc="Virtual TTY (serial port) kernel module with systemd service"
arch=('x86_64')
url="https://github.com/33671/vtty"
license=('GPL')
depends=('dkms' 'systemd')
makedepends=('linux-headers')
source=("vtty::git+https://github.com/33671/vtty#branch=arch_dev"
        "vtty.service"
	"dkms.conf")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd "$srcdir/vtty"
    #patch -Np1 -i "$srcdir/Makefile-dkms.patch"
}

package() {
    dkmsdir="$pkgdir/usr/src/vtty-${pkgver}"
    install -dm755 "$dkmsdir"
    cd "$srcdir/vtty"
    cp -a --parents *.c *.h Makefile Kbuild 50-vtty.rules "$dkmsdir"
    cd "$srcdir"
    install -Dm644 dkms.conf "$dkmsdir/dkms.conf"
    install -Dm644 vtty.service "$pkgdir/usr/lib/systemd/system/vtty.service"
    install -Dm644 "$srcdir/vtty/50-vtty.rules" \
                   "$pkgdir/usr/lib/udev/rules.d/50-vtty.rules"
}
build() {
    cd "$srcdir/vtty"
    make -C /lib/modules/$(uname -r)/build M="$PWD" modules	
}
post_install() {
    systemctl daemon-reload
    systemctl enable --now vtty.service
}

pre_remove() {
    systemctl disable --now vtty.service 2>/dev/null || true
    dkms remove "vtty/${pkgver}" --all 2>/dev/null || true
}
