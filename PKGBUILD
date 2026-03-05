# Maintainer: Jaeger <https://github.com/Jaeger0000>
pkgname=casper-keyboard-rgb
pkgver=1.0.1
pkgrel=1
pkgdesc="Casper Excalibur Klavye RGB LED Kontrol Aracı (GUI + CLI)"
arch=('x86_64')
url="https://github.com/Jaeger0000/casper_excalibur_keyboard_rgb_linux"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'polkit'
    'dkms'
    'linux-headers'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('861b81b1734a392beb5505085e817fea05c2e3de2c91d539a65100f4065139f6')
install="${pkgname}.install"

_srcdir="casper_excalibur_keyboard_rgb_linux-${pkgver}"

build() {
    cd "${srcdir}/${_srcdir}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_srcdir}"

    # ── Python package ───────────────────────────────────────
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # ── Helper script (root-owned, 0755) ─────────────────────
    install -Dm755 data/led-write-helper \
        "${pkgdir}/usr/lib/${pkgname}/led-write-helper"

    # ── Polkit policy ────────────────────────────────────────
    install -Dm644 data/org.casper.keyboard.rgb.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.casper.keyboard.rgb.policy"

    # ── Udev rule (grants user write access to LED control) ──
    install -Dm644 data/99-casper-kbd-backlight.rules \
        "${pkgdir}/usr/lib/udev/rules.d/99-casper-kbd-backlight.rules"

    # ── Desktop file ─────────────────────────────────────────
    install -Dm644 data/casper-keyboard-rgb.desktop \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # ── Systemd service ──────────────────────────────────────
    install -Dm644 systemd/casper-keyboard-rgb-restore.service \
        "${pkgdir}/usr/lib/systemd/system/${pkgname}-restore.service"

    # ── License ──────────────────────────────────────────────
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # ── DKMS: casper-wmi kernel module ───────────────────────
    local _dkmsdir="${pkgdir}/usr/src/casper-wmi-1.0.0"
    install -Dm644 driver/casper-wmi.c "${_dkmsdir}/casper-wmi.c"
    install -Dm644 driver/Makefile     "${_dkmsdir}/Makefile"
    install -Dm644 driver/dkms.conf    "${_dkmsdir}/dkms.conf"

    # ── Auto-load module on boot ─────────────────────────────
    install -Dm644 /dev/stdin \
        "${pkgdir}/usr/lib/modules-load.d/casper-wmi.conf" <<< "casper-wmi"
}
