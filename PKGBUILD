# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=fake-battery-nut-dkms
pkgver=1.2.0
pkgrel=1
pkgdesc="Bridge NUT UPS data to UPower/desktop - makes any UPS look like a laptop battery"
arch=('x86_64')
url="https://github.com/aaronsb/fake-battery-nut"
license=('GPL2')
depends=('dkms' 'nut' 'bc')
makedepends=('linux-headers')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aaronsb/fake-battery-nut/archive/v${pkgver}.tar.gz")
sha256sums=('30545667d6f1de043d907fe3db533f04b14f50960fba6048d0c194ade4fdf747')

package() {
    cd "$srcdir/fake-battery-nut-${pkgver}"

    # DKMS source
    install -Dm644 fake_battery_nut.c "${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}/fake_battery_nut.c"
    install -Dm644 Makefile "${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}/Makefile"
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}/dkms.conf"

    # Daemon script
    install -Dm755 nut-to-fakebattery.sh "${pkgdir}/usr/bin/nut-to-fakebattery"

    # Systemd service
    install -Dm644 fake-battery-nut.service "${pkgdir}/usr/lib/systemd/system/fake-battery-nut.service"

    # Module autoload
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/modules-load.d/fake-battery-nut.conf" <<< "fake_battery_nut"

    # Udev rule for device permissions
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/99-fake-battery-nut.rules" <<< 'KERNEL=="fake_battery_nut", MODE="0666"'
}
