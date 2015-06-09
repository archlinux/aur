# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=chromawallet-git
pkgver=20140825
pkgrel=1
pkgdesc="Colored Bitcoin wallet"
arch=('any')
depends=('python2' 'python2-python-bitcoinlib' 'python2-python-jsonrpc' 'python2-pycoin' 'python2-pyqt4' 'python2-sip' 'python2-webpy' 'qt4' 'sip' 'sqlite')
makedepends=('git' 'python2-setuptools')
url="http://chromawallet.com/"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/bitcoinx/ngcccbase)
sha256sums=('SKIP')
provides=('chromanode' 'chromawallet')
conflicts=('chromanode' 'chromawallet')
install=chromawallet.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/chromawallet/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/chromawallet/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/chromawallet"
  for _appdir in build coloredcoinlib ngcccbase ngcccbase.egg-info server ui; do
    cp -dpr --no-preserve=ownership $_appdir "$pkgdir/usr/share/chromawallet/$_appdir"
  done

  msg 'Installing appfiles...'
  for _appfile in build.py cacert.pem install_https.py setup.py; do
    install -Dm 644 $_appfile "$pkgdir/usr/share/chromawallet/$_appfile"
  done

  msg 'Installing executables...'
  for _bin in chromanode.py ngccc-cli.py ngccc-gui.py ngccc-server.py; do
    install -Dm 755 $_bin "$pkgdir/usr/share/chromawallet/$_bin"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
