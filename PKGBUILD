# Maintainer: Matti Niemenmaa <matti.niemenmaa+aur ät iki dȯt fi>

pkgname=sc68-svn
pkgver=r571
pkgrel=1
pkgdesc="Atari ST and Amiga music player"
arch=(i686 x86_64)
url='http://sc68.atari.org'
license=(GPL2)
depends=(curl libao zlib)
makedepends=(svn)
conflicts=(sc68)
source=(${pkgname}::svn+svn://svn.code.sf.net/p/sc68/code/)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/$pkgname"
  tools/svn-bootstrap.sh
}

build() {
  cd "$srcdir/$pkgname"
  (cd as68 && ./configure && make as68)
  export PATH="$PWD/as68:$PATH"
  for d in unice68 file68 libsc68 sc68; do
    pushd $d
    ./configure --prefix=/usr
    make
    popd
  done
}

package() {
  cd "$srcdir/$pkgname"
  for d in unice68 file68 libsc68 sc68; do
    pushd $d
    make install DESTDIR="$pkgdir"
    popd
  done
}

# vim:set sw=2 et:
