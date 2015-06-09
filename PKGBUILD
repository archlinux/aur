# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-python-bitcoinlib-git
pkgver=20150420
pkgrel=1
pkgdesc="An easy interface to the Bitcoin protocol and data structures"
arch=('any')
depends=('openssl' 'python2')
makedepends=('git' 'python2-setuptools')
url="https://github.com/petertodd/python-bitcoinlib"
license=('LGPL3')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/petertodd/python-bitcoinlib)
sha256sums=('SKIP')
provides=('python2-python-bitcoinlib')
conflicts=('python2-bitcoin' 'python2-pybitcointools' 'python2-python-bitcoinlib')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare(){
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

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
