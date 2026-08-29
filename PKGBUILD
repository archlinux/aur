# Maintainer: Rotko Networks <noc@rotko.net>
# Upstream fork of https://github.com/wyattjoh/jmap-mcp (MIT)
pkgname=jmapper-mcp
pkgver=0.4.0
pkgrel=1
pkgdesc="mcp server for jmap email - read, send and handle attachments from claude code, cursor and other mcp clients"
arch=('any')
url="https://github.com/rotkonetworks/jmap-mcp"
license=('MIT')
depends=('deno')
replaces=('jmap-mcp')
provides=('jmap-mcp')
conflicts=('jmap-mcp')
install=jmapper-mcp.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c859b0fb39faba6b4052d0e419431c17ed92983ae02b0744cf0e7e2f2909811')

package() {
    cd "$srcdir/jmap-mcp-$pkgver"

    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r src "$pkgdir/usr/share/$pkgname/"
    install -Dm644 deno.json "$pkgdir/usr/share/$pkgname/deno.json"
    install -Dm644 deno.lock "$pkgdir/usr/share/$pkgname/deno.lock"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'WRAPPER'
#!/bin/sh
# --allow-read/--allow-write are required for attachments: reading local files
# to attach, and writing downloaded attachments to disk.
exec deno run --allow-env --allow-net --allow-read --allow-write \
    --config /usr/share/jmapper-mcp/deno.json \
    --lock /usr/share/jmapper-mcp/deno.lock \
    /usr/share/jmapper-mcp/src/mod.ts "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
