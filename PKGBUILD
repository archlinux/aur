# Maintainer: Victor RH <blitzkriegfc@gmail.com>

pkgname=perimeter81-rpm
pkgver=10.0.4.947
pkgrel=1
pkgdesc='Perimeter81 VPN agent application (RPM-based build)'
arch=('x86_64')
url='https://support.perimeter81.com/docs/downloading-the-agent'
license=('custom:LICENSE')
depends=('systemd' 'netcat' 'wireguard-tools' 'networkmanager')
optdepends=('openssl: SSL/TLS support')
conflicts=('perimeter81')
install="${pkgname}.install"
options=(!strip)

source=("https://static.perimeter81.com/agents/linux/Perimeter81_${pkgver}.rpm"
        'perimeter81helper.service'
        'perimeter81-sudoers'
        'perimeter81-sleep'
        'perimeter81-nm-dispatcher'
        'LICENSE')


package() {
    # Extract RPM contents
    cd "${srcdir}"
    bsdtar -x -f "Perimeter81_${pkgver}.rpm" -C "${pkgdir}"

    # Install systemd service
    install -Dm644 "${srcdir}/perimeter81helper.service" \
        "${pkgdir}/usr/lib/systemd/system/perimeter81helper.service"

    # Install sudoers configuration
    install -Dm440 "${srcdir}/perimeter81-sudoers" \
        "${pkgdir}/etc/sudoers.d/perimeter81"

    # Install systemd-sleep hook
    install -Dm755 "${srcdir}/perimeter81-sleep" \
        "${pkgdir}/usr/lib/systemd/system-sleep/perimeter81"

    # Install NetworkManager dispatcher script
    install -Dm755 "${srcdir}/perimeter81-nm-dispatcher" \
        "${pkgdir}/etc/NetworkManager/dispatcher.d/50-perimeter81"

    # Install license
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create log directory
    install -d -m 0755 "${pkgdir}/var/log/perimeter81"

    # Create symlinks for daemon binaries in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Perimeter81/artifacts/daemon \
        "${pkgdir}/usr/bin/p81-helper-daemon"
    ln -s /opt/Perimeter81/artifacts/daemon-creator \
        "${pkgdir}/usr/bin/p81-helper-daemon-creator"
}
sha256sums=('b59596a48d2185d88cb96e0495e91cce4f8895448fd1b645257957ab89557084'
            '4c3e3e4a1aad73b42ab809aabb716ac6a425cd0b51357b926a139dcde7264453'
            '0eacb755870ce09037d2dc2d128398a68fc0e33d70428e0a45b11e3d5679d13e'
            'bcfd35efaf12d069e4595b28c7c3f8ed72569bfb4edc5b36e014bb2badb3ff41'
            '78e991bf388f96c29c576df747e9f596e05bcbd6059c1effba99eb9543dfb148'
            'c505b227d3f2222305800c16805f29b8da3bf841bf71df36674a695528bd0731')
