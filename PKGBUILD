# Maintainer: thefangeddeity
pkgname=ele-messenger
pkgver=1.2.2
pkgrel=1
pkgdesc="Resilience-first household chat platform. Degrades gracefully from LAN to BLE when infrastructure fails."
arch=('any')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL3')
depends=('python' 'python-fastapi' 'uvicorn' 'python-websockets' 'python-aiosqlite' 'nginx')
optdepends=('tailscale: for Tailscale transport layer')
backup=('usr/lib/ele-messenger/config.json')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thefangeddeity/ele-messenger/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f52996e20154e8ab7fd2dc0e5dbf301e41612047747f79e1e01bdcb5060adc2')

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
