# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-bitmerchant-git
pkgver=20140510
pkgrel=1
pkgdesc="Bitcoin merchant tools"
arch=('i686' 'x86_64')
depends=('python2' 'python2-base58' 'python2-crypto' 'python2-ecdsa' 'python2-six')
makedepends=('git' 'python2-setuptools')
url="https://github.com/sbuss/bitmerchant"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/sbuss/bitmerchant)
sha256sums=('SKIP')
provides=('bitmerchant' 'python2-bitmerchant')
conflicts=('bitmerchant' 'python2-bitmerchant')

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

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
