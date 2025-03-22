# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=cvs-fast-export
pkgver=1.68
pkgrel=3
pkgdesc="Export RCS or CVS history as a fastimport stream."
arch=('x86_64')
depends=('cvs' 'python')
makedepends=('asciidoctor')
url="http://www.catb.org/esr/$pkgname/"
license=('GPL2')
source=("https://gitlab.com/esr/cvs-fast-export/-/archive/$pkgver/cvs-fast-export-$pkgver.tar.gz"
        0001-Allow-in-branch-names.patch)
b2sums=('2bfd6738e51b20630dadb538f447cf41a8030cf4b14a344f2bb185df49d73e4a766d3deb778b01e5e3fba9a634a5486ab9f9dde4a22c87e4ca41a3eb2d5b4601'
        'cbfc2f7060b1aa9758397197d0e9e5cee27ef4d1e67a027f08fdd0986c3f6830b699c428e6cda2e54e5072b9d2786ce4cc40b79d93437d45fbdd4a5c327b3342')

prepare() {
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  # Remove "-Werror", for now...
  make GCC_WARNINGS1="-Wall -Wextra -Wpointer-arith -Wstrict-prototypes" "$pkgname"{,.1} cvssync.1
}

package() {
  cd "$pkgname-$pkgver"

  make prefix=/usr DESTDIR="$pkgdir" install
}
