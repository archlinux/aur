# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.3.3
pkgrel=1
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "weights-b20.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.3/g170e-b20c256x2-s2430231552-d525879064.bin.gz"
        "weights-b30.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.3/g170-b30c320x2-s1287828224-d525929064.bin.gz"
        "weights-b40.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.3/g170-b40c256x2-s1349368064-d524332537.bin.gz")
sha256sums=('SKIP'
            '770f65c5cfa6e7ebba1b972768406668afdfc2e65d61e45b8cb468677f5fea4d'
            '3c2864fda18d8bc595b1fb65ec25cc998ac90cd203a6269c56691e195297c325'
            '74ea1a4e9c0a461b9fb35a297d11f10e3fcfee32e5b710720784120fe52cbad0')


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
  install -Dm644 $srcdir/weights-b20.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/weights-b30.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/weights-b40.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

