# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-ethereum-serpent-git
pkgver=20150218
pkgrel=1
pkgdesc="Serpent compiler, installed as a Python module"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('gcc' 'git' 'make' 'python2-setuptools')
groups=('ethereum')
url="https://github.com/ethereum/serpent"
license=('WTFPL')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/ethereum/serpent)
sha256sums=('SKIP')
provides=('python2-ethereum-serpent')
conflicts=('python2-ethereum-serpent')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Makefile...'
  sed -i "s@/usr/local@/usr@g" Makefile

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

  msg 'Removing conflicting serpent binary...'
  rm -f "$pkgdir/usr/bin/serpent"

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
