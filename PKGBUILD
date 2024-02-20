# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: angvp <angvp@archlinux.org>

_name=libaio
pkgname=lib32-libaio
pkgver=0.3.113
pkgrel=4
pkgdesc='The Linux-native asynchronous I/O facility (aio) library'
arch=(x86_64)
url="https://pagure.io/libaio"
license=(LGPL-2.0-or-later)
depends=(
  lib32-glibc
  $_name=$pkgver
)
provides=(libaio.so)
# LTO is not supported: https://pagure.io/libaio/issue/10
options=(!lto)
source=(
  $url/archive/$_name-$pkgver/$_name-$_name-$pkgver.tar.gz
  $pkgname-0.3.113-fix_test_case_23.patch
)
sha512sums=('8058c927de0b5f7079fc232d2be23272537694bf271488af1dc0330b58afc307931792ab138512c5e00aa3ea921935a6d862f575fb0cc2bf323de63d8df208cd'
            'cd9cc15be3ab2c7fcb9bd0c5efafb3cdfbc6f3ad82da959d50ec9ad200fc7b51c7d7484f485687ab7ac57349d4d58a1a07ca6b335aedbe8aa2a8769c457aeb15')
b2sums=('e06c1c1cc118c15f6bed1abfa97368d7ccc0d2e716a233cd4141936fb382e40909c340a6c882b18ee9461aaa23dd77a6644a38bdb5a00c1444538a2e0ab816d4'
        'bfc44befde111e8bb845df2fed9b3dfd06ab1d3dddbc1313d0974cd1cae9a7659df4dd28e637ed222951c0ba7d76e047bd3656d96adb37a8e667b37ed080630a')

prepare() {
  # -Werror, not even once
  sed 's/-Werror//' -i $_name-$_name-$pkgver/harness/Makefile

  # fix issue with test: https://pagure.io/libaio/issue/21
  patch -Np1 -d $_name-$_name-$pkgver -i ../$pkgname-0.3.113-fix_test_case_23.patch

  # remove failing test until upstream fixes it
  rm -frv $_name-$_name-$pkgver/harness/cases/21.t
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
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
