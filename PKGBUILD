# Maintainer: gilcu3 <gilcu3 at gmail dot com>
# Previous Maintainer: Thomas Pointhuber <thomas.pointhuber@gmx.at>
pkgname=limboole
pkgver=1.2
pkgrel=2
pkgdesc="A simple tool for checking satisfiability respectively tautology on arbitrary structural formulas."
arch=('x86_64')
url="http://fmv.jku.at/limboole/"
license=('GPL3') # binary falls under the license from depqbf
source=("http://fmv.jku.at/limboole/$pkgname$pkgver.tgz"
        "http://fmv.jku.at/picosat/picosat-960.tar.gz"
        "https://codeload.github.com/lonsing/depqbf/tar.gz/version-6.03")
sha256sums=('fc7ec6db5088da2846937e472668d283fba46ca8e840aaf6f13ea11619637cb6'
            'edb3184a04766933b092713d0ae5782e4a3da31498629f8bb2b31234a563e817'
            '9684bb1562bfe14559007401f52975554373546d3290a19618ee71d709bce76e')

build() {
  # A comma (,) in the CFLAGS variable was causing a compile error
  # in picosat, which is also compiled inside depqbf
  CFLAGS="${CFLAGS/,/\\,}"
  
  # build picosat for static binding
  rm -rf "picosat"
  mv "picosat-960" "picosat"
  
  cd "picosat"
  ./configure
  make
  cd "../"

  # build depqbf
  rm -rf "depqbf"
  mv "depqbf-version-6.03" "depqbf"
  cd "depqbf"
  ./compile.sh
  
  # build limboole
  cd "../$pkgname$pkgver"
  mkdir -p log
  ./configure.sh --picosat --depqbf
  make
}


check() {
  echo "Tests are currently broken, re-enable once they work."
  # cd "$pkgname$pkgver"
  # ./testlimboole
}


package() {
  cd "$pkgname$pkgver"
  install -d "$pkgdir/usr/bin"
  cp limboole "$pkgdir/usr/bin/limboole"
}
