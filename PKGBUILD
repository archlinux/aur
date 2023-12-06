# Maintainer: MrHacker <david.munozm@proton.me>
# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Emilien Devos (unixfox) <contact@emiliendevos.be>

_npmname=wildduck
pkgname=nodejs-wildduck
pkgver=1.41.0
pkgrel=1
pkgdesc='Opinionated email server'
arch=(any)
url=https://github.com/nodemailer/wildduck
provides=(wildduck)
conflicts=(wildduck)
license=(custom:EUPL)
depends=(
  'nodejs'
  'redis'
  'mongodb-bin'
)
makedepends=(npm)
source=(
  "https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
  "wildduck-server.service"
)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('299ba51f37b087d8f872f82b5d98731fbf02482fb81f36c6e21115c7a4dd7c86'
            '26c4e7456198b4a7a8e1ce5877c91ae487afcd5275b08dbd600d4576268616ec')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 "${srcdir}/wildduck-server.service" ${pkgdir}/usr/lib/systemd/system/wildduck-server.service

    # Remove the files that contain references to $pkgdir
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/Makefile"
    rm "$pkgdir/usr/lib/node_modules/$_npmname/node_modules/dtrace-provider/build/config.gypi"

    chown -R root:root "${pkgdir}"
}
