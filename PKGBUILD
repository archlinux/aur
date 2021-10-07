# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=sdn-git
_pkgname=sdn
pkgver=r163.536aa57
pkgrel=1
pkgdesc="Directory navigator"
url="https://git.janouch.name/p/sdn"
arch=('i686' 'x86_64')
license=('custom:0BSD')
options=(zipman)
conflicts=('sdn')
provides=('sdn')
makedepends=('cmake' 'pkg-config' 'git')
depends=('ncurses' 'acl')
source=("git+https://git.janouch.name/p/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  rm -rf "$srcdir/$_pkgname-build"
  mkdir "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  cmake "$srcdir/$_pkgname" -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-build"
  make install DESTDIR=$pkgdir
  install -Dm644 "$srcdir/$_pkgname/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
