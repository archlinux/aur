# Maintainer: Cedric BAIL < cedric dot bail at free dot fr >

_pkgname=upipe
pkgname=$_pkgname-git
pkgver=0.4.r1226.39e1b6b
pkgrel=1
pkgdesc="Framework designed for the pipeline of multimedia player, transcoder or streamer."
arch=('i686' 'x86_64')
url="http://www.upipe.org/"
license=('MIT')
depends=('')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git+https://github.com/cmassiot/upipe.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  }

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  autoreconf -fi
  ./configure --prefix=/usr

  make
  }

package(){
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
    install -m644 -t"$pkgdir/usr/share/doc/$_pkgname/" TODO README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
    install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
    }
    