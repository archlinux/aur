# Maintainer: James An <james@jamesan.ca>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>

_pkgname=busybox
pkgname=$_pkgname-static
pkgver=1.22.1
pkgrel=1
pkgdesc="Utilities for rescue and embedded systems"
arch=("i686" "x86_64")
url="http://www.$_pkgname.net"
license=('GPL')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=("make" "gcc" "sed" "ncurses")
install=$_pkgname.install
source=(
  "$url/downloads/$_pkgname-$pkgver.tar.bz2"
  "$url/downloads/fixes-$pkgver/$_pkgname-$pkgver-ash.patch"
  "$url/downloads/fixes-$pkgver/$_pkgname-$pkgver-date.patch"
  "$url/downloads/fixes-$pkgver/$_pkgname-$pkgver-iplink.patch"
  "$url/downloads/fixes-$pkgver/$_pkgname-$pkgver-lzop.patch"
  "$url/downloads/fixes-$pkgver/$_pkgname-$pkgver-nc.patch"
  "$url/downloads/fixes-$pkgver/$_pkgname-$pkgver-zcat-no-ext.patch"
  config
)
md5sums=(
  '337d1a15ab1cb1d4ed423168b1eb7d7e'
  '538d8cddbdfc449239b25a40bc8d1575'
  'bc381f9ceb3824141c968f5bc4353943'
  '24686ec2750a8703feb57fc9c6aaed1d'
  '14fb3bf7ffaba153b3cad385677b18c3'
  '69eecaae5f812d08655dfdf34b60503f'
  '158c8c4c73db6d920bdd7d4b9b65b2a5'
  '47ae3271f561410d8adf27060780418a'
)

prepare() {
  cd "$_pkgname-$pkgver"
  for i in ../*.patch; do
    patch -p1 <$i
  done
  cp ../config ./.config
}

build() {
  cd "$_pkgname-$pkgver"
  sed '1,1i#include <sys/resource.h>' -i include/libbb.h
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 $_pkgname $pkgdir/usr/bin/$_pkgname
}
