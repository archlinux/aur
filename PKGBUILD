# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=eruler-git
_pkgname=${pkgname%-*}
pkgver=0.1.0.r4.e8fee1a
pkgrel=1
pkgdesc="On-Screen Ruler and Measurement Tools using EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('GPL')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  local _ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]-')
  
  echo $_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
