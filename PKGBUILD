# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=emotion_generic_players-git
_pkgname=${pkgname%-*}
pkgver=1.8.0alpha2.49.ff58b57
pkgrel=1
pkgdesc="Emotion external binary executable players - Development version"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('efl-git' 'vlc')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/core/$_pkgname.git")
md5sums=('SKIP')
options=('debug')

pkgver() {
  cd "$srcdir/$_pkgname"

  for _i in v_maj v_min v_mic; do
    local v_ver="$v_ver.$(grep -m 1 $_i configure.ac | sed 's/m4//' | grep -o "[[:digit:]]*")"
  done

  v_ver=$(awk -F , '/^AC_INIT/ {print $2}' configure.ac | sed "s/v_ver/${v_ver#.}/" | tr -d '[ ]-')

  printf "$v_ver.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"
  export CXXFLAGS="$CXXFLAGS -fvisibility=hidden"

  ./autogen.sh --prefix=/usr

  make
}

package(){
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$_pkgname/ChangeLog"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"

# install license files
  install -Dm644 AUTHORS "$pkgdir/usr/share/licenses/$pkgname/AUTHORS"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

