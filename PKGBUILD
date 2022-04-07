# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: angvp <angvp@archlinux.org>

_name=libaio
pkgname=lib32-libaio
pkgver=0.3.112
pkgrel=2
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=(x86_64)
url="https://pagure.io/libaio"
license=(LGPL2.1)
depends=(lib32-glibc libaio)
provides=(libaio.so)
options=(debug)
source=(https://releases.pagure.org/$_name/$_name-$pkgver.tar.gz)
sha512sums=('5f984529c9f747a6c82f1e4457fc0832bb1fc299ae6e700f2ac5a8ea7b9bfc6ea1e75809728cc115a020cff6685ed1f4e38c6aeacc1ea98dfccce04dd19dafaa')
b2sums=('088f3b195a65bdc97ae2318e47af17c65259ed3208dca7bfef93c81a800602085e5b2078dbd436c740be316d0ebd923a1b3b7c0808257e2e7c7fb0f7ae1e0dba')

prepare() {
  # -Werror, not even once
  sed 's/-Werror//' -i $_name-$pkgver/harness/Makefile
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  # AIO library is a thin wrapper around kernel syscalls, it does not use stdlib
  # and other helpers like stack protection libraries
  export CFLAGS='-march=x86-64 -mtune=generic -O2 -pipe -fno-stack-protector -fno-plt'

  make -C $_name-$pkgver
}

check() {
  make partcheck -k -C $_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" libdir=/usr/lib32 install -C $_name-$pkgver
  rm -rf "$pkgdir"/usr/include
}

# vim: ts=2 sw=2 et:
