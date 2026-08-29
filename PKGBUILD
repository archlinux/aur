# Maintainer: Rotko Networks <noc@rotko.net>
# Upstream fork of https://github.com/wyattjoh/jmap-mcp (MIT)
pkgname=jmapper
pkgver=0.4.0
pkgrel=1
pkgdesc="token-efficient jmap email cli for ai agents - tsv output, attachments, minimal tokens"
arch=('any')
url="https://github.com/rotkonetworks/jmap-mcp"
license=('MIT')
depends=('deno')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9c859b0fb39faba6b4052d0e419431c17ed92983ae02b0744cf0e7e2f2909811')

package() {
    cd "$srcdir/jmap-mcp-$pkgver"

    # jmapper.ts imports the bare specifier "jmap-jam", which only resolves via
    # the import map in deno.json; shipping the script alone makes every run fail.
    # deno.lock pins dependency integrity for the runtime fetch.
    install -Dm644 jmapper.ts "$pkgdir/usr/share/$pkgname/jmapper.ts"
    install -Dm644 deno.json  "$pkgdir/usr/share/$pkgname/deno.json"
    install -Dm644 deno.lock  "$pkgdir/usr/share/$pkgname/deno.lock"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'WRAPPER'
#!/bin/sh
exec deno run --allow-env --allow-net --allow-read --allow-write \
    --config /usr/share/jmapper/deno.json \
    --lock /usr/share/jmapper/deno.lock \
    /usr/share/jmapper/jmapper.ts "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
