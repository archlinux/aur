# Maintainer: Josephine Pfeiffer <josie@archlinux.org>
# Contributor: Gabriel Rauter <rauter.gabriel@gmail.com>
pkgname=n-dhcp4
pkgver=1
pkgrel=2
pkgdesc="Dynamic Host Configuration Protocol for IPv4"
url="https://github.com/nettools/n-dhcp4"
license=('Apache-2.0 OR LGPL-2.1-or-later')
arch=(x86_64)
depends=(glibc libgcc)
makedepends=(meson ninja pkgconf)
provides=('libndhcp4.so')
# c-list/c-siphash/c-stdaux are git submodules; the release tarball ships them
# empty, so they are fetched at the commits pinned by the v$pkgver tag
_clist=2e4b605c6217cd3c8a1ef773f82f5cc329ba650d
_csiphash=7c42c592581906fef19458372b8db2b643278211
_cstdaux=11930d259212605a15430523472ef54e0c7654ee
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/nettools/n-dhcp4/archive/refs/tags/v$pkgver.tar.gz"
  "c-list-$_clist.tar.gz::https://github.com/c-util/c-list/archive/$_clist.tar.gz"
  "c-siphash-$_csiphash.tar.gz::https://github.com/c-util/c-siphash/archive/$_csiphash.tar.gz"
  "c-stdaux-$_cstdaux.tar.gz::https://github.com/c-util/c-stdaux/archive/$_cstdaux.tar.gz"
)
sha256sums=(
  '2ae4e4508d0293d7e438f1e6ea0ee62d2005d93f20af69e5bc47e1cd6d4a7caa'
  '291da93fae349429a7394fb0ccefb3c5362a250e5559404554f2d0fdd256ad50'
  '9f477499d2033e2b8488037778616bd13c3e6cf4ab7e86898893bdeb2fe02a10'
  '4e41125264fea030e0e468f783e6f7b74f937809e097e0259f03c334e1264cfd'
)

prepare() {
  cd "$pkgname-$pkgver"
  rmdir subprojects/c-list subprojects/c-siphash subprojects/c-stdaux
  mv "$srcdir/c-list-$_clist" subprojects/c-list
  mv "$srcdir/c-siphash-$_csiphash" subprojects/c-siphash
  mv "$srcdir/c-stdaux-$_cstdaux" subprojects/c-stdaux
}

build() {
  arch-meson "$pkgname-$pkgver" build
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
