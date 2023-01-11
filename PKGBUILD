# $Id$
# Maintainer: Biell <biell@pobox.com>

pkgname=xvile
_basename=vile
pkgver=9.8_x
_basever=${pkgver//_/}
pkgrel=1
pkgdesc="vi like emacs"
arch=('i686' 'x86_64')
url="http://invisible-island.net/vile/vile.html"
depends=('perl' 'vile' 'xaw3d')
license=('custom')
options=(!libtool)
source=( https://invisible-island.net/archives/vile/current/vile-${_basever}.tgz )
sha1sums=( 236d8c76439cbf60f36c53bf40c6f27f227da044 )

prepare() {
  cd $srcdir/${_basename}-${_basever}
  #sed -i 's|FLEX_BETA|FLEX_NOBETA|g' filters/filters.h
}

build() {
  cd $srcdir/${_basename}-${_basever}
  ./configure --prefix=/usr --with-x --with-Xaw3d
  make || return 1
}

package() {
  cd $srcdir/${_basename}-${_basever}

  install -D -m 755 xvile $pkgdir/usr/bin/xvile

  sed -e 's/ vile / xvile /' ./macros/vile-pager >$pkgdir/usr/bin/xvile-pager
  chmod 755 $pkgdir/usr/bin/xvile-pager
  install -D -m 644 ./vile.1 $pkgdir/usr/share/man/man1/xvile.1
  install -D -m 755 ./xshell.sh $pkgdir/usr/bin/xshell.sh
  install -D -m 644 ./macros/vilemenu.rc $pkgdir/usr/share/vile/vilemenu.rc

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cat <<EOF >$pkgdir/usr/share/licenses/$pkgname/license
Copyright

Vile is copyrighted by Paul G. Fox, Thomas E. Dickey and Kevin Buettner with some
files (e.g., visvile) copyright by Clark Morgan.
We distribute it under the terms of the GNU Public License, Version 2. 
EOF
}

