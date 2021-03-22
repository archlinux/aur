# Maintainer: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>

_provide_header=true
_provide_udev_rule=true

_pkgbase=winesync
pkgname=winesync-dkms
pkgver=5.11
pkgrel=6
pkgdesc="Wine synchronization primitive driver - out-of-tree module"
arch=('any')
url='https://repo.or.cz/linux/zf.git/shortlog/refs/heads/winesync'
_depends=('dkms')
optdepends=('linux-headers: build the module for Arch kernel')
provides=("WINESYNC-MODULE=$pkgver")
license=('GPL2')
options=('!strip')
_commit=e97dfb6b3ee6792cd1fe8242df4dafd8f10cca99
source=("winesync.c-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/drivers/misc/winesync.c"
        "winesync.h-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/include/uapi/linux/winesync.h"
        '99-winesync.rules'
        'Makefile'
        'dkms.conf')
sha256sums=('54408ac30ab482781cb554dd86f05020dda4473bee0caecc326fa1cdda719b9f'
            'ab632cb5ec60a285846bd491de49a35e629f08a0a29882672f56ae280144e95d'
            '9b22d9976a83785e6a1cfc4a3aa230a8c5e4e903730bbafc598ec86bfaa35c3e'
            '05735aa1fef1eda3c6dca8b7a0c2a7eebf1eba8af38f608b4b1c34d4acbad453'
            '650fc356d45409fdf22811d9ffde63cc24a169d438e002a2a749a42d5369f916')

if [ "$_provide_header" = true ]; then
    provides+=("$_pkgbase-header=$pkgver")
    conflicts+=("$_pkgbase-header")
fi
if [ "$_provide_udev_rule" = true ]; then
    provides+=("$_pkgbase-udev-rule=$pkgver")
    conflicts+=("$_pkgbase-udev-rule")
fi

prepare() {
    kernver="$(echo "$pkgver" | sed 's/\./\\\\\\\\\\./g')"
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" -e "s/@KERNVER@/$kernver/g" "$srcdir/dkms.conf"
}

package() {
    depends=("${_depends[@]}")
    install -Dm644 "$srcdir/Makefile" "$pkgdir/usr/src/$_pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/winesync.h-$_commit" "$pkgdir/usr/src/$_pkgbase-$pkgver/include/uapi/linux/winesync.h"
    install -Dm644 "$srcdir/winesync.c-$_commit" "$pkgdir/usr/src/$_pkgbase-$pkgver/src/drivers/misc/winesync.c"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgbase-$pkgver/dkms.conf"
    if [ "$_provide_header" = true ]; then
        install -Dm644 "$srcdir/winesync.h-$_commit" "$pkgdir/usr/include/linux/winesync.h"
    fi
    if [ "$_provide_udev_rule" = true ]; then
        install -Dm644 "$srcdir/99-winesync.rules" "$pkgdir/usr/lib/udev/rules.d/99-winesync.rules"
    fi
}
