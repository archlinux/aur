 # Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=vector-web
pkgver=0.7.4
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the web"
arch=('any')
url='https://github.com/vector-im/vector-web'
license=('Apache')
makedepends=('git' 'npm')
checkdepends=('fontconfig')
optdepends=('caddy: web server'
            'matrix-synapse: matrix homeserver')
install="$pkgname.install"
changelog="CHANGELOG.md"
source=("https://github.com/vector-im/$pkgname/archive/v$pkgver.tar.gz"
        'Caddyfile.example')
sha256sums=('d60647fcf19123ac2064f2158b38ac10a719380abc72d244fa8a5f6082e35180'
            '73b20f2c48eec6a800cce1364db80b4298f0df89df8faa339a1a76b6f1615add')

build() {
    cd "$pkgname-$pkgver"
    npm install
    npm run clean
    npm run build
    cd "$srcdir/$pkgname-$pkgver/${pkgname%-web}"
    echo "v$pkgver" > version
}

check() {
    cd "$pkgname-$pkgver"
    npm run test
}

package() {
    cd "$pkgname-$pkgver/${pkgname%-web}"
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -RL * "$pkgdir/usr/share/webapps/$pkgname"
    install -m644 "config.sample.json" "$pkgdir/etc/webapps/$pkgname/config.sample.json"
    ln -s "/etc/webapps/$pkgname/config.json" "$pkgdir/usr/share/webapps/$pkgname/config.json"
    install -m644 "$srcdir/Caddyfile.example" "$pkgdir/etc/webapps/$pkgname"
}
