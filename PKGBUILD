# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=pyethereum-git
pkgver=20150519
pkgrel=1
pkgdesc="Ethereum Python client"
arch=('any')
depends=('python2'
         'python2-bitcoin'
         'python2-pyethash'
         'python2-pysha3'
         'python2-repoze.lru'
         'python2-rlp'
         'python2-structlog'
         'python2-yaml')
makedepends=('git' 'python2-setuptools')
groups=('ethereum')
url="https://github.com/ethereum/pyethereum"
license=('MIT')
source=(git+https://github.com/ethereum/pyethereum#branch=develop)
sha256sums=('SKIP')
provides=('pyethereum')
conflicts=('pyethereum')

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

building() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/pyethereum/LICENSE"

  msg 'Installing docs...'
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/pyethereum/README.rst"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
