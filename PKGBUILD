# Maintainer: Ian Glen <ian@ianglen.me>

pkgname=lepton-eda-git
_gitname=lepton-eda
pkgver=7748.d2550597b
pkgrel=1
pkgdesc="A full GPL'd suite and toolkit of Electronic Design Automation tools. Forked from gEDA in late 2016."
arch=('i686' 'x86_64')
url="https://github.com/lepton-eda/lepton-eda"
license=('GPL')
depends=('gtk2' 'guile' 'guile2.0' 'libstroke')
makedepends=('pkg-config' 'flex' 'gawk')
optdepends=('python2: for two of the commands (garchive, tragesym)'
  'gawk: for sw2asc')
provides=('$_gitname')
conflicts=('$_gitname' 'geda-gaf')
source=('git+https://github.com/lepton-eda/lepton-eda.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build ()
{
  cd "$srcdir/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr --disable-update-xdg-database
  make
}

package ()
{
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
  sed -i 's+/usr/bin/env python+/usr/bin/env python2+' \
    "$pkgdir/usr/bin/garchive"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/bin/tragesym"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/share/doc/$_gitname/examples/lightning_detector/bom"
}
