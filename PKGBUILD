# Maintainer: Ivan Gabaldon <ivan [d0t] gab [at] inetol [d0t] net>
# Contributor: sukanka <su975853527 at gmail.com>

pkgname=tradingview
pkgver=1.0.17
pkgrel=1
pkgdesc='Experience extra power, extra speed and extra flexibility, all with the same UX you know and love'
arch=('x86_64')
url='https://www.tradingview.com/desktop/'
license=('custom')
makedepends=('squashfs-tools')
conflicts=("$pkgname-bin")
source=("$pkgname-$pkgver.snap::https://api.snapcraft.io/api/v1/snaps/download/nJdITJ6ZJxdvfu8Ch7n5kH5P99ClzBYV_28.snap"
        'desktop_entry.patch')
b2sums=('30eebad7a5e9429756fbba88368b5a29937bedead517fed431d9308bf4ad7c0373c5f730201a3f8435a7d761b9598eaa314a7f2e034962fb0194331b879cbb7f'
        'b7dbd4f2de84d281ae4b93d35ee039f9dad111696f856867e295b4e214bf28c524b350bf6f160992f8d72d3c15a17291f9dee744e0cb7d5d1ab0449fd6b316a3')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    unsquashfs -q -n -f -d "$pkgname-$pkgver/" $pkgname-$pkgver.snap

    mv "$pkgname-$pkgver/meta/gui/"{icon.png,$pkgname.desktop} "$srcdir"
    rm -r "$pkgname-$pkgver/"{data-dir/,gnome-platform/,lib/,meta/,scripts/,usr/}

    patch -u "$srcdir/$pkgname.desktop" -i "$srcdir/desktop_entry.patch"
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
