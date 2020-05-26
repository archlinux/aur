# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.4.2
pkgrel=3
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake' 'boost')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "g170e-b20c256x2-s4384473088-d968438914.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.0/g170-b20c256x2-s4384473088-d968438914.bin.gz"
        "g170-b30c320x2-s3530176512-d968463914.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.0/g170-b30c320x2-s3530176512-d968463914.bin.gz"
        "g170-b40c256x2-s3708042240-d967973220.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.0/g170-b40c256x2-s3708042240-d967973220.bin.gz")
sha256sums=('SKIP'
            'da070fddb45e4d798a63b0be1960d604ad422690d82ac66b1d4ee41e8bf42536'
            '67bd8f67a0ed251d78626ccd23cd4cdbcc880ffc29b641f65cf79ec9d9be83e5'
            '9053c1f0f7834533b34556d3454fe0de8736d5951a2fe5d02c3aebd3fc20240e')

prepare() {
  cd $srcdir/$pkgname
  git submodule init
}

build() {
  cd $srcdir/$pkgname/cpp
  cmake . -DBUILD_MCTS=1 -DUSE_BACKEND=OPENCL
  make 
}

package() {
  cd $srcdir/$pkgname
  install -Dm755 cpp/katago $pkgdir/usr/bin/katago
  install -Dm644 $srcdir/g170e-b20c256x2-s4384473088-d968438914.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/g170-b30c320x2-s3530176512-d968463914.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/g170-b40c256x2-s3708042240-d967973220.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

