# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ethereum-serpent-git
pkgver=20150218
pkgrel=1
pkgdesc="Serpent compiler"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('gcc' 'git' 'make')
groups=('ethereum')
url="https://github.com/ethereum/serpent"
license=('WTFPL')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/ethereum/serpent)
sha256sums=('SKIP')
provides=('ethereum-serpent' 'serpent')
conflicts=('ethereum' 'ethereum-serpent' 'serpent')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

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
  cd ${pkgname%-git}

  msg 'Building...'
  make
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -dpr --no-preserve=ownership examples "$pkgdir/usr/share/doc/${pkgname%-git}"

  msg 'Installing...'
  install -dm 755 "$pkgdir/usr/"{bin,lib}
  make DESTDIR="$pkgdir" install

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
