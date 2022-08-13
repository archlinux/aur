# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=sord
pkgname=$_pkgname-git
pkgver=0.16.13.r503.9960380
pkgrel=1
pkgdesc='Lightweight C library for storing RDF statements in memory (git version)'
arch=(i686 x86_64)
url='http://drobilla.net/software/sord/'
license=(ISC)
depends=(glibc pcre)
makedepends=(doxygen git meson python-sphinx serd)
conflicts=($_pkgname $_pkgname-docs)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" $_pkgname-docs)
source=("$_pkgname::git+https://gitlab.com/drobilla/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo ${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  arch-meson $_pkgname $_pkgname-build
  meson compile -C $_pkgname-build
}

check() {
  meson test -C $_pkgname-build
}

package() {
  depends+=(libserd-0.so)
  provides+=(libsord-0.so)
  meson install -C $_pkgname-build --destdir "$pkgdir"
  mv -v "$pkgdir"/usr/share/doc/{$_pkgname-0,$pkgname}
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
