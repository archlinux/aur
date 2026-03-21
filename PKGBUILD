pkgname=shure-mv6-mute-sync-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Bidirectional mute-sync support for the Shure MV6 microphone on Linux"
arch=('x86_64')
url="https://github.com/cakenes/shure-mv6-mute-sync"
license=('GPL3')
install=shure-mv6-mute-sync-git.install
depends=('libpulse')
makedepends=('linux-headers' 'git')
source=("$pkgname::git+https://github.com/cakenes/shure-mv6-mute-sync.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname"

    # Kernel module
    install -Dm644 hid-shure-mv6.ko "$pkgdir/usr/lib/modules/$(uname -r)/extra/hid-shure-mv6.ko"

    # Userspace daemon
    install -Dm755 shure-mv6-sync "$pkgdir/usr/bin/shure-mv6-sync"

    # Systemd user service
    install -Dm644 shure-mv6-sync.service "$pkgdir/usr/lib/systemd/user/shure-mv6-sync.service"

    # Udev rules
    install -Dm644 99-shure-mv6.rules "$pkgdir/usr/lib/udev/rules.d/99-shure-mv6.rules"

    # Auto-load module
    echo "hid_shure_mv6" | install -Dm644 /dev/stdin "$pkgdir/etc/modules-load.d/hid-shure-mv6.conf"
}
