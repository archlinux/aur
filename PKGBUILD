# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-serpent
pkgver=0.7.1
pkgrel=1
pkgdesc="Serpent compiler"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('gcc' 'git' 'make')
groups=('ethereum')
url="https://github.com/ethereum/serpent"
license=('WTFPL')
options=(!emptydirs)
source=($pkgname::git+https://github.com/ethereum/serpent#commit=5d3624f5569a2bb7bd633d973983c3e0d05e618c)
sha256sums=('SKIP')
provides=('ethereum-serpent' 'serpent')
conflicts=('ethereum' 'ethereum-serpent' 'serpent')

prepare() {
  cd "$pkgname"

  msg 'Fixing Makefile...'
  sed -i "s@/usr/local@/usr@g" Makefile
  sed -i -e "/^install:/ {
    N;N;N;N;N;N
    s@/usr@$pkgdir/usr@g
  }" Makefile

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd "$pkgname"

  msg 'Building...'
  make
}

package() {
  cd "$pkgname"

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/$pkgname"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/$pkgname"

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/"{bin,lib}
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
