pkgname=qcontrol
pkgver=0.5.5
pkgrel=1
pkgdesc="Embedded NAS peripheral controller"
arch=('any')
url="https://www.hellion.org.uk/qcontrol/"
license=("GPLv3")
depends=("lua51")
source=("https://www.hellion.org.uk/qcontrol/releases/$pkgver/$pkgname-$pkgver.tar.gz"
        "patch"
        "99-platform-gpio-keys-event.rules")
sha1sums=('abed07a8eac2f04dacfb86d5149309786936ad7a'
          '56a449422dccd0564e1534d7e795079838e79f5e'
          '25a4c14bf4bff9be3bb75c8a5edf8446cf13525f')
validpgpkeys=('37BE0111')
install="$pkgname.install"
prepare() {
    cd "$pkgname-$pkgver"
    msg "Patching..."
    patch -s -p1 < "${startdir}/patch"
    msg "Done"
}
build() {
    cd "$pkgname-$pkgver"
    msg "Starting make..."
    make
    msg "Done"
}
package() {
    cd "$pkgname-$pkgver"
    install -D -m 755 qcontrol "${pkgdir}/usr/bin/qcontrol"
    install -D -m 644 examples/* -t "${pkgdir}/etc/qcontrol.d"
    install -D -m 644 systemd/* -t "${pkgdir}/usr/lib/systemd/system/"
    install -D -m 644 $srcdir/99-platform-gpio-keys-event.rules -t "${pkgdir}/etc/udev/rules.d"
    ln -s "/etc/qcontrol.d/ts219.lua" "${pkgdir}/etc/qcontrol.conf"
}

