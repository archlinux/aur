# Maintainer: LightJunction <lightjunction@outlook.com>
pkgname=mimic-node-git
pkgver=r5.0a5406b
pkgrel=1
pkgdesc="A stealthy sing-box node manager with Reality protocol support"
arch=('any')
url="https://github.com/LIghtJUNction/Mimic-Node"
license=('GPL-3.0-or-later')
depends=('sing-box' 'jq' 'curl' 'openssl' 'kmod')
makedepends=('git')
provides=('mimic-node')
conflicts=('mimic-node')
install='mimic-node.install'
source=("git+https://github.com/LIghtJUNction/Mimic-Node.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/Mimic-Node"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/Mimic-Node"

    # Install configuration
    install -Dm644 "overlay/usr/share/mimic-node/default/config.json" "$pkgdir/usr/share/mimic-node/default/config.json"

    # Install systemd units
    install -Dm644 "overlay/etc/systemd/system/mimic-node.service" "$pkgdir/etc/systemd/system/mimic-node.service"
    install -Dm644 "overlay/etc/systemd/system/mimic-node.timer" "$pkgdir/etc/systemd/system/mimic-node.timer"
    install -Dm644 "overlay/etc/systemd/system/mimic-node.path" "$pkgdir/etc/systemd/system/mimic-node.path"
    install -Dm644 "overlay/etc/systemd/system/mimic-node-apply.service" "$pkgdir/etc/systemd/system/mimic-node-apply.service"
    install -Dm644 "overlay/etc/systemd/system/mimic-node-mount.service" "$pkgdir/etc/systemd/system/mimic-node-mount.service"

    # Install sing-box drop-in to enforce overlay dependency
    install -Dm644 "overlay/etc/systemd/system/sing-box.service.d/mimic-overlay.conf" "$pkgdir/etc/systemd/system/sing-box.service.d/mimic-overlay.conf"

    # Install executables
    install -Dm755 "overlay/usr/bin/mimictl.sh" "$pkgdir/usr/bin/mimictl"
    install -Dm755 "overlay/usr/bin/mimic-mount" "$pkgdir/usr/bin/mimic-mount"

    # Install shared data
    install -Dm644 "overlay/usr/share/mimic-node/sni.txt" "$pkgdir/usr/share/mimic-node/sni.txt"

    # Create state directory for overlayfs
    install -dm700 "$pkgdir/var/lib/mimic-node"

    # Install License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
