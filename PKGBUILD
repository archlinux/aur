# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterwallet
pkgver=1.7.0
pkgrel=1
pkgdesc="Counterparty web wallet"
arch=('any')
makedepends=('bower' 'nodejs-grunt-cli' 'npm')
optdepends=('counterblockd: extended API services'
            'openresty: web app server')
groups=('counterparty')
url="https://counterwallet.io"
license=('CDDL')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterwallet/tar.gz/$pkgver)
sha256sums=('10f0707df34191b9ff8ba0cd76bd6d708dfa48ddbd0687393b9e5800c0b129e8')
options=('!strip')
install=counterwallet.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Configuring counterwallet.conf.json for no Transifex lookups...'
  cp -dpr --no-preserve=ownership counterwallet.conf.json.example counterwallet.conf.json
  sed -i 's@"AVAIL.*@"AVAILABLE_LANGUAGES": ["en"],@' counterwallet.conf.json
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fetching Web assets...'
  pushd src && bower install --allow-root --config.interactive=false && popd

  msg2 'Fetching NPM dependencies...'
  npm install

  msg2 'Building the static site...'
  grunt build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  install -dm 755 "$pkgdir/srv/http/counterwallet"
  tar -c . | tar -x -C "$pkgdir/srv/http/counterwallet"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
