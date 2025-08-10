# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=zoem
pkgname=('zoem' 'zoem-docs')
pkgver=21.341
_pkgver=${pkgver//./-}
pkgrel=7
pkgdesc='An interpretive macro/programming language'
arch=(x86_64)
url='https://micans.org/zoem/'
license=('GPL-2.0-only')
makedepends=('cimfomfa')
options=('makeflags')
source=("https://micans.org/zoem/src/${pkgbase}-${pkgver/./-}.tar.gz"
    "zoem-gcc15-posix-v2.patch")
sha256sums=('370efc7f999572888f4e722cbff40efba395a5435f192e734e7ff87810a68768'
            'c9417239c2881c29e3567cef36ea1a20f48fcda206b0f69306bbd2b1452139f6')

prepare() {
  cd "$srcdir"
  patch -d "$pkgbase-${pkgver/./-}" -p1 < zoem-gcc15-posix-v2.patch
  cd "$pkgbase-${pkgver/./-}/src"
  sed -i '3s/^char/extern char/' "version.h"
  sed -i -e 's/^#D /#define /' -e 's/^#J /#define /' ops.c
}

build() {
  cd "$pkgbase-${pkgver/./-}"
  export LDFLAGS="$LDFLAGS -Wl,--allow-multiple-definition"
  export CFLAGS="$CFLAGS -march=x86-64 -std=c11 -w"
  export CXXFLAGS="$CXXFLAGS -march=x86-64 -std=c++14 -w"
  ./configure --prefix=/usr --enable-maintainer-mode
  make
}

package_zoem() {
  arch=(x86_64)
  depends=('glibc' 'cimfomfa' 'readline')
  pkgdesc='An interpretive macro/programming language'
  install -d 755 ${pkgdir}/usr
  make -C "$pkgbase-${pkgver/./-}" DESTDIR="$pkgdir" install-exec
}

package_zoem-docs() {
  arch=(any)
  pkgdesc='Documentation and examples for zoem language'
  optdepends=('man-db: Read man pages from terminal')
  install -d 755 ${pkgdir}/usr
  make -C "$pkgbase-${pkgver/./-}" DESTDIR="$pkgdir" install-data install-am
}
