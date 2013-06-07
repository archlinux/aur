# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=elementary-git
_pkgname=elementary
pkgver=1.7.99.7960.e95dec7
pkgrel=1
pkgdesc="EFL widget toolkit - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1' 'CCPL:cc-by-sa')
depends=('efl-git')
makedepends=('git')
provides=("elementary=$pkgver" 'elementary-svn')
conflicts=('elementary' 'elementary-svn')
options=('!libtool' 'debug')
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  for i in v_maj v_min v_mic; do
    local _$i=$(grep -m 1 $i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")
  done
  
  echo $_v_maj.$_v_min.$_v_mic.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 README "$pkgdir/usr/share/$pkgname/README"
  install -Dm644 NEWS "$pkgdir/usr/share/$pkgname/NEWS"
  install -Dm644 ChangeLog "$pkgdir/usr/share/$pkgname/ChangeLog"
  
# install license file
  install -Dm644 COPYING.images "$pkgdir/usr/share/licenses/$pkgname/COPYING.images"
}
