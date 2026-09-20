# Maintainer: chenpi11 <chenpi11@users.noreply.github.com>
pkgname=sub-store-git
pkgver=2.39.9.r0.g0000000
pkgrel=1
pkgdesc='Advanced Subscription Manager for QX, Loon, Surge, Stash, Egern and Shadowrocket (git)'
arch=('any')
url='https://github.com/sub-store-org/Sub-Store'
license=('AGPL-3.0-only')
depends=('nodejs>=24.15.0')
makedepends=('git' 'pnpm')
provides=('sub-store')
conflicts=('sub-store' 'sub-store-bin')
source=('git+https://github.com/sub-store-org/Sub-Store.git'
        'sub-store@.service'
        'sub-store.sysusers'
        'sub-store.tmpfiles')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd Sub-Store
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd Sub-Store/backend
    pnpm install --frozen-lockfile
}

build() {
    cd Sub-Store/backend
    pnpm bundle:esbuild
}

package() {
    # Install application files
    install -Dm644 "$srcdir/Sub-Store/backend/dist/sub-store.bundle.js" \
        "$pkgdir/usr/share/sub-store/sub-store.bundle.js"
    install -Dm644 "$srcdir/Sub-Store/backend/dist/cron-sync-artifacts.min.js" \
        "$pkgdir/usr/share/sub-store/cron-sync-artifacts.min.js"
    install -Dm644 "$srcdir/Sub-Store/backend/dist/runtime-manifest.json" \
        "$pkgdir/usr/share/sub-store/runtime-manifest.json"
    install -Dm644 "$srcdir/Sub-Store/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install wrapper script
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/sub-store" <<'EOF'
#!/bin/sh
exec node /usr/share/sub-store/sub-store.bundle.js "$@"
EOF

    # Install systemd service
    install -Dm644 "$srcdir/sub-store@.service" \
        "$pkgdir/usr/lib/systemd/system/sub-store@.service"

    # Install sysusers/tmpfiles
    install -Dm644 "$srcdir/sub-store.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/sub-store.conf"
    install -Dm644 "$srcdir/sub-store.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/sub-store.conf"
}

post_install() {
    echo '==> Sub-Store (git) has been installed!'
    echo '==> To start the service (default port 9999):'
    echo '      systemctl enable --now sub-store@9999.service'
    echo '==> To use a different port:'
    echo '      systemctl enable --now sub-store@<PORT>.service'
    echo '==> Web UI: https://sub-store.vercel.app'
}
