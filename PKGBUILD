# Maintainer: WgpArch <wgparch@riseup.net>
pkgname=aur-security-dashboard
pkgver=1.3.0
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
    
    # Install main executable (wrapper script)
    install -Dm755 main.py "$pkgdir/usr/bin/aur-security-dashboard"
    
    # Install Python module dependencies alongside the executable
    install -Dm644 sarif_output.py "$pkgdir/usr/bin/sarif_output.py"
    install -Dm644 detection_catalog.toml "$pkgdir/usr/bin/detection_catalog.toml"
    
    # Install Rust scanner shared library if it exists in source
    if [ -f libaur_scan.so ]; then
        install -Dm755 libaur_scan.so "$pkgdir/usr/bin/libaur_scan.so"
    fi
    
    # Install desktop file
    install -Dm644 aur-security-dashboard.desktop "$pkgdir/usr/share/applications/aur-security-dashboard.desktop"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/" 2>/dev/null || true
}
