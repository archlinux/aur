# Maintainer: loathingkernel
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>
# Contributor: Echo J. <aidas957 at gmail dot com>

pkgbase=ntsync
pkgname=(ntsync-dkms ntsync-header ntsync-common)
pkgver=6.12.1
pkgrel=1
pkgdesc="NT synchronization primitive driver"
arch=(any)
url='https://lore.kernel.org/lkml/20240519202454.1192826-1-zfigura@codeweavers.com/'
license=('GPL-2.0-only WITH Linux-syscall-note')
_commit=v"$pkgver"-zen1
source=("ntsync.c-$_commit::https://raw.githubusercontent.com/zen-kernel/zen-kernel/$_commit/drivers/misc/ntsync.c"
        "ntsync.h-$_commit::https://raw.githubusercontent.com/zen-kernel/zen-kernel/$_commit/include/uapi/linux/ntsync.h"
        'ntsync.conf'
        'ntsync-header.hook'
        '99-ntsync.rules'
        'Makefile'
        'dkms.conf')
sha256sums=('c33ddbbe7d0aa7331c9ab4cb1fed3fbaea97151399c67cce0857c9227b9f89e8'
            'b1e1387316520db8c0ec55ff71a154020f69a037b024776aaf94b405d7046515'
            'c19771ae86e7df179f6b2f4a2837d3f0cbbbba7b32baef41a3c27120c760d78f'
            '7ca825f950853867eb137484b28053aaf5ebb6b0324ef399131134ad2a22d7fc'
            'ce5221146a19206ba043211db8f27143a82f9224c0aff24a0b584b7268fcb994'
            '834a7b4c9a67a44f2cf593bf259918ea12b0c0eeee7862ed4f9fd268076171cf'
            'e81694fa952711f1b74f02b6a64ac1e90c229f93c740e4f97df5692f3af99609')

prepare() {
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" "$srcdir/dkms.conf"
}

package_ntsync-dkms() {
    pkgdesc+=" - out-of-tree module"
    depends=(dkms ntsync-common)
    optdepends=(
        'ntsync-header: Allow Wine to be compiled with ntsync support'
    )
    provides=(NTSYNC-MODULE)
    conflicts=(ntsync)

    # Force the use of included header (required since 6.10+)
    sed 's|<uapi/linux/ntsync.h>|"../../include/uapi/linux/ntsync.h"|g' -i "$srcdir/ntsync.c-$_commit"

    install -Dm644 "$srcdir/Makefile" "$pkgdir/usr/src/$pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/ntsync.h-$_commit" "$pkgdir/usr/src/$pkgbase-$pkgver/include/uapi/linux/ntsync.h"
    install -Dm644 "$srcdir/ntsync.c-$_commit" "$pkgdir/usr/src/$pkgbase-$pkgver/drivers/misc/ntsync.c"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
}

package_ntsync-header() {
    pkgdesc+=" - Linux API header file"
    depends=('linux-api-headers>=6.10')
    install=ntsync-header.install

    install -Dm644 "$srcdir/ntsync.h-$_commit" "$pkgdir/usr/share/ntsync/ntsync.h"
    install -Dm644 "$srcdir/ntsync-header.hook" "$pkgdir/usr/share/libalpm/hooks/ntsync-header.hook"
}

package_ntsync-common() {
    pkgdesc+=" - common files"
    provides=(ntsync-udev-rule)
    conflicts=(ntsync-udev-rule)
    replaces=(ntsync-udev-rule)

    install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/ntsync.conf"
    install -Dm644 "$srcdir/99-ntsync.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntsync.rules"
}

