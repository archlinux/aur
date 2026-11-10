# john git@johne.lanlabs.org
pkgname=hermes-agent-hardening
pkgver=0.1.0
pkgrel=1
pkgdesc="System hardening for Hermes Agent instances"
arch=('any')
url="https://aur.archlinux.org/packages/hermes-agent-hardening"
license=('GPL-3.0-or-later')
depends=('hermes-agent' 'apparmor' 'sudo' 'python')
checkdepends=('shellcheck')
backup=(
    'etc/hermes-agent-hardening/default.conf'
)
install=${pkgname}.install
source=(
    'hermes-gateway@.service'
    '70-usermanager.conf'
    'hermes-dashboard@.service'
    'hermes-logs'
    'hermes-instance'
    'hermes-hardening-config'
    'hermes-agent-hardening.apparmor.tmpl'
    '95-hermes-update-instances.hook'
    'default.conf'
    'README.md'
)
sha256sums=('995e4c4b83839d2307155894cba8724121cde21fbe503ba56ba7902f108a217b'
            '5834b2c66d2229f6b6012cf73c3772817edad817e09d6086d1466835993902d3'
            'cd60f3270b2403d2967f36a5bac000c8a5d3a30365329c1cfdf029147e891363'
            'ad5325226cb7ce8f6d69ad73bd6a8c364e7698d79514640eac5ff84a1b1b9106'
            '622209c18ca6ffb81a2c9249957b0be6759dd75b2b563903e0a4a79bfbd57315'
            'ddb7fd9b062d5b59d36b4ce5d4980ac9bbb6acc2d786e04dfabb8997f04bf268'
            '2b68ee7af05729123efde3df40d737e4b679ad76726eb10e17b71b495e170097'
            '0e793147e5d3310a26e69f56fa75e05c44f6dc602c14e483298dc399c993d5b1'
            '2f99221f379bee648761f19f92e9ad565559f542a0c634bf2bcc0a06ad93de84'
            'fe9deb6d042a1fe2b4ffef378279cf096311373f046df9879d2f45b6493ce901')
options=('!debug' '!strip')

check() {
    bash -n hermes-instance
    bash -n hermes-logs
    shellcheck hermes-instance hermes-logs

    python -m py_compile hermes-hardening-config
    python hermes-hardening-config --check-config

    if command -v systemd-analyze &>/dev/null; then
        systemd-analyze verify 'hermes-gateway@.service' 2>/dev/null || \
            echo "WARNING: unit verify failed (expected in build chroot)"
        systemd-analyze verify 'hermes-dashboard@.service' 2>/dev/null || \
            echo "WARNING: unit verify failed (expected in build chroot)"
    fi
}

package() {
    # Template units to /usr/lib (package-owned, not site-specific)
    install -Dm644 'hermes-gateway@.service' \
        "$pkgdir/usr/lib/systemd/system/hermes-gateway@.service"
    install -Dm644 '70-usermanager.conf' \
        "$pkgdir/usr/lib/systemd/system/hermes-gateway@.service.d/70-usermanager.conf"
    install -Dm644 'hermes-dashboard@.service' \
        "$pkgdir/usr/lib/systemd/user/hermes-dashboard@.service"

    # Log helper
    install -Dm755 hermes-logs \
        "$pkgdir/usr/bin/hermes-logs"

    # Instance management
    install -Dm755 hermes-instance \
        "$pkgdir/usr/bin/hermes-instance"
    install -Dm755 hermes-hardening-config \
        "$pkgdir/usr/share/hermes-agent-hardening/hermes-hardening-config"
    install -Dm644 'hermes-agent-hardening.apparmor.tmpl' \
        "$pkgdir/usr/share/hermes-agent-hardening/hermes-agent-hardening.apparmor.tmpl"

    # Pacman hook
    install -Dm644 95-hermes-update-instances.hook \
        "$pkgdir/usr/share/libalpm/hooks/95-hermes-update-instances.hook"

    # Default config (preserved on upgrade via backup=())
    install -Dm644 default.conf \
        "$pkgdir/etc/hermes-agent-hardening/default.conf"

    install -Dm644 README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"
}
