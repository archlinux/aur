# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: angvp <angvp@archlinux.org>

_name=libaio
pkgname=lib32-libaio
pkgver=0.3.113
pkgrel=2
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=(x86_64)
url="https://pagure.io/libaio"
license=(LGPL2.1)
depends=(
  lib32-glibc
  $_name=$pkgver
)
provides=(libaio.so)
source=(https://pagure.io/libaio/archive/$_name-$pkgver/$_name-$_name-$pkgver.tar.gz)
sha512sums=('8058c927de0b5f7079fc232d2be23272537694bf271488af1dc0330b58afc307931792ab138512c5e00aa3ea921935a6d862f575fb0cc2bf323de63d8df208cd')
b2sums=('e06c1c1cc118c15f6bed1abfa97368d7ccc0d2e716a233cd4141936fb382e40909c340a6c882b18ee9461aaa23dd77a6644a38bdb5a00c1444538a2e0ab816d4')

prepare() {
  # -Werror, not even once
  sed 's/-Werror//' -i $_name-$_name-$pkgver/harness/Makefile

  # disable failing test until upstream fixes it: https://pagure.io/libaio/issue/21
  rm -rf $_name-$_name-$pkgver/harness/cases/23.t
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  # AIO library is a thin wrapper around kernel syscalls, it does not use stdlib
  # and other helpers like stack protection libraries
  export CFLAGS='-march=x86-64 -mtune=generic -O2 -pipe'

  make -C $_name-$_name-$pkgver
}

check() {
  make partcheck -k -C $_name-$_name-$pkgver
}

package() {
  make DESTDIR="$pkgdir" libdir=/usr/lib32 install -C $_name-$_name-$pkgver
  rm -rf "$pkgdir"/usr/include
}

# vim: ts=2 sw=2 et:
