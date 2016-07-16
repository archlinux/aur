# Maintainer: Jason Papakostas <vithos@gmail.com>
pkgname=vector-web
pkgver=0.7.3
pkgrel=1
pkgdesc="A glossy Matrix collaboration client for the web"
arch=('any')
url='https://github.com/vector-im/vector-web'
license=('Apache')
makedepends=('git' 'npm')
checkdepends=('fontconfig')
optdepends=('caddy: web server'
            'matrix-synapse: matrix homeserver')
backup=("etc/webapps/$pkgname/config.json")
changelog="CHANGELOG.md"
source=("git+https://github.com/vector-im/$pkgname.git#tag=v$pkgver"
        'Caddyfile.example')
sha256sums=('SKIP'
            '73b20f2c48eec6a800cce1364db80b4298f0df89df8faa339a1a76b6f1615add')

_backports=(
  # serve config.json statically instead of bundling it (#1344)
  6a6118e136776ce27c2e7456dd517df083dba493
)

prepare() {
  cd "$pkgname"

  if (( ${#_backports[*]} > 0 )); then
    git cherry-pick -n "${_backports[@]}"
  fi
}

build() {
    cd "$pkgname"
    npm install
    npm run clean
    npm run build
    cd "$srcdir/$pkgname/${pkgname%-web}"
    git describe --dirty --tags > version
}

check() {
    cd "$pkgname"
    npm run test
}

package() {
    cd "$pkgname/${pkgname%-web}"
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/etc/webapps/$pkgname"
    cp -RL * "$pkgdir/usr/share/webapps/$pkgname"
    install -m644 "config.json" "$pkgdir/etc/webapps/$pkgname/config.json"
    rm "$pkgdir/usr/share/webapps/$pkgname/config.json"
    ln -s "/etc/webapps/$pkgname/config.json" "$pkgdir/usr/share/webapps/$pkgname/config.json"
    install -m644 "$srcdir/Caddyfile.example" "$pkgdir/etc/webapps/$pkgname"
}
