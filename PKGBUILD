# Maintainer: loathingkernel
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>

pkgbase=ntsync
pkgname=(ntsync-dkms ntsync-header ntsync-common)
pkgver=6.8.2
pkgrel=1
pkgdesc="NT synchronization primitive driver"
arch=(x86_64)
url='https://repo.or.cz/linux/zf.git/shortlog/refs/heads/ntsync5'
license=('GPL2')
_commit=e4690b31f999c4317df5955c6ee4a77044e6c4a9
source=("ntsync.c-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/drivers/misc/ntsync.c"
        "ntsync.h-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/include/uapi/linux/ntsync.h"
        'ntsync.conf'
        '99-ntsync.rules'
        'Makefile'
        'dkms.conf')
sha256sums=('acc5c24f2a769e83ccdad55d02b82aa2d21b240c2b1ca630314e07b4ede1c4b2'
            '7b47801aa0bec3395a2509efebe5cea005994fca7868130d4b6fec3bb8738f71'
            'c19771ae86e7df179f6b2f4a2837d3f0cbbbba7b32baef41a3c27120c760d78f'
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
        'ntsync-header: Allow wine to be compiled with ntsync support'
    )
    provides=(NTSYNC-MODULE)
    conflicts=(ntsync)

    install -Dm644 "$srcdir/Makefile" "$pkgdir/usr/src/$pkgbase-$pkgver/Makefile"
    install -Dm644 "$srcdir/ntsync.h-$_commit" "$pkgdir/usr/src/$pkgbase-$pkgver/include/uapi/linux/ntsync.h"
    install -Dm644 "$srcdir/ntsync.c-$_commit" "$pkgdir/usr/src/$pkgbase-$pkgver/drivers/misc/ntsync.c"
    install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$pkgbase-$pkgver/dkms.conf"
}

package_ntsync-header() {
    pkgdesc+=" - linux api header file"

    install -Dm644 "$srcdir/ntsync.h-$_commit" "$pkgdir/usr/include/linux/ntsync.h"
}

package_ntsync-common() {
    pkgdesc+=" - common files"
    provides=(ntsync-udev-rule)
    conflicts=(ntsync-udev-rule)
    replaces=(ntsync-udev-rule)

    install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/ntsync.conf"
    install -Dm644 "$srcdir/99-ntsync.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntsync.rules"
}

