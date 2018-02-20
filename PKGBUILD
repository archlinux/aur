# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=libbass
pkgver=2.4.12
pkgrel=1
pkgdesc="BASS audio library"
arch=(i686 x86_64 armv6h armv7h aarch64)
url="http://www.un4seen.com/"
license=(custom)
depends=(alsa-lib unzip)

source=(http://dl.un4seen.com/files/bass24-linux.zip LICENSE)
sha256sums=('a7c97bd246272406a44ad73dcbc2deb37321af5c74be59f1f9d5cfa5744c5fa8'
            'f7bc36320110c8fd2f87c6d2bb5df6d2231ca9ab31a299b1565de63f7681cc83')

source_armv6h=(bass24-linux-armv6h.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip)
sha256sums_armv6h=('84af659883eee1a5718d1a9bcb3fcc7d122b40a6f28c03cff2ab2e359d236e49')
source_armv7h=(bass24-linux-armv7h.zip::http://dl.un4seen.com/stuff/bass24-linux-arm.zip)
sha256sums_armv7h=('84af659883eee1a5718d1a9bcb3fcc7d122b40a6f28c03cff2ab2e359d236e49')
source_aarch64=(http://dl.un4seen.com/stuff/bass24-linux-aarch64.zip)
sha256sums_aarch64=('a1a481e3a9b163a698734c1311b6b38627a80fc252ec0498136298cb6bff8bf7')

build () {
    unzip -q bass24-linux.zip -d "$srcdir/$pkgname-$pkgver"

    if [[ -e "bass24-linux-$CARCH.zip" ]]; then
        unzip -q bass24-linux-$CARCH.zip -d "$srcdir/$pkgname-$pkgver/$CARCH"
    fi
}

package () {
    install -D -m644 "$startdir/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    cd "$srcdir/$pkgname-$pkgver"
    
    case "$CARCH" in
    i686)
        install -D -m755 libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    x86_64)
        install -D -m755 x64/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    armv6h|armv7h)
        install -D -m755 $CARCH/hardfp/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    aarch64)
        install -D -m755 $CARCH/libbass.so "$pkgdir/usr/lib/libbass.so"
	;;
    esac

    install -D -m644 bass.h "$pkgdir/usr/include/bass.h"
    install -D -m644 bass.chm "$pkgdir/usr/share/doc/libbass/bass.chm"
}
