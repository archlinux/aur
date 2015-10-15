# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterwallet-git
pkgver=20150420
pkgrel=1
pkgdesc="Counterparty web wallet"
arch=('any')
makedepends=('bower' 'git' 'nodejs-grunt-cli' 'npm')
optdepends=('counterblockd-git: extended API services'
            'openresty: web app server')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterwallet"
license=('CDDL')
source=(git+https://github.com/CounterpartyXCP/counterwallet)
sha256sums=('SKIP')
provides=('counterwallet')
conflicts=('counterwallet')
options=('!strip')
install=counterwallet.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Configuring counterwallet.conf.json for no Transifex lookups...'
  cp -dpr --no-preserve=ownership counterwallet.conf.json.example counterwallet.conf.json
  sed -i 's@"AVAIL.*@"AVAILABLE_LANGUAGES": ["en"],@' counterwallet.conf.json
}

build() {
  cd ${pkgname%-git}

  msg2 'Fetching Web assets...'
  cd src && bower install --allow-root --config.interactive=false && cd ..

  msg2 'Fetching NPM dependencies...'
  npm install

  msg2 'Building the static site...'
  grunt build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  install -dm 755 "$pkgdir/srv/http/counterwallet"
  tar -c . | tar -x -C "$pkgdir/srv/http/counterwallet"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
