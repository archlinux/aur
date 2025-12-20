# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
pkgname=fake-battery-nut-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="Kernel module to expose NUT UPS data as Linux power_supply devices for btop/KDE"
arch=('x86_64')
url="https://github.com/aaronsb/fake-battery-nut"
license=('GPL2')
depends=('dkms' 'nut' 'bc')
makedepends=('linux-headers')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aaronsb/fake-battery-nut/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

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

post_install() {
    dkms install fake-battery-nut/${pkgver}
    echo ""
    echo ">>> Configure your UPS in /usr/lib/systemd/system/fake-battery-nut.service"
    echo ">>> Then: systemctl enable --now fake-battery-nut"
}

post_upgrade() {
    dkms remove fake-battery-nut --all 2>/dev/null || true
    dkms install fake-battery-nut/${pkgver}
}

pre_remove() {
    systemctl stop fake-battery-nut 2>/dev/null || true
    systemctl disable fake-battery-nut 2>/dev/null || true
    rmmod fake_battery_nut 2>/dev/null || true
    dkms remove fake-battery-nut --all 2>/dev/null || true
}
