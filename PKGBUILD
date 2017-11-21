# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=qt5-sqlcipher-git
_reponame=qt5-sqlcipher
pkgver=r15.34f83ad
pkgrel=1
pkgdesc="Qt SQL driver plugin for SQLCipher. Fork by blizzard4591."
arch=('x86_64' 'i686')
url="https://github.com/blizzard4591/qt5-sqlcipher"
license=('GPL')
depends=('qt5-base' 'sqlcipher')
makedepends=('git' 'cmake' 'pkg-config')
provides=('qt5-sqlcipher')
source=('git+https://github.com/blizzard4591/qt5-sqlcipher')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_reponame"
  git submodule init
  git submodule update
}

build() {
  # Temporary build dir
  rm -rf "$srcdir/$_reponame-build"
  git clone --recursive "$srcdir/$_reponame" "$srcdir/$_reponame-build"
  cd "$srcdir/$_reponame-build"

  # Compile
  cd "$srcdir/$_reponame-build"
  cmake \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    .
  make
}

check() {
  cd "$srcdir/$_reponame-build"
  ./qsqlcipher-test
}

package() {
  cd "$srcdir/$_reponame-build"
  install -Dm644 "$srcdir/$_reponame-build/sqldrivers/libqsqlcipher.so" "$pkgdir/usr/lib/qt/plugins/sqldrivers/libsqlcipher.so"
}

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
