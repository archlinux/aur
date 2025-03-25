# Maintainer: Clément Foucher <cfoucher-pkg at outlook dot fr>
pkgname=geteduroam
pkgver=0.6
pkgrel=1
pkgdesc="Configure your Eduroam Wifi connection"
arch=('x86_64')
url="https://get.eduroam.org/"
license=('BSD-3-Clause')
depends=('gtk4>=4.06'
         'libadwaita>=1.1'
        )
optdepends=('libnotify: to be notified for certificate expiration')
makedepends=('go>=1.18'
             'make'
            )
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/$pkgname/linux-app/archive/$pkgver.tar.gz")
sha256sums=('6be5c61b64a347d3b15d5f1a60f09a46660ffbd98b93bb8ddd4b8dca12f9782f')
build() {
        mv "$srcdir/linux-app-$pkgver" "$srcdir/$pkgname-$pkgver"
        cd "$srcdir/$pkgname-$pkgver"
        make build-gui
        make build-notifcheck
}
package() {
        mkdir "$pkgdir/usr"

        mkdir "$pkgdir/usr/bin"
        cp "$srcdir/$pkgname-$pkgver/geteduroam-gui" "$pkgdir/usr/bin/"
        cp "$srcdir/$pkgname-$pkgver/geteduroam-notifcheck" "$pkgdir/usr/bin/"

        mkdir "$pkgdir/usr/lib"
        mkdir "$pkgdir/usr/lib/systemd"
        mkdir "$pkgdir/usr/lib/systemd/system"
        cp "$srcdir/$pkgname-$pkgver/systemd/user/geteduroam-notifs.service" "$pkgdir/usr/lib/systemd/system"
        cp "$srcdir/$pkgname-$pkgver/systemd/user/geteduroam-notifs.timer" "$pkgdir/usr/lib/systemd/system"

        mkdir "$pkgdir/usr/share"
        cp -r "$srcdir/$pkgname-$pkgver/cmd/geteduroam-gui/resources/share/applications" "$pkgdir/usr/share/"
        cp -r "$srcdir/$pkgname-$pkgver/cmd/geteduroam-gui/resources/share/icons" "$pkgdir/usr/share/"
}
