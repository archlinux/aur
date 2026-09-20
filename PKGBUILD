# Maintainer: chenpi11 <chenpi11@users.noreply.github.com>
pkgname=sub-store-bin
pkgver=2.39.9
pkgrel=1
pkgdesc='Advanced Subscription Manager for QX, Loon, Surge, Stash, Egern and Shadowrocket'
arch=('any')
url='https://github.com/sub-store-org/Sub-Store'
license=('AGPL-3.0-only')
depends=('nodejs>=24.15.0')
makedepends=()
provides=('sub-store')
conflicts=('sub-store' 'sub-store-git')
source=("$url/releases/download/$pkgver/sub-store.bundle.js"
        "$url/releases/download/$pkgver/cron-sync-artifacts.min.js"
        "$url/releases/download/$pkgver/runtime-manifest.json"
        "$url/raw/$pkgver/LICENSE"
        'sub-store@.service'
        'sub-store.sysusers'
        'sub-store.tmpfiles')
sha256sums=('80d3802ec0494cf942a8b156ba8b1643d566a00b5c2686f86efaccd80ffc67ee'
            '72aa8870a5d92e352f1deccc6a00c83162beb39b7bb6960aa3b293040aace939'
            '975e3b64c76c7dcaa03c0ecf3907e94b9a525d8a66ddea56902cd0b64841bb1d'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    # Install application files
    install -Dm644 "$srcdir/sub-store.bundle.js" "$pkgdir/usr/share/sub-store/sub-store.bundle.js"
    install -Dm644 "$srcdir/cron-sync-artifacts.min.js" "$pkgdir/usr/share/sub-store/cron-sync-artifacts.min.js"
    install -Dm644 "$srcdir/runtime-manifest.json" "$pkgdir/usr/share/sub-store/runtime-manifest.json"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/sub-store" <<'EOF'
#!/bin/sh
exec node /usr/share/sub-store/sub-store.bundle.js "$@"
EOF

    # Install systemd service
    install -Dm644 "$srcdir/sub-store@.service" "$pkgdir/usr/lib/systemd/system/sub-store@.service"

    # Install sysusers/tmpfiles
    install -Dm644 "$srcdir/sub-store.sysusers" "$pkgdir/usr/lib/sysusers.d/sub-store.conf"
    install -Dm644 "$srcdir/sub-store.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/sub-store.conf"
}

post_install() {
    echo '==> Sub-Store has been installed!'
    echo '==> To start the service (default port 9999):'
    echo '      systemctl enable --now sub-store@9999.service'
    echo '==> To use a different port:'
    echo '      systemctl enable --now sub-store@<PORT>.service'
    echo '==> Web UI: https://sub-store.vercel.app'
}
