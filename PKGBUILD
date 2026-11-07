# Maintainer: chenpi11 <chenpi11@users.noreply.github.com>
pkgname=sub-store-bin
pkgver=2.44.5
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
sha256sums=('3678e4e23e8ede2c2e69a915662e123c7d1b0c465a6966f2355e0a2d1116ae0a'
            '0b6781c3b4d2ae7e621ed40db932ae86914e938e95e561dec9b7481df921ffac'
            '5d029abc62150c0c58ddcb214a8b437dfaf676974e684df0e91ab935e4b4c688'
            '08e3bf9a0da8b80a8ca22489937661f31d3f851cd37a27033645bb05bbe4da90'
            '24bf74a3cb7dd51a276ef3a15fa7b7f9c496ddf508a19f6ab9f6c5ccd6fb53f3'
            '470300fa62318ce4bdde7e5a22028aa961c00fddc7b4bf016ca0ee3c604b1fb6'
            '39fec0d9af5bbbee19f7e519e79429d892189d54ac46411fb9b5ab09580240ae')

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
