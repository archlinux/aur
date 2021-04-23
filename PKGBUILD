# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.1.2
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
install=displaylink-connect.install
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('106d1333d23c320567ab4519b5a0d02907d4c5a0bcb156cc960511c64069d9c8')

prepare() {
    cd "$srcdir/${pkgname}-v${pkgver}"

    sed "s;@SCRIPT_DIR@;/usr/bin;" systemd/system/displaylink.service.d/displaylink-connect.conf.in > systemd/system/displaylink.service.d/displaylink-connect.conf
    sed "s;@SCRIPT_DIR@;/usr/bin;" systemd/user/displaylink-connect.service.in > systemd/user/displaylink-connect.service
}

package() {
    cd "$srcdir/${pkgname}-v${pkgver}"
    
    install -Dm755 displaylink_connect "$pkgdir/usr/bin/displaylink_connect"
    install -Dm755 run_as_user_with_display "$pkgdir/usr/bin/run_as_user_with_display"

    install -Dm644 systemd/system/displaylink.service.d/displaylink-connect.conf "$pkgdir/usr/lib/systemd/system/displaylink.service.d/displaylink-connect.conf"
    install -Dm644 systemd/user/displaylink-connect.service "$pkgdir/usr/lib/systemd/user/displaylink-connect.service"
    install -Dm644 displaylink-connect.desktop "$pkgdir/etc/xdg/autostart/displaylink-connect.desktop"
}
