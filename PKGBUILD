pkgname=shure-mv6-mute-sync-git
pkgver=1.1.0.r5.g34c148c
pkgrel=1
pkgdesc="Bidirectional mute-sync support for the Shure MV6 microphone on Linux"
arch=('x86_64')
url="https://github.com/cakenes/shure-mv6-mute-sync"
license=('GPL3')
install=shure-mv6-mute-sync-git.install
depends=('dkms' 'libpulse')
makedepends=('git')
source=("$pkgname::git+https://github.com/cakenes/shure-mv6-mute-sync.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make shure-mv6-sync
}

package() {
    cd "$srcdir/$pkgname"

    # DKMS source tree
    local _dkmsdir="$pkgdir/usr/src/hid-shure-mv6-$pkgver"
    install -d "$_dkmsdir"
    install -m644 hid-shure-mv6.c dkms.conf Makefile "$_dkmsdir/"
    sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$pkgver\"/" "$_dkmsdir/dkms.conf"

    # Userspace daemon
    install -Dm755 shure-mv6-sync "$pkgdir/usr/bin/shure-mv6-sync"

    # Systemd user service
    install -Dm644 shure-mv6-sync.service "$pkgdir/usr/lib/systemd/user/shure-mv6-sync.service"

    # Udev rules
    install -Dm644 99-shure-mv6.rules "$pkgdir/usr/lib/udev/rules.d/99-shure-mv6.rules"

    # Auto-load module
    echo "hid_shure_mv6" | install -Dm644 /dev/stdin "$pkgdir/etc/modules-load.d/hid-shure-mv6.conf"
}
