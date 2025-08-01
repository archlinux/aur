# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=lib32-libpcap
_name=${pkgname/*-/}
pkgver=1.10.5
pkgrel=3
pkgdesc="A system-independent interface for user-level packet capture (32-bit)"
arch=(x86_64)
url="http://www.tcpdump.org/"
_url=https://github.com/the-tcpdump-group/libpcap
license=(BSD-3-Clause)
depends=(
  lib32-glibc
  lib32-libnl
  $_name=$pkgver
)
makedepends=(
  bluez-libs
  git
  lib32-dbus
)
provides=(libpcap.so)
options=(!staticlibs)
source=(git+$_url?signed#tag=$_name-$pkgver)
sha512sums=('476ea9e4f56ac45c695ea4e2ccdc12e296e7f4474b61219a140eb3141d82e230fb7a5e736700c53501fd6ecabfd3859ec6131386786ea8eb9606d87d62789a6d')
b2sums=('c4ed5623cf95dc66d43bf56cd3a62135accba139f716af0e9aba6288d01823c4f4d5b96afce274b1cbd1750a9fc1cacfae10e5ab59309b6fba69cdcb05f897e2')
validpgpkeys=('1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D') # The Tcpdump Group (Package signing key) <release@tcpdump.org>

prepare() {
  cd $_name
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

  cd $_name
  ./configure "${configure_options[@]}"
  make
}

package() {
  depends+=(
    lib32-dbus libdbus-1.so
  )

  cd $_name

  make DESTDIR="$pkgdir" install

  # remove files provided by libpcap
  rm -rf "$pkgdir/usr/"{include,share,bin}

  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 {CHANGES,{CONTRIBUTING,README}.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
