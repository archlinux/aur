# Maintainer: WgpArch <wgparch@riseup.net>
pkgname=aur-security-dashboard
pkgver=1.3.8
pkgrel=1
pkgdesc="A forensic-grade, local SIEM dashboard for Arch Linux to monitor system integrity, audit AUR packages, and hunt anomalies."
arch=('any')
url="https://github.com/WgpArch/aur-security-dashboard"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk4')
makedepends=('git')
source=("git+https://github.com/WgpArch/aur-security-dashboard.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    # Install main executable
    install -Dm755 main.py "$pkgdir/usr/bin/aur-security-dashboard"

    # Install Python module dependencies
    install -Dm644 sarif_output.py "$pkgdir/usr/bin/sarif_output.py"
    install -Dm644 pam_bait_ui.py "$pkgdir/usr/bin/pam_bait_ui.py"
    install -Dm644 detection_catalog.toml "$pkgdir/usr/bin/detection_catalog.toml"

    # Install Rust scanner if present
    if [ -f libaur_scan.so ]; then
        install -Dm755 libaur_scan.so "$pkgdir/usr/bin/libaur_scan.so"
    fi

    # Install PAM Bait daemon and config
    install -Dm755 pam-bait/daemon/pam_bait_daemon.py "$pkgdir/usr/lib/pam-bait/pam_bait_daemon.py"
    install -Dm644 pam-bait/config/pam-bait-svc "$pkgdir/etc/pam.d/pam-bait-svc"
    install -Dm644 pam-bait/config/pam-bait.service "$pkgdir/usr/lib/systemd/system/pam-bait.service"

    # Install desktop file
    install -Dm644 aur-security-dashboard.desktop "$pkgdir/usr/share/applications/aur-security-dashboard.desktop"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install documentation
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true
}
