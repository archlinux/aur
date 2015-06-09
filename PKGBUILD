# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterwallet
pkgver=1.6.3
pkgrel=1
pkgdesc="Counterparty web wallet"
arch=('any')
makedepends=('nodejs-bower' 'nodejs-grunt-cli' 'npm')
optdepends=('counterblockd: extended API services'
            'openresty: web app server')
groups=('counterparty')
url="https://counterwallet.io"
license=('CDDL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterwallet/tar.gz/$pkgver)
sha256sums=('fdc7cafdab0d258a3f66aaea0b9b04d5d9afae4e1545e5fcebca9bbed4b35f96')
options=('!strip')
install=counterwallet.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Configuring counterwallet.conf.json for no Transifex lookups...'
  cp -dpr --no-preserve=ownership counterwallet.conf.json.example counterwallet.conf.json
  sed -i 's@"AVAIL.*@"AVAILABLE_LANGUAGES": ["en"],@' counterwallet.conf.json
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Fetching Web assets...'
  cd src && bower install --allow-root --config.interactive=false && cd ..

  msg 'Fetching NPM dependencies...'
  npm install

  msg 'Building the static site...'
  grunt build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing...'
  install -dm 755 "$pkgdir/srv/http/counterwallet"
  tar -c . | tar -x -C "$pkgdir/srv/http/counterwallet"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
