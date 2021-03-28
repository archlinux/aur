# Maintainer: Buce <dmbuce@gmail.com>
pkgname=c10t-git
pkgver=1.7.r242.g15d0bfe
pkgver() {
  cd "$srcdir/$pkgname"
  if ! git describe --tags 2>/dev/null; then
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  fi | sed 's/-/.r/; s/-/./g'
}
pkgrel=1
pkgdesc="A minecraft cartography tool."
arch=('i686' 'x86_64')
url="https://github.com/udoprog/c10t"
license=('BSD')
depends=(libpng boost-libs freetype2)
makedepends=('boost' 'git' 'cmake')
#checkdepends=()
optdepends=()
provides=('c10t')
conflicts=('c10t')
backup=(etc/c10t-palette.json)
install=
source=("$pkgname::git+https://github.com/udoprog/${pkgname%-git}.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  git submodule init
  git submodule update

  cmake .
  sed -i 's,palette.json,/etc/c10t-palette.json,g' src/settings_t.cpp
  make c10t
}

package() {
  install -D -m 755  "$srcdir/$pkgname/c10t" "$pkgdir/usr/bin/c10t"
  install -D -m 644 "$srcdir/$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/c10t/LICENSE"
  install -D -m 644 "$srcdir/$pkgname/palette.json" "$pkgdir/etc/c10t-palette.json"
}

# vim:set ts=2 sw=2 et:
