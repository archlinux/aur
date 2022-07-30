# Maintainer: Iván Gabaldón <contact|@|inetol.net>
# Contributor: Sonu Ishaq <sonuishaq67@gmail.com>

pkgname=deskreen
pkgver=2.0.3
pkgrel=1
pkgdesc='Turns any device with a web browser to a second screen for your computer'
arch=('x86_64')
url='https://github.com/pavlobu/deskreen'
license=('AGPL3')
depends=('gtk3' 'nss')
source=("$pkgname-$pkgver-$arch.deb::https://github.com/pavlobu/$pkgname/releases/download/v$pkgver/${pkgname}_${pkgver}_amd64.deb"
        "$pkgname.desktop")
sha256sums=('4ee7f5c144dc9934ceff2401803af11329255cb081db1a621b96bed90c38f627'
            'cef3f9f1f02f22c047e49bec91657af941e6c4b86a176b812648c3b0dc625aa5')

prepare() {
    tar xpf data.tar.xz ./opt/Deskreen/ --strip-components=2 -C "$srcdir"
    tar xpf data.tar.xz ./usr/share/icons/ --strip-components=3 -C "$srcdir"
    mv "$srcdir"/Deskreen "$srcdir"/$pkgname
}

package() {
    find "$srcdir"/icons/ -type d -exec chmod 755 {} +
    find "$srcdir"/$pkgname/locales/ -type d -exec chmod 755 {} +
    find "$srcdir"/$pkgname/resources/ -type d -exec chmod 755 {} +

    install -d "$pkgdir"/opt/$pkgname
    cp -r "$srcdir"/$pkgname/* "$pkgdir"/opt/$pkgname

    install -d "$pkgdir"/usr/bin
    ln -s "$pkgdir"/opt/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname

    install -d "$pkgdir"/usr/share/icons
    cp -r "$srcdir"/icons/hicolor "$pkgdir"/usr/share/icons/hicolor

    install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
