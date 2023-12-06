# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>

_npmname=zone-mta
pkgname=nodejs-zone-mta
pkgver=3.6.13
pkgrel=1
pkgdesc='Modern outbound MTA cross platform and extendable server application'
arch=(any)
url=https://github.com/zone-eu/zone-mta
license=(custom:EUPL)
depends=(nodejs)
makedepends=(npm)
source=(
  "https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
  "nodejs-zone-mta.service"
  )
noextract=($_npmname-$pkgver.tgz)
sha256sums=('cc81f69aa4f05db916e0fbec6f5463f70061c0d41818513e22bd7732469ff2c6'
            '026606698ae1a9605806513dd965dfc51cf665c2d9335750ac2ff8c54d6d77c3')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -D -m 644 "${srcdir}/nodejs-zone-mta.service" ${pkgdir}/usr/lib/systemd/system/nodejs-zone-mta.service

    # Remove the files that contain references to $pkgdir
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/Makefile"
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/config.gypi"

    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
