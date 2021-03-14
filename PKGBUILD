# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_pkgbase=winesync
pkgname=winesync-dkms
pkgver=5.11
pkgrel=1
pkgdesc="Wine synchronization primitive driver - out-of-tree module"
arch=('x86_64')
url='https://repo.or.cz/linux/zf.git/shortlog/refs/heads/winesync'
depends=('dkms')
optdepends=('linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("$_pkgbase=$pkgver" "$pkgname=$pkgver")
conflicts=("$_pkgbase" "$pkgname")
license=('GPL2')
options=('!strip')
_commit=369d01fb4c75cb8244443f45cc53e9a2eb90af5d
source=("https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/drivers/misc/winesync.c"
        "https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/include/uapi/linux/winesync.h"
        '99-winesync.rules'
        'Makefile'
        'dkms.conf')
sha256sums=('e28e61d370f48b1908c8798df601849cafa1cb162a377fd8d0ff43c5f0ce430a'
            'ab632cb5ec60a285846bd491de49a35e629f08a0a29882672f56ae280144e95d'
            '9b22d9976a83785e6a1cfc4a3aa230a8c5e4e903730bbafc598ec86bfaa35c3e'
            '05735aa1fef1eda3c6dca8b7a0c2a7eebf1eba8af38f608b4b1c34d4acbad453'
            '650fc356d45409fdf22811d9ffde63cc24a169d438e002a2a749a42d5369f916')

build() {
    kernver="$(echo "$pkgver" | sed 's/\./\\\\\\\\\\./g')"
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" -e "s/@KERNVER@/$kernver/g" "$srcdir/dkms.conf"
}

package() {
    install -Dm644 "$srcdir/99-winesync.rules" "$pkgdir/usr/lib/udev/rules.d/99-winesync.rules"
    install -Dm644 "$srcdir/Makefile" "$pkgdir/usr/src/$_pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/winesync.h" "$pkgdir/usr/src/$_pkgbase-$pkgver/include/uapi/linux/winesync.h"
    install -Dm644 "$srcdir/winesync.c" "$pkgdir/usr/src/$_pkgbase-$pkgver/src/drivers/misc/winesync.c"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
}
