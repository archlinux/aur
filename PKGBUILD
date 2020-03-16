# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.3.3
pkgrel=2
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}-nets"
        "g170e-b20c256x2-s2971705856-d633407024.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.3-nets/g170e-b20c256x2-s2971705856-d633407024.bin.gz"
        "g170-b30c320x2-s1840604672-d633482024.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.3-nets/g170-b30c320x2-s1840604672-d633482024.bin.gz"
        "g170-b40c256x2-s1929311744-d633132024.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.3-nets/g170-b40c256x2-s1929311744-d633132024.bin.gz")
sha256sums=('SKIP'
            'dba074142b9da4822ed9ad91c676372fd943c0c115b7975773dd292b9e96a899'
            '2f066112e163de396f5bd56b94162419f16ff48e9fb9836c35a711122ecc9a32'
            'acbdd1aa883d7d8d60101cdcd0c75754ec25dba66b4d60d8d284427cf645124d')


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
  install -Dm644 $srcdir/g170e-b20c256x2-s2971705856-d633407024.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/g170-b30c320x2-s1840604672-d633482024.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/g170-b40c256x2-s1929311744-d633132024.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

