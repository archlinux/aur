# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=lib32-libpcap-git
_pkgname=libpcap
pkgver=1.10.7.r2149.g84f140f
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=(x86_64)
url="http://www.tcpdump.org/"
_url=https://github.com/the-tcpdump-group/libpcap
license=(BSD-3-Clause)
depends=(
  lib32-glibc
  lib32-libnl
  $_pkgname
)
makedepends=(
  bluez-libs
  git
  lib32-dbus
)
provides=(
  lib32-libpcap
  libpcap.so
)
conflicts=(lib32-libpcap)
options=(!staticlibs)
source=("$_pkgname::git+$_url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  local _tag _rev _hash
  _tag=$(git tag -l --sort=-version:refname | grep -E '^libpcap-[0-9]+(\.[0-9]+)*$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s\n' "${_tag#libpcap-}" "$_rev" "$_hash"
}

prepare() {
  cd "$_pkgname"
  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib32
    --enable-ipv6
    --enable-bluetooth
    --enable-usb
    --with-libnl
  )
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$_pkgname"
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    lib32-dbus libdbus-1.so
  )

  cd "$_pkgname"

  make DESTDIR="$pkgdir" install

  # remove files provided by libpcap
  rm -rf "$pkgdir/usr/"{include,share,bin}

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGES,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
