# Maintainer: Jacek Szafarkiewicz <szafar@linux.pl>

pkgname=displaylink-connect
pkgver=3.0.1
pkgrel=1
pkgdesc='Automatically set monitors when Displaylink dock is connected'
arch=('x86_64')
license=('MIT')
url='https://gitlab.com/hadogenes/displaylink-connect'
depends=('displaylink')
source=("https://gitlab.com/hadogenes/displaylink-connect/-/archive/v${pkgver}/displaylink-connect-v${pkgver}.zip")
sha256sums=('7775276c0a913131c3200d605f75e99556c562446ea43152e840e91d25485f7c')

prepare() {
    cd "$srcdir/${pkgname}-v${pkgver}"

    sed "s;@SCRIPT_DIR@;/usr/lib/${pkgname};" systemd/system/displaylink.service.d/displaylink-connect.conf.in > systemd/system/displaylink.service.d/displaylink-connect.conf
    sed "s;@SCRIPT_DIR@;/usr/lib/${pkgname};" systemd/user/displaylink-connect.service.in > systemd/user/displaylink-connect.service
}

package() {
    cd "$srcdir/${pkgname}-v${pkgver}"
    
    install -Dm755 displaylink_connect.sh "$pkgdir/usr/lib/${pkgname}/displaylink_connect.sh"
    install -Dm755 run_as_user_with_display.sh "$pkgdir/usr/lib/${pkgname}/run_as_user_with_display.sh"

    install -Dm644 systemd/system/displaylink.service.d/displaylink-connect.conf "$pkgdir/usr/lib/systemd/system/displaylink.service.d/displaylink-connect.conf"
    install -Dm644 systemd/user/displaylink-connect.service "$pkgdir/usr/lib/systemd/user/displaylink-connect.service"
    install -Dm644 displaylink-connect.desktop "$pkgdir/etc/xdg/autostart/displaylink-connect.desktop"
    mkdir -p "$pkgdir/usr/lib/systemd/user/default.target.wants"
    ln -s /usr/lib/systemd/user/displaylink-connect.service "$pkgdir/usr/lib/systemd/user/default.target.wants/displaylink-connect.service"
}
