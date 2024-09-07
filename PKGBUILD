# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Bill Fraser <wfraser@codewise.org>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=lib32-libpcap
_name=${pkgname/*-/}
pkgver=1.10.5
pkgrel=2
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
sha512sums=('b07d570933ccfc671c66e9355fb84b087dfc144f41e4088c253f544bfbecc71f38aac33ac66b2c0510422381e4c53f2499214e046146a781af050e76b3f774e8')
b2sums=('41a719c1eb22f411c133973d8971ff8c4de6d940ceb83acc5bfd9942bf337f12db55315a808caa907cdc7c14d20a7fae9d554aca945f97a0bbeee0b6c0d2f23c')
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
