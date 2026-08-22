# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>
_pkgname=n-dhcp4
pkgname=$_pkgname-git
pkgver=1.r91.g37d0ff4
pkgrel=2
epoch=1
pkgdesc="Dynamic Host Configuration Protocol for IPv4"
url="https://github.com/nettools/n-dhcp4"
license=('Apache-2.0 OR LGPL-2.1-or-later')
arch=(x86_64)
depends=(glibc libgcc)
makedepends=(git meson ninja pkgconf)
provides=("$_pkgname=${pkgver%%.r*}" 'libndhcp4.so')
conflicts=("$_pkgname")
# subprojects/{c-list,c-siphash,c-stdaux} are git submodules; clone them as
# separate sources and rewire the submodule URLs to these local checkouts in
# prepare() so the meson build finds their meson.build files
source=(
  "git+https://github.com/nettools/n-dhcp4.git"
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
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  if unshare -Urn true 2>/dev/null; then
    unshare -Urn -- meson test -C build
  else
    meson test -C build --no-suite n-dhcp4
    meson test -C build 'n-dhcp4:API Symbol Visibility' 'n-dhcp4:Message Handling' \
      'n-dhcp4:Client Runner' 'n-dhcp4:Packet Utility Library'
  fi
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
