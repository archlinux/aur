# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.4.5
pkgrel=1
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake' 'boost')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "g170e-b20c256x2-s5303129600-d1228401921.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170e-b20c256x2-s5303129600-d1228401921.bin.gz"
        "g170-b30c320x2-s4824661760-d1229536699.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b30c320x2-s4824661760-d1229536699.bin.gz"
        "g170-b40c256x2-s5095420928-d1229425124.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b40c256x2-s5095420928-d1229425124.bin.gz")
sha512sums=('SKIP'
            '668e6c6e7504a22e105c9ea432bc4c4d0db633b6d8445e19659a0179e72f85fb0955d9b2d132baccb43ccb7a622f88f148f7358bb01b626cf112aba79a8f4e23'
            '32766531050b3e3701cf4abe2895956d132c6cac56c8a5c83f1f2b1439fe3c0ff07bcb4ac342164bc166c3ef85abd0d8492d55514a2aa669b4859fccf49f9654'
            '566f1752222f3c3f7b8076e8796a956ec3b302c5963fae31640604ccd6462fa8dea836548b12b4a44aa9d031152f825a924c95303b886a13803b613f650b7a03')

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
  install -Dm644 $srcdir/g170e-b20c256x2-s5303129600-d1228401921.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/g170-b30c320x2-s4824661760-d1229536699.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/g170-b40c256x2-s5095420928-d1229425124.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

