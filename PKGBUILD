# Maintainer: kstation_orbit <klick3r-aur at pm dot me>
pkgname=sshfs-mountctl
pkgver=1.1.2
pkgrel=1
pkgdesc="Terminal UI for managing persistent SSHFS mounts backed by systemd --user"
arch=('any')
url="https://github.com/Klick3r-1/sshfs-manager"
license=('MIT')
depends=('python' 'python-textual' 'sshfs' 'fuse3')
install=sshfs-mountctl.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Klick3r-1/sshfs-manager/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8d8e198d347f10aa835bae3e6ed1e730f58119716c6c75f14a1c9abbf0fc2f1c')

package() {
    cd "sshfs-manager-$pkgver"

    # Python package
    install -dm755 "$pkgdir/usr/lib/sshfs-mountctl"
    cp -r sshfs_mountctl "$pkgdir/usr/lib/sshfs-mountctl/"
    find "$pkgdir/usr/lib/sshfs-mountctl" -name '__pycache__' -exec rm -rf {} + 2>/dev/null || true

    # Watchdog script
    install -Dm755 sshfs-watchdog.sh "$pkgdir/usr/lib/sshfs-mountctl/sshfs-watchdog.sh"

    # Launcher
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/sshfs-mountctl" <<'EOF'
#!/usr/bin/env python3
import sys
sys.path.insert(0, "/usr/lib/sshfs-mountctl")
from sshfs_mountctl.__main__ import main
main()
EOF

    # Systemd user unit template (system-wide, available to all users)
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/lib/systemd/user/sshfs-watchdog@.service" <<'EOF'
[Unit]
Description=SSHFS watchdog mount for %i
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/lib/sshfs-mountctl/sshfs-watchdog.sh %h/.config/sshfs-mounts/%i.conf
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
EOF

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
