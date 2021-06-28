# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>

pkgname=parrot
pkgver=8.1.0
_rel=stable
#_rel=devel
pkgrel=7
pkgdesc='Standalone VM that can execute bytecode compiled dynamic languages'
arch=(x86_64)
url='http://parrot.org/'
license=(GPL)
depends=(gmp icu libffi openssl)
makedepends=(perl-json perl-pod-parser)
optdepends=(freeglut)
options=('!makeflags')
source=("ftp://ftp.parrot.org/pub/parrot/releases/$_rel/$pkgver/$pkgname-$pkgver.tar.bz2")
b2sums=('3dc3397f74b15505ddd9c4fb361a4304b9bddbddb65d79e9e8f7c81ab1a00f85f652a5096a8b7a041f5fa96cbc2f399d2833fd5de4f9cd2c1e816b3c1aac0fd8')

build() {
  cd $pkgname-$pkgver
  perl Configure.pl \
    --disable-rpath \
    --mandir=/usr/share/man \
    --optimize \
    --parrot_is_shared \
    --prefix=/usr
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$(pwd)/blib/lib"
  make all parrot_utils docs html
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install-dev
  sed -i "s,"$srcdir",/usr/src," \
    "$pkgdir/usr/lib/parrot/$pkgver/tools/lib/Parrot/Config/Generated.pm"
}
