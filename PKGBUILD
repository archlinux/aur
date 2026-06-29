# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: sudhip n <sudhip at nashi dot u s>

_pkgname='nullfsvfs'
pkgname='nullfsvfs-dkms'
pkgdesc='Virtual black hole file system that behaves like /dev/null'
pkgver=0.27
pkgrel=2
url='https://github.com/abbbi/nullfsvfs'
changelog="$_pkgname.changelog"
arch=('any')
license=('GPL-3.0-or-later')
depends=('dkms' 'make')
options=('!strip')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('faa9d3dc1599f443ca89725138b231b55eed408dd14a89e19ba979b09d28e83b')

prepare() {
  cd "$_pkgname-$pkgver"

  sed -i "s/#MODULE_VERSION#/$pkgver/" debian/nullfsvfs.dkms
  # Remove obsolete CLEAN directive
  sed -i '/^CLEAN=/d' debian/nullfsvfs.dkms
}

package() {
  cd "$_pkgname-$pkgver"

  install -Dm0644 debian/nullfsvfs.dkms \
    "$pkgdir/usr/src/$_pkgname-$pkgver/dkms.conf"
  install -Dm0644 -t "$pkgdir/usr/src/$_pkgname-$pkgver" \
    Makefile nullfsvfs.c
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md

  cd "$pkgdir/usr/share/doc/" && ln -srf "$pkgname" "$_pkgname"
}

# eof
