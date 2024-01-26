# Maintainer: loathingkernel
# Contributor: Torge Matthies <openglfreak at googlemail dot com>
# Contributor: Krzysztof Bogacki <krzysztof dot bogacki at leancode dot pl>

pkgbase=ntsync
pkgname=(ntsync-dkms ntsync-header ntsync-common)
pkgver=6.8
pkgrel=3
pkgdesc="NT synchronization primitive driver"
arch=(x86_64)
url='https://repo.or.cz/linux/zf.git/shortlog/refs/heads/ntsync4'
license=('GPL2')
_commit=61d4a98b79a685392845f494f6cb51ef06f3733a
source=("ntsync.c-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/drivers/misc/ntsync.c"
        "ntsync.h-$_commit::https://repo.or.cz/linux/zf.git/blob_plain/$_commit:/include/uapi/linux/ntsync.h"
        'ntsync.conf'
        '99-ntsync.rules'
        'Makefile'
        'dkms.conf')
sha256sums=('03386cca8fbd6b0eae00b306cb235380b666fc62d0b116addd4ab5bd57237959'
            'a6e5116ad5fd090d0c767738927257188da2b112452e67cbd165d8b780b2b156'
            'c19771ae86e7df179f6b2f4a2837d3f0cbbbba7b32baef41a3c27120c760d78f'
            'ce5221146a19206ba043211db8f27143a82f9224c0aff24a0b584b7268fcb994'
            'dc35852676cf71afa2350a075bc1209ab7e3aa9c71a450e94969d411c1f5073c'
            'e81694fa952711f1b74f02b6a64ac1e90c229f93c740e4f97df5692f3af99609')

prepare() {
    sed -i -e "s/@PACKAGE_VERSION@/$pkgver/g" "$srcdir/dkms.conf"
}

package_ntsync-dkms() {
    pkgdesc+=" - out-of-tree module"
    depends=(dkms)
    optdepends=(ntsync-header ntsync-common)
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

    install -Dm644 "$srcdir/ntsync.conf" "$pkgdir/usr/lib/modules-load.d/ntsync.conf"
    install -Dm644 "$srcdir/99-ntsync.rules" "$pkgdir/usr/lib/udev/rules.d/99-ntsync.rules"
}
