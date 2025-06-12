# Maintainer: Clément Foucher <cfoucher-pkg at outlook dot fr>
pkgname=geteduroam
pkgver=0.12
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
sha256sums=('25b367d30efa3bba0ca414ff29b80f7e49cf2fa5f252d1e47ee49e59e9db5ff8')
build() {
        mv "$srcdir/linux-app-$pkgver" "$srcdir/$pkgname-$pkgver"
        cd "$srcdir/$pkgname-$pkgver"

        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

        make build-gui
        make build-notifcheck
}
package() {
        mkdir "$pkgdir/usr"

        mkdir "$pkgdir/usr/bin"
        install "$srcdir/$pkgname-$pkgver/geteduroam-gui" "$pkgdir/usr/bin/"
        install "$srcdir/$pkgname-$pkgver/geteduroam-notifcheck" "$pkgdir/usr/bin/"

        mkdir "$pkgdir/usr/lib"
        mkdir "$pkgdir/usr/lib/systemd"
        mkdir "$pkgdir/usr/lib/systemd/system"
        cp "$srcdir/$pkgname-$pkgver/systemd/user/geteduroam/geteduroam-notifs.service" "$pkgdir/usr/lib/systemd/system"
        cp "$srcdir/$pkgname-$pkgver/systemd/user/geteduroam/geteduroam-notifs.timer" "$pkgdir/usr/lib/systemd/system"

        mkdir "$pkgdir/usr/share"
        mkdir "$pkgdir/usr/share/applications"
        cp "$srcdir/$pkgname-$pkgver/cmd/geteduroam-gui/resources/share/applications/app.eduroam.geteduroam.desktop" "$pkgdir/usr/share/applications"
        cp -r "$srcdir/$pkgname-$pkgver/cmd/geteduroam-gui/resources/share/icons" "$pkgdir/usr/share/"
}
