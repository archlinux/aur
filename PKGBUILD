# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

_pkgname=litesql
pkgname="$_pkgname-git"
pkgver=r887.e46cf2f
pkgrel=1
pkgdesc="C++ ORM for SQLite3, PostgreSQL, MySQL and Oracle"
arch=('i686' 'x86_64' 'armv7h')
url="http://sourceforge.net/projects/litesql/"
license=('BSD3')
#depends=('expat' 'libmariadbclient' 'postgresql-libs' 'sqlite')
depends=('expat' 'sqlite')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git://git.code.sf.net/p/litesql/litesql"
        "fix-compilation.patch"
        "disable-example.patch")
md5sums=('SKIP'
         '38d8e8fb9a49b1953b5072c69c42c883'
         '6387f142653ce3616ce7f49b0e5fb5b6')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  git apply ../fix-compilation.patch
  git apply ../disable-example.patch
  mkdir -p build
}

build() {
  cd "$srcdir/$_pkgname/build"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DLITESQL_WITH_EXAMPLE=OFF ..
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

  # This directory is empty.
  rm -r "$pkgdir/usr/include/litesql/ui"
}
