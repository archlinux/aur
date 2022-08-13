# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=sratom
pkgname=$_pkgname-git
pkgver=0.6.12.r232.bde09a6
pkgrel=1
pkgdesc='An LV2 Atom RDF serialisation library (git version)'
arch=(i686 x86_64)
url='http://drobilla.net/software/sratom/'
license=(ISC)
depends=(glibc lv2)
makedepends=(doxygen git lv2 meson python-sphinx python-sphinx-lv2-theme serd sord)
conflicts=($_pkgname $_pkgname-docs)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" $_pkgname-docs)
source=("$_pkgname::git+https://gitlab.com/lv2/$_pkgname.git")
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
  depends+=(libserd-0.so libsord-0.so)
  provides+=(libsratom-0.so)

  meson install -C $_pkgname-build --destdir "$pkgdir"
  mv -v "$pkgdir"/usr/share/doc/{$_pkgname-0,$pkgname}
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 $_pkgname/{NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
