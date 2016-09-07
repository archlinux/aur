# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Cravix < dr dot neemous at gmail dot org >

_pkgname=terminology
pkgname=$_pkgname-git
pkgver=0.9.99.r1694.36a7166
pkgrel=1
pkgdesc="EFL based terminal emulator - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package(){
  cd $_pkgname

  make DESTDIR="$pkgdir" install

  install -Dm644 -t"$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
