# Maintainer: Josephine Pfeiffer <hi@josie.lol>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>

_pkgname=n-dhcp4
pkgname=$_pkgname-git
pkgver=1.86.g5c0c3bd
pkgrel=1
pkgdesc="Dynamic Host Configuration Protocol for IPv4"
url="https://github.com/nettools/n-dhcp4"
license=('Apache-2.0 OR LGPL-2.1-or-later')
arch=(x86_64)
depends=(glibc)
makedepends=(git meson pkgconf)
provides=($_pkgname)
conflicts=($_pkgname)
# subprojects/{c-list,c-siphash,c-stdaux} are git submodules; clone them as
# separate sources and rewire the submodule URLs to these local checkouts in
# prepare() so the meson build finds their meson.build files
source=(
  "$_pkgname::git+https://github.com/nettools/n-dhcp4.git"
  "c-list::git+https://github.com/c-util/c-list.git"
  "c-siphash::git+https://github.com/c-util/c-siphash.git"
  "c-stdaux::git+https://github.com/c-util/c-stdaux.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.subprojects/c-list.url "$srcdir/c-list"
  git config submodule.subprojects/c-siphash.url "$srcdir/c-siphash"
  git config submodule.subprojects/c-stdaux.url "$srcdir/c-stdaux"
  git -c protocol.file.allow=always submodule update
}

build() {
  rm -rf build
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
