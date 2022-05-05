# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=npt
pkgver=1.1.1
pkgrel=2
pkgdesc='ANSI Common Lisp Implementation'
arch=('x86_64')
url='https://github.com/nptcl/npt'
license=('Unlicense')
depends=('glibc' 'readline')
makedepends=('git')
_commit='55cff1db7e6f12f7e87e8ab26393792d33734d62'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # fix typo
  sed \
    -i Makefile.am \
    -e 's/incldue/include/g'
}

build() {
  cd "$pkgname"

  ./bootstrap.sh

  ./configure \
    --prefix=/usr \
    --with-readline

  make
}

package() {
  cd "$pkgname"

  # binary
  make install DESTDIR="$pkgdir"  

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" docs/*.html
}
