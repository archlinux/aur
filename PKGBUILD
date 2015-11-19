# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=simplicitystudio
pkgver=3.2
pkgrel=1
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(i686 x86_64)
url='https://www.silabs.com/products/mcu/Pages/simplicity-studio.aspx'
license=('unknown')

# should probably put something here but most dependencies are included
depends=()

options=('!strip')

source=(http://www.silabs.com/Support%20Documents/Software/SimplicityStudio.tgz
        simplicitystudio.patch
        simplicitystudio)
md5sums=('e5881c26d731343d11a1346968c5eb6b'
         '8c316447fd415b6e3a87d8007ef7b9f7'
         '1265c0dc95aeb697be38eea0ed1cdbc9')

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
