# Maintainer: Clément Foucher <cfoucher-pkg at outlook dot fr>
pkgname=geteduroam
pkgver=0.5
pkgrel=2
pkgdesc="Configure your Eduroam Wifi connection"
arch=('x86_64')
url="https://get.eduroam.org/"
license=('BSD-3-Clause')
depends=('gtk4' 'libadwaita')
optdepends=('libnotify: to be notified for certificate expiration')
makedepends=('go' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/$pkgname/linux-app/archive/$pkgver.tar.gz")
sha256sums=('0a09be384f5888e890510695c786a34e1726e5ac1e7f7714b484e2b5fe893e85')
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
