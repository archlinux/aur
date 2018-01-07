# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mpie <michael.kyne-phillips1@ntlworld.com>

pkgname=parrot
pkgver=8.1.0
_rel=stable
#_rel=devel
pkgrel=6
pkgdesc="Standalone VM that can execute bytecode compiled dynamic languages"
arch=('x86_64')
url="http://www.parrotcode.org/"
license=('GPL')
depends=('icu' 'openssl' 'libffi' 'gmp')
makedepends=('perl-json')
optdepends=('freeglut')
options=('!makeflags')
source=(ftp://ftp.parrot.org/pub/parrot/releases/$_rel/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('436d34ae21b20453dfdc12c86fa671cd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  perl Configure.pl --prefix=/usr \
    --parrot_is_shared \
    --disable-rpath \
	--mandir=/usr/share/man \
    --optimize
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:$(pwd)/blib/lib"
  make all parrot_utils docs html
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install-dev
  sed -i "s#"$srcdir"#/usr/src#" \
    "$pkgdir"/usr/lib/parrot/$pkgver/tools/lib/Parrot/Config/Generated.pm
}
