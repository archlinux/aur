# Maintainer: Francis Fajardo <fajardo@duck.com>

_modname=8851bu
_pkgbase=rtl8851bu
_pkgver=1.19.10

pkgname=rtl8851bu-dkms-git
pkgver=1.19.10.r19.5d984a3
pkgrel=1
pkgdesc="Kernel module for Realtek RTL8851BU WiFi chipset"
arch=('any')
url="https://github.com/fofajardo/rtl8851bu"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git')
source=(
    "dkms.conf"
    "git+https://github.com/fofajardo/rtl8851bu.git"
)
sha256sums=('3bdec70a0d23eb513ca74295f6c0e112b8e4dd661c3841f530a19cbc407efd61'
            'SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"

    printf "%s.r%s.%s" "$_pkgver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgbase"

    mkdir -p "$pkgdir/usr/src/$_pkgbase-$pkgver"
    cp -pr * "$pkgdir/usr/src/$_pkgbase-$pkgver"

    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    sed -e "s/#MODULE_NAME#/$_modname/g" -i "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    sed -e "s/#PACKAGE_NAME#/$_pkgbase/g" -i "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    sed -e "s/#PACKAGE_VERSION#/$pkgver/g" -i "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"

    sed -e "s/\$(MAKE) ARCH=.*-C/\$(MAKE) -C/g" -i "$pkgdir/usr/src/$_pkgbase-$pkgver/Makefile"
}
