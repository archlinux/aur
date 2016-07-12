# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterparty-cli-git
pkgver=20160711
pkgrel=1
pkgdesc="Counterparty Protocol Command‐Line Interface"
arch=('any')
depends=('python'
         'python-appdirs'
         'python-colorlog'
         'python-counterparty-lib'
         'python-dateutil'
         'python-prettytable'
         'python-requests')
makedepends=('git' 'python-setuptools')
optdepends=('bitcoin-core-addrindex: Bitcoin Core headless P2P node with addrindex'
            'bitcoin-headless-addrindex: Bitcoin headless wallet with addrindex'
            'bitcoin-qt-addrindex: Bitcoin-QT wallet with addrindex'
            'ethereum: compile Solidity contract code'
            'ethereum-serpent: compile Serpent contract code')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterparty-cli"
license=('MIT')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/CounterpartyXCP/counterparty-cli)
sha256sums=('SKIP')
provides=('counterparty-cli' 'counterparty-client' 'counterparty-server')
conflicts=('counterparty-cli' 'counterparty-client' 'counterparty-server')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing setup.py...'
  sed -i "/'setup_requires':.*/d" setup.py
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
