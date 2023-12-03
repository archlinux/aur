# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: sukanka <su975853527 at gmail.com>

pkgname=tradingview
pkgver=2.7.1
pkgrel=4
pkgdesc='A charting platform for traders and investors'
arch=('x86_64')
url='https://www.tradingview.com/desktop/'
license=('custom:proprietary')
makedepends=('links'
             'squashfs-tools')
source=("$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_48.snap"
        "$pkgname.desktop")
b2sums=('979958b07225cb2cd0b132d98b7e8727cca2b6fca8fd5608b16f9c9daddbe39c21b9ea94ceac47447c79e97cb6ca15fab63bfe0fadbc8d221ba75cd71dc428f8'
        '08a4fe6afaccd06dae85a3ee4b812c8807c544416926c90b48b0c4fdd7137bc585d4ccd5ade3f4eb950d4f69fb8813c3c9521de1918601bd8f5af3b5b75a0efe')

prepare() {
    ## EULA
    links -width 80 -dump https://www.tradingview.com/policies/ | \
        sed -n '/Terms of Use, Policies and Disclaimers/,/TradingView may update these Rules at any time./p' > "$srcdir/EULA.txt"

    ## Extract
    unsquashfs -q -f -d "$pkgname-$pkgver/" "$pkgname-$pkgver.snap"

    mv "$pkgname-$pkgver/meta/gui/icon.png" "$srcdir/$pkgname.png"

    rm -r "$pkgname-$pkgver/"{data-dir/,gnome-platform/,lib/,meta/,scripts/,usr/,*.sh}
}

package() {
    depends=('alsa-lib'
             'at-spi2-core'
             'cairo'
             'dbus'
             'expat'
             'gcc-libs'
             'glib2'
             'glibc'
             'gtk3'
             'hicolor-icon-theme'
             'libcups'
             'libdrm'
             'libsecret'
             'libx11'
             'libxcb'
             'libxcomposite'
             'libxdamage'
             'libxext'
             'libxfixes'
             'libxkbcommon'
             'libxrandr'
             'mesa'
             'nspr'
             'nss'
             'pango')

    install -d "$pkgdir/opt/$pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin/"
    ln -s "$pkgdir/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
    install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/EULA.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
