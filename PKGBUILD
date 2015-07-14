# Maintainer: veox <veox at wemakethings dot net>

pkgname=geda-gaf-git
_gitname=geda-gaf
pkgver=5902.da7dabe
pkgrel=1
pkgdesc="gEDA/gaf suite - Contains gschem, gnetlist, gsymcheck, gattrib, utilities and documentation from the gEDA project (latest git revision)"
arch=('i686' 'x86_64')
url="http://www.geda-project.org/"
license=('GPL')
depends=('gtk2' 'guile' 'libstroke' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('git' 'autoconf' 'automake' 'pkgconfig' 'flex' 'gawk')
optdepends=('python2: for two of the commands (garchive, tragesym)'
  'gawk: for sw2asc')
provides=('geda-gaf')
conflicts=('geda-gaf')
install=geda-gaf.install
source=('git://git.geda-project.org/geda-gaf.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build ()
{
  cd "${srcdir}/${_gitname}"

  ./autogen.sh
  ./configure --prefix=/usr --disable-update-xdg-database

  make
}

package ()
{
  # cd "$srcdir/$_gitname-build"
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir/" install 
  sed -i 's+/usr/bin/env python+/usr/bin/env python2+' \
    "$pkgdir/usr/bin/garchive"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/bin/tragesym"
  sed -i 's+/usr/bin/python+/usr/bin/python2+' \
    "$pkgdir/usr/share/doc/${_gitname}/examples/lightning_detector/bom"
}
