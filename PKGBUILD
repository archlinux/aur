# Maintainer: szern <szern@aporianet.com>
pkgname=panafanpwr
pkgver=0.2.1
pkgrel=1
pkgdesc="Panasonic CF-series laptop power and fan control"
arch=('x86_64')
url="https://sr.ht/~szern/panafanpwr/"
license=('GPL-3.0-or-later')
depends=('python' 'power-profiles-daemon' 'acpi_call')
install=panafanpwr.install
backup=('etc/panafanpwrd.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~szern/panafanpwr/archive/v${pkgver}.tar.gz")
sha256sums=('81ac71edabf2c8c94c50cce348c5601c7226af4857b025846c2476749496963b')

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
