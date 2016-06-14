# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=simplicitystudio
pkgver=3.3
pkgrel=1
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(i686 x86_64)
url='https://www.silabs.com/products/mcu/Pages/simplicity-studio.aspx'
license=('unknown')

# should probably put something here but most dependencies are included
depends_i686=(gtk2 libxtst)
depends_x86_64=(lib32-gtk2 lib32-libxtst)

options=('!strip')

source=(http://www.silabs.com/Support%20Documents/Software/SimplicityStudio.tgz
        simplicitystudio.patch
        simplicitystudio)
sha256sums=('aec95fd1078c36b5d61cb6a21f7decda703df3c73d3c5fa30d47305d1fe4ebe1'
            '22dadf833916b51d85a04d50db595cb8446c9a9c1644e9dfab8e0875d8f9f906'
            'ad55e8352d5d3d9cba50553086ca6d8b1d5072dc87b2763a79f34210f7bc2b5d')

prepare() {
    cd "$srcdir/SimplicityStudio_v3"
    patch -p1 -i "$srcdir/simplicitystudio.patch"
}

package() {
    install -dm755 "$pkgdir/opt/"
    install -dm755 "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/etc/udev/rules.d"

    cp -a "$srcdir/SimplicityStudio_v3" "$pkgdir/opt/$pkgname"

    DESTDIR="$pkgdir" "$pkgdir/opt/$pkgname/setup.sh"

    # installation directory has to be writable
    find "$pkgdir/opt/$pkgname" -type d -exec chmod a+w {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod a+w {} +

    install -Dm755 "$srcdir/simplicitystudio" "$pkgdir/usr/bin/$pkgname"
    sed -i "s/^pkgname=.*/pkgname=$pkgname/" "$pkgdir/usr/bin/$pkgname"
}
