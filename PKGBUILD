# Maintainer: Deian Stefan
# Partly based on https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=apron

_pkgname=apron
pkgname=apron-git
pkgver=r237.9ad5af8
pkgrel=1
pkgdesc='The Apron Numerical Abstract Domain Library'
arch=('any')
url='https://github.com/antoinemine/apron'
license=('LGPL')
depends=('gmp' 'mpfr' 'ppl')
makedepends=()
provides=('apron')
conflicts=('apron')
source=('git://github.com/antoinemine/apron.git')
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir
}

build() {

  cd "$srcdir/apron"

  ./configure -no-cxx -no-java -no-ocamlfind -no-ocaml-plugins
  make

}

package() {
 cd "$srcdir/apron"
 make APRON_PREFIX="$pkgdir"/usr install

 # fix include/ permissions
 find "$pkgdir"/usr/include -type d -exec chmod 755 '{}' ';'
 find "$pkgdir"/usr/include -type f -exec chmod 644 '{}' ';'

 # remove test binaries
 rm "$pkgdir"/usr/bin/*test*
}
