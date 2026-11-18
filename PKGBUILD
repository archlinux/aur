# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=obsidian-anysocket-sync-server
pkgver=1.6.1
pkgrel=1
pkgdesc='Self-hosted server that securely syncs Obsidian vaults with the AnySocket Sync plugin'
arch=('any')
url='https://github.com/lynxaegon/obsidian-anysocket-sync-server'
license=('MIT')
depends=('nodejs>=20')
makedepends=('npm')
backup=('etc/obsidian-anysocket-sync-server/config.js')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'obsidian-anysocket-sync.sh'
        'obsidian-anysocket-sync-server.service'
        'obsidian-anysocket-sync-server.sysusers'
        'obsidian-anysocket-sync-server.tmpfiles')
sha256sums=('d6af00670189e25aa06a9cd7ad23fc6364303f218053fa3ee20f9fec75f99a44'
            '901175a8abe3f85a4a36ba01be7b3e5cfa14946c847b21c3f344115152a88ffd'
            '78eec9519ddb28bb8ec4c30384a53cc0cead940dd344a7d75b1ace7aef7c0b40'
            '62e609b062c1216e88d0d574ce75bcea24e6379de550a16d17b03e67f5f5d52f'
            '1557a32acf7c01ce256b65b2002f14d5cee536eb5e03fe55b8ed33093193d259')

build() {
    cd "$pkgname-$pkgver"
    # Upstream ships no lockfile; production dependencies only.
    npm install --omit=dev --no-audit --no-fund --cache "$srcdir/npm-cache"
}

package() {
    cd "$pkgname-$pkgver"
    local _app="$pkgdir/usr/lib/$pkgname"
    install -d "$_app"
    # The server reads package.json and client/ (plugin updates served to devices) from
    # its own directory and writes only to ANYSOCKET_SYNC_DATA.
    cp -r --no-preserve=ownership index.js cli.js libs client package.json config.example.js node_modules "$_app/"

    # The server refuses to start until the example password in this file is changed.
    install -Dm644 config.example.js "$pkgdir/etc/$pkgname/config.js"

    install -Dm755 "$srcdir/obsidian-anysocket-sync.sh" "$pkgdir/usr/bin/obsidian-anysocket-sync"
    install -Dm644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
