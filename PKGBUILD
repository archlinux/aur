# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: furester <furester at gmail.com>

_pkgname=lightmediascanner
pkgname=$_pkgname-git
pkgver=0.4.5.99.r357.b05729d
pkgrel=1
pkgdesc="Lightweight library to scan media - Development version"
arch=('i686' 'x86_64')
url="https://github.com/profusion/lightmediascanner"
license=('LGPL')
depends=('sqlite3' 'libmp4v2' 'ffmpeg')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/profusion/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/AUTHORS"
  install -Dm644 NEWS "$pkgdir/usr/share/doc/$_pkgname/NEWS"
  install -Dm644 README "$pkgdir/usr/share/doc/$_pkgname/README"
}
