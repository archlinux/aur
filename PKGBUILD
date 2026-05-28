# Maintainer: thefangeddeity
pkgname=ele-messenger
pkgver=1.2.1
pkgrel=1
pkgdesc="Resilience-first household chat platform. Degrades gracefully from LAN to BLE when infrastructure fails."
arch=('any')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL3')
depends=('python' 'python-fastapi' 'python-uvicorn' 'python-websockets' 'python-aiosqlite' 'nginx')
optdepends=('tailscale: for Tailscale transport layer')
backup=('usr/lib/ele-messenger/config.json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/ele-messenger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('296c60a3b23b311ba8681a7c11e5c8e9ce7252bda2e7230ba0d2a3c0d5b37058')

package() {
    cd "$srcdir/ele-messenger-$pkgver/pkg"
    cp -r usr "$pkgdir/"
    cp -r var "$pkgdir/"
    cp -r etc "$pkgdir/"
    chmod 644 "$pkgdir/etc/systemd/system/ele-messenger.service"
    chmod 644 "$pkgdir/etc/nginx/sites-available/ele-messenger"
}

post_install() {
    useradd -r -s /sbin/nologin -d /usr/lib/ele-messenger ele-messenger 2>/dev/null || true
    mkdir -p /var/lib/ele-messenger
    chown ele-messenger:ele-messenger /var/lib/ele-messenger
    systemctl daemon-reload
    echo "==> Enable and start: systemctl enable --now ele-messenger"
    echo "==> Add nginx snippet: include /etc/nginx/sites-available/ele-messenger; in your server block"
    echo "==> Then: systemctl reload nginx"
}
