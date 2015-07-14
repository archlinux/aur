# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=pbdagcon-git
pkgver=r62.a6790e2
pkgrel=1
pkgdesc="sequence consensus algorithm implementation based on using directed acyclic graphs to encode multiple sequence alignment"
arch=('i686' 'x86_64')
url="https://github.com/PacificBiosciences/pbdagcon"
license=('custom')
depends=('python2')
makedepends=('boost')
conflicts=('pbdagcon')
provides=('pbdagcon')

source=("$pkgname::git+https://github.com/PacificBiosciences/pbdagcon"
        python2.patch)

md5sums=('SKIP'
         '839716278029c906ecd20523fef9e3c5')

pkgver() {
  cd $srcdir/$pkgname

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname

  make update-submodule

  patch -Np1 -r - -i $srcdir/python2.patch || true

  sed -e '/include boost.mk/d' \
      -e 's|$(BOOST_HEADERS)|/usr/include|' \
      -i src/cpp/Makefile
}

build() {
  cd $srcdir/$pkgname

  make build-submodule
  make
}

package() {
  cd $srcdir/$pkgname

  for file in src/cpp/pbdagcon src/*.py ; do
    install -Dm755 $file $pkgdir/usr/bin/$(basename $file .py)
  done

  install -Dm644 <(echo unknown) $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
