# Maintainer: szern <szern@aporianet.com>
pkgname=panafanpwr
pkgver=0.3
pkgrel=1
pkgdesc="Panasonic CF-series laptop power and fan control"
arch=('x86_64')
url="https://sr.ht/~szern/panafanpwr/"
license=('GPL-3.0-or-later')
depends=('python' 'python-jeepney' 'power-profiles-daemon' 'acpi_call')
install=panafanpwr.install
backup=('etc/panafanpwrd.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~szern/panafanpwr/archive/v${pkgver}.tar.gz")
sha256sums=('b2d4d025a301f72bc1bc32073238f7e1d386df76c72f60b8d624d31734a4cccc')

package() {
    cd "panafanpwr-v${pkgver}"

    install -Dm755 src/panafanpwrd.py "$pkgdir/usr/bin/panafanpwrd"
    install -Dm755 src/panafanpwr.py  "$pkgdir/usr/bin/panafanpwr"
    sed -i "s/__version__ = \"unknown\"/__version__ = \"${pkgver}\"/" \
        "$pkgdir/usr/bin/panafanpwrd" \
        "$pkgdir/usr/bin/panafanpwr"

    install -Dm644 <(sed 's|@PREFIX@|/usr|g' systemd/panafanpwrd-ppd.service)    "$pkgdir/usr/lib/systemd/system/panafanpwrd-ppd.service"
    install -Dm644 <(sed 's|@PREFIX@|/usr|g' systemd/panafanpwrd.socket)         "$pkgdir/usr/lib/systemd/system/panafanpwrd.socket"
    install -Dm644 <(sed 's|@PREFIX@|/usr|g' systemd/panafanpwrd-resume.service) "$pkgdir/usr/lib/systemd/system/panafanpwrd-resume.service"

    install -Dm644 conf/panafanpwrd.conf "$pkgdir/etc/panafanpwrd.conf"
}
