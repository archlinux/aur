# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=glucose
pkgver=4.1
pkgrel=1
pkgdesc="Parallel SAT solver based on Minisat, with glue clauses."
arch=('i686' 'x86_64')
url="http://www.labri.fr/perso/lsimon/glucose/"
license=('MIT')
depends=('gcc-libs' 'zlib')
# sigh, no versions
source=("http://www.labri.fr/perso/lsimon/downloads/softwares/glucose-syrup-$pkgver.tgz")
md5sums=('7f13be91b3cd71bd02d4f37570fee011')

prepare() {
  cd "$srcdir/glucose-syrup-$pkgver"
  if [[ $CARCH == "armv7h" ]]; then
    sed -i -e 's/ & ~_FPU_EXTENDED//' -e 's/ | _FPU_DOUBLE//' {simp,parallel}/Main.cc
  fi
}

build() {
  export MROOT="$srcdir/$pkgname"
  # r = release, s = static
  cd "$srcdir/glucose-syrup-$pkgver/simp"
  make r
  cd "$srcdir/glucose-syrup-$pkgver/parallel"
  make r
}

package() {
  cd "$srcdir/glucose-syrup-$pkgver"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"

  cd "simp"
  install -Dm755 glucose_release "$pkgdir/usr/bin/glucose"
  cd "../parallel"
  install -Dm755 glucose-syrup_release "$pkgdir/usr/bin/glucose-syrup"

}

# vim:set ts=2 sw=2 et:
