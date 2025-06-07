# Contributor: Andreas Baumann <abaumann at yahoo dot com>
# Contributor: Chris Brannon <cmbrannon (at) cox.net>

pkgname=pcc-git
pkgver=20250607
pkgrel=2
pkgdesc="A Portable C Compiler."
arch=('i686' 'x86_64')
url="https://github.com/PortableCC/"
license=('custom')
makedepends=('bison' 'flex' 'git')
options=('!lto')
depends=('pcc-libs')
provides=(pcc)
conflicts=(pcc)
source=(
  $pkgname::git+https://github.com/PortableCC/pcc
  license
  'pcc-revert-negrel.patch'
  'pcc-true-false.patch'
)
md5sums=('SKIP'
         '51f6cc02b26af53f26cfe87494ca5c87'
         'd3c3f1a1471418a91e1a72d7f8911c29'
         '3adb1e21863e7b6c4b944f8cf7a4cd91')
pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --date=format:"%Y%m%d" --format="%ad"
}

prepare() {
  cd "$srcdir/$pkgname"

  # true and false are reserved
  patch -p1 -i "${srcdir}/pcc-true-false.patch"

  # negrel is still needed in parts of trees.c
  patch -p1 -i "${srcdir}/pcc-revert-negrel.patch"
}

build() {
  cd "$srcdir/$pkgname"

  export CFLAGS+=" -fcommon -Wno-int-conversion "

  ./configure --prefix=/usr --libexecdir=/usr/lib/pcc || return 1

  make CC=gcc || return 1
}

package() {
  cd "$srcdir/$pkgname"

  make DESTDIR=$pkgdir install || return 1
  cd "$pkgdir/usr/share/man/man1"

  mv ${pkgdir}/usr/share/man/man1/cpp.1 ${pkgdir}/usr/share/man/man1/cpp.1pcc

  install -D -m0644 ${srcdir}/license ${pkgdir}/usr/share/licenses/${pkgname}/license
}
