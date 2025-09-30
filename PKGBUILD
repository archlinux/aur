# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Nicolas Stalder <n+archlinux@stalder.io>
# Contributor: Shawn Nock <shawn@monadnock.ca>

pkgname='littlefs-fuse'
pkgver=2.7.14
pkgrel=1
pkgdesc='A FUSE wrapper that puts the littlefs in user-space'
url='https://github.com/littlefs-project/littlefs-fuse'
arch=('aarch64' 'x86_64')
license=('BSD-3-Clause')  # SPDX-License-Identifier: BSD-3-Clause
depends=('fuse2' 'glibc')
source=("littefs-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Make sure the binary has “FULL RELRO”:
  # shellcheck disable=SC2016
  sed -i '/^ifdef DEBUG/i override CFLAGS += $(LDFLAGS)' Makefile
  # If user has chosen a compiler, use that one
  sed -i 's/^CC = cc/CC ?= cc/g' Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -vDm0755 lfs        -t "$pkgdir/usr/bin"
  install -vDm0644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
  install -vDm0644 README.md  -t "$pkgdir/usr/share/doc/$pkgname"
}

sha256sums=(
  '17afd073ed6755c0ecb78284512c5758eaab8580611552fc8d3c4a33dab296eb'
)
b2sums=(
  'd03cc5e3daca52da03b873add01c0cd8892ca264245ba107d5726d9a0db1042e9d5a2fbf1de107ba7dfd836611adb96fb2d5b3d39a7168b74363eb3a63a793c7'
)

# eof
