# Maintainer: ddmoney420 <your-email@example.com>

pkgname=torrent-vpn-stack
pkgver=1.0.0
pkgrel=1
pkgdesc="Cross-platform Docker Compose stack for secure torrenting via VPN"
arch=('any')
url="https://github.com/ddmoney420/torrent-vpn-stack"
license=('MIT')
depends=('docker' 'docker-compose' 'bash')
optdepends=(
    'systemd: for automated backup service'
    'cronie: alternative for automated backups'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ddmoney420/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('efb998c1b2be0fba8f4a01341606e352376e4ac7fb603a14c62db33e017734fc')
install="${pkgname}.install"
backup=('.env')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install main application to /usr/share
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r * "${pkgdir}/usr/share/${pkgname}/"

    # Make scripts executable
    chmod +x "${pkgdir}/usr/share/${pkgname}/scripts"/*.sh

    # Create symlinks to /usr/bin for easy access
    install -dm755 "${pkgdir}/usr/bin"

    # Core utility scripts
    ln -s "/usr/share/${pkgname}/scripts/setup.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-setup"

    ln -s "/usr/share/${pkgname}/scripts/verify-vpn.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-verify"

    ln -s "/usr/share/${pkgname}/scripts/check-leaks.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-check-leaks"

    ln -s "/usr/share/${pkgname}/scripts/backup.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-backup"

    ln -s "/usr/share/${pkgname}/scripts/restore.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-restore"

    ln -s "/usr/share/${pkgname}/scripts/benchmark-vpn.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-benchmark"

    # Linux-specific automation scripts
    ln -s "/usr/share/${pkgname}/scripts/setup-backup-automation-linux.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-setup-automation"

    ln -s "/usr/share/${pkgname}/scripts/remove-backup-automation-linux.sh" \
        "${pkgdir}/usr/bin/torrent-vpn-remove-automation"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install docs directory
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"

    # Install example configuration
    install -Dm644 .env.example "${pkgdir}/usr/share/${pkgname}/.env.example"
}

# vim:set ts=4 sw=4 et:
