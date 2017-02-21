# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=simplicitystudio
pkgver=4
pkgrel=3
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(i686 x86_64)
url='https://www.silabs.com/products/mcu/Pages/simplicity-studio.aspx'
license=('unknown')

depends_i686=(gtk2 libxtst qt4)
depends_x86_64=(lib32-gtk2 lib32-libxtst lib32-qt4)

options=('!strip')

source=(http://www.silabs.com/Support%20Documents/Software/SimplicityStudio-v4.tgz
        simplicitystudio.patch
        simplicitystudio)
sha256sums=('68a3435165e6ab3f1ff935204cbf0c08a169ed544b97efda1ca310401311493b'
            '0ccc9c084c82d99174980f299dc0f8a10249170060640ea19bec309a775f83c8'
            'ad55e8352d5d3d9cba50553086ca6d8b1d5072dc87b2763a79f34210f7bc2b5d')

prepare() {
    cd "$srcdir/SimplicityStudio_v4"
    patch -p1 -i "$srcdir/simplicitystudio.patch"
}

package() {
    install -dm755 "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    cp -a "$srcdir/SimplicityStudio_v4" "$pkgdir/opt/$pkgname"

    DESTDIR="$pkgdir" "$pkgdir/opt/$pkgname/setup.sh"

    # installation directory has to be writable
    find "$pkgdir/opt/$pkgname" -type d -exec chmod a+w {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod a+w {} +

    install -Dm755 "$srcdir/simplicitystudio" "$pkgdir/usr/bin/$pkgname"
    sed -i "s/^pkgname=.*/pkgname=$pkgname/" "$pkgdir/usr/bin/$pkgname"
}
