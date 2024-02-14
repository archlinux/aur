# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: sukanka <su975853527 at gmail.com>

pkgname=tradingview
pkgver=2.7.4
pkgrel=1
pkgdesc='A charting platform for traders and investors'
arch=('x86_64')
url='https://www.tradingview.com/desktop/'
license=('custom:proprietary')
makedepends=('links'
             'squashfs-tools')
noextract=("$pkgname-$pkgver.snap")
source=("$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_50.snap")
b2sums=('5f9b25a6c0326bf99dc4c182b59b0cf6a4b03cebb56bfa46dcc67fb0cb029309a5dc5a54423671f98ffab58d35b1feeaadba8f00f26aca67ec796c6a00c3d4ef')

prepare() {
    unsquashfs -f -n -q -d "$pkgname-$pkgver/" "$pkgname-$pkgver.snap"
    chmod 755 "$pkgname-$pkgver/"

    # License
    links -width 80 -dump 'https://www.tradingview.com/policies/' | sed -n '/Terms of Use/,/TradingView may update these Rules at any time/p' > "LICENSE.txt"

    # Convert
    cd "$pkgname-$pkgver/"

    mv "meta/gui/$pkgname.desktop" "$pkgname.desktop"
    sed -i -e "s|Exec=.*|Exec=/usr/bin/$pkgname %U|" -e "s|Icon=.*|Icon=$pkgname|" "$pkgname.desktop"

    mv "meta/gui/icon.png" "$pkgname.png"

    rm -rf {data-dir/,gnome-platform/,lib/,meta/,scripts/,usr/,*.sh}
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
    cp -a "$pkgname-$pkgver/." "$pkgdir/opt/$pkgname/"

    chmod 755 "$pkgdir/opt/$pkgname/$pkgname"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/applications/"
    ln -s "/opt/$pkgname/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -d "$pkgdir/usr/share/icons/hicolor/512x512/apps/"
    ln -s "/opt/$pkgname/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"

    install -Dm644 "LICENSE.txt" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
