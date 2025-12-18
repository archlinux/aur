# Maintainer: Amir Ali <your-email@example.com>
pkgname=arch-volume-osd
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight on-screen display for volume changes on Arch Linux"
arch=('any')
url="https://github.com/monjar/arch-volume-osd"
license=('MIT')
depends=('bash' 'libnotify' 'pipewire-pulse')
optdepends=('wireplumber: for wpctl support (recommended)')
install=arch-volume-osd.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/monjar/arch-volume-osd/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Update this after creating the release

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the main script
    install -Dm755 bin/volume-osd "$pkgdir/usr/bin/volume-osd"
    
    # Install systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/volume-osd.service" << EOF
[Unit]
Description=Volume OSD - On-screen display for volume changes
Documentation=https://github.com/monjar/arch-volume-osd
After=graphical-session.target pipewire.service pipewire-pulse.service
Wants=pipewire-pulse.service

[Service]
Type=simple
ExecStart=/usr/bin/volume-osd
Restart=on-failure
RestartSec=3
StandardOutput=null
StandardError=null

[Install]
WantedBy=default.target
EOF
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
