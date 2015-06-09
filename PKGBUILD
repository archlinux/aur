# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterparty-gui-git
pkgver=20150310
pkgrel=1
pkgdesc="An open marketplace, built on Bitcoin"
arch=('any')
depends=('counterparty-cli'
         'python'
         'python-appdirs'
         'python-pyqt5'
         'python-requests')
makedepends=('git'
             'python-setuptools')
optdepends=('bitcoin-headless-addrindex: Bitcoin headless wallet with addrindex'
            'bitcoin-qt-addrindex: Bitcoin QT wallet with addrindex'
            'btcwallet: HD Bitcoin thin client written in Go'
            'electrum: HD Bitcoin thin client written in Python')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-gui"
license=('MIT')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/CounterpartyXCP/counterparty-gui)
sha256sums=('SKIP')
provides=('counterparty-gui')
conflicts=('counterparty-gui')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
