# Maintainer: gilcu3
# Previous Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=glucose
pkgver=4.2.1
pkgrel=1
pkgdesc="Parallel SAT solver based on Minisat, with glue clauses."
arch=('i686' 'x86_64')
url="http://www.labri.fr/perso/lsimon/glucose/"
license=('MIT')
depends=('gcc-libs' 'zlib')
# sigh, no versions
source=("https://github.com/audemard/glucose/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a6d4af223e851b50ec6cdbd34b10ce7c8958e372b6c590c589b6d976a03c9a0d')

prepare() {
  cd "$srcdir/glucose-$pkgver"
  if [[ $CARCH == "armv7h" ]]; then
    sed -i -e 's/ & ~_FPU_EXTENDED//' -e 's/ | _FPU_DOUBLE//' {simp,parallel}/Main.cc
  fi
}

build() {
  export MROOT="$srcdir/$pkgname"
  # r = release, s = static
  cd "$srcdir/glucose-$pkgver/simp"
  make r
  cd "$srcdir/glucose-$pkgver/parallel"
  make r
}

package() {
  cd "$srcdir/glucose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "simp"
  install -Dm755 glucose_release "$pkgdir/usr/bin/glucose"
  cd "../parallel"
  install -Dm755 glucose-syrup_release "$pkgdir/usr/bin/glucose-syrup"

}

# vim:set ts=2 sw=2 et: