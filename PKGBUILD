# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyrpcwallet-git
pkgver=20140319
pkgrel=1
pkgdesc="Lightweight JSON-RPC wallet compatible with bitcoind"
arch=('any')
depends=('python' 'python-bottle' 'python-crypto' 'python-pycoin' 'sqlite')
makedepends=('git')
optdepends=('counterpartyd: Counterparty protocol')
url="https://github.com/CounterpartyXCP/pyrpcwallet"
license=('MIT')
source=(git+https://github.com/CounterpartyXCP/pyrpcwallet)
sha256sums=('SKIP')
install=pyrpcwallet.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -Dm 644 README.md $pkgdir/usr/share/doc/pyrpcwallet/README.md

  msg 'Installing appdirs...'
  install -dm 755 $pkgdir/usr/share/pyrpcwallet
  for _appdir in lib; do
    cp -dpr --no-preserve=ownership $_appdir $pkgdir/usr/share/pyrpcwallet/$_appdir
  done

  msg 'Installing appfiles...'
  for _appfile in __init__.py; do
    install -Dm 644 $_appfile $pkgdir/usr/share/pyrpcwallet/$_appfile
  done

  msg 'Installing executable...'
  install -Dm 755 pyrpcwallet.py $pkgdir/usr/share/pyrpcwallet/pyrpcwallet.py

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
