# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=serd
pkgname=$_pkgname-git
pkgver=0.30.15.r1034.f4f9c9ec
pkgrel=1
pkgdesc='Lightweight C library for RDF syntax supporting reading / writing Turtle and NTriples (git version)'
arch=(i686 x86_64)
url='http://drobilla.net/software/serd/'
license=(ISC)
depends=(glibc)
makedepends=(doxygen git meson python-sphinx)
conflicts=($_pkgname $_pkgname-docs)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" $_pkgname-docs)
source=("$_pkgname::git+https://gitlab.com/drobilla/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}

check() {
  meson test -C $_pkgname-build
}

package() {
  provides+=(libserd-0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  mv -v "$pkgdir"/usr/share/doc/{$_pkgname-0,$pkgname}
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
