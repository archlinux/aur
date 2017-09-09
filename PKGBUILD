# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=litesql
pkgname="$_pkgname-git"
pkgver=r647.a83e253
pkgrel=1
pkgdesc="C++ ORM for SQLite3, PostgreSQL, MySQL and Oracle"
arch=('i686' 'x86_64' 'armv7h')
url="https://dev.louiz.org/projects/litesql"
license=('BSD3')
#depends=('expat' 'libmariadbclient' 'postgresql-libs' 'sqlite')
depends=('expat' 'sqlite')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://git.louiz.org/litesql.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

check() {
  cd "$srcdir/$_pkgname/build"
  make test
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir/" install

  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Workaround for <https://dev.louiz.org/issues/3283>, remove when fixed
  rm -r "$pkgdir"/usr/model.cmake
}
