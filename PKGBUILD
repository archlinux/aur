# vim: set ts=2 sw=2 et:
# Maintainer: Wang Ling <lingwang@wcysite.com>

pkgname=ieda
pkgver=0.949.97089a9e
pkgrel=2
pkgdesc="An pen-source from netlist to GDS EDA platform for ASIC design."
arch=('any')
url="https://github.com/OSCC-Project/iEDA/"
license=('custom:MulanPSL2')
depends=('flex' 'boost-libs' 'google-glog' 'gtest'
         'gflags' 'tcl' 'yaml-cpp' 'libunwind'
         'metis' 'gmp')
makedepends=('gcc' 'cmake' 'ninja' 'boost' 'eigen' 'git')
provides=('iEDA' 'iSTA' 'iPower')
conflicts=()
source=("iEDA::git+https://github.com/OSCC-Project/iEDA.git"
        "local://header.patch")
sha256sums=('SKIP'
            '524c12716ece494676f9f7bbe4b26e64a8c98779cf31d0801cf0149af4219e7a')

prepare() {
  cd iEDA
  git checkout 97089a9ebb889519d7d8914ad42ebd66c94c2a19
  cd ..
  patch --directory="$srcdir/iEDA/" --forward --strip=1 --input="$srcdir/header.patch"
}

build() {
  cmake -B "$srcdir/build" -S "$srcdir/iEDA" -DBUILD_STATIC_LIB:BOOL=ON -DBUILD_GUI:BOOL=ON -DCMAKE_RUNTIME_OUTPUT_DIRECTORY:FILEPATH="$srcdir/build/bin" -DCMAKE_INSTALL_PREFIX='/usr' -Wno-dev
  cmake --build "$srcdir/build" -j 128 --target iEDA iSTA iPower 
}

package() {
  install -Dm755 $srcdir/iEDA/bin/iEDA $pkgdir/usr/bin/iEDA
  install -Dm755 $srcdir/iEDA/bin/iSTA $pkgdir/usr/bin/iSTA
  install -Dm755 $srcdir/iEDA/bin/iPower $pkgdir/usr/bin/iPower
}
