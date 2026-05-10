# Maintainer: Your Name <your.email@example.com>

pkgname=omen-rgb-keyboard-dkms-git
_pkgbase=omen-rgb-keyboard
pkgver=1.4.r57.g3813bb4
pkgrel=1
pkgdesc='Linux kernel driver for HP OMEN laptop RGB keyboard lighting (DKMS)'
arch=('x86_64')
url='https://github.com/OmenLinux/omen-rgb-keyboard'
license=('GPL-3.0-only')
depends=('dkms')
makedepends=('git')
optdepends=(
    'alsa-lib: mute button LED sync via ALSA'
    'wireplumber: mute LED sync for PipeWire/Bluetooth audio'
)
provides=("${_pkgbase}-dkms")
conflicts=("${_pkgbase}-dkms" "${_pkgbase}")
source=(
    "${_pkgbase}::git+${url}.git"
    'omen-rgb-keyboard.conf'
    'omen-mute-monitor.service'
)
sha256sums=('SKIP'
            '42de1ab0f8123aedad347225c665e3108cc9035da3dfaf3c9fbf9bbcb6335b8c'
            '858c75ea954f023940dcbe6db75b7bc6d9450721ab3f7a8f3ea8ca1a7aa09c0c')

pkgver() {
    cd "${_pkgbase}"
    local ver
    ver=$(sed -n 's/^PACKAGE_VERSION=//p' dkms.conf)
    printf '%s.r%s.g%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgbase}"

    # DKMS source
    local dkms_dir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -Dm644 dkms.conf "${dkms_dir}/dkms.conf"
    sed -i "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=${pkgver}/" "${dkms_dir}/dkms.conf"
    cp -r src "${dkms_dir}/"

    # Udev rules for non-root access
    install -Dm644 99-omen-rgb-keyboard.rules \
        "${pkgdir}/usr/lib/udev/rules.d/99-omen-rgb-keyboard.rules"

    # Blacklist hp_wmi to avoid WMI conflicts
    install -Dm644 hp_wmi-blacklist.conf \
        "${pkgdir}/usr/lib/modprobe.d/hp_wmi-blacklist.conf"

    # Auto-load module on boot
    install -Dm644 "${srcdir}/omen-rgb-keyboard.conf" \
        "${pkgdir}/usr/lib/modules-load.d/${_pkgbase}.conf"

    # Mute monitor script and systemd user service
    install -Dm755 scripts/omen-mute-monitor.sh \
        "${pkgdir}/usr/bin/omen-mute-monitor"
    install -Dm644 "${srcdir}/omen-mute-monitor.service" \
        "${pkgdir}/usr/lib/systemd/user/omen-mute-monitor.service"

    # State directory for persistent settings
    install -dm755 "${pkgdir}/var/lib/${_pkgbase}"
}
