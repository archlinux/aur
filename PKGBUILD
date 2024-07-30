# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.15.1
pkgrel=1
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake' 'boost')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
	"kata1-b18c384nbt-s9644029184-d4221915864.bin.gz::https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b18c384nbt-s9644029184-d4221915864.bin.gz"
	"kata1-b18c384nbt-s9613886976-d4214024973.bin.gz::https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b18c384nbt-s9613886976-d4214024973.bin.gz")
sha512sums=('SKIP'
            '43e24435e3691aeb095905362420736623153eae8982b54288fb5cc94e1f9d0ab120f9d75e35c8d696e00ea877dc7fcbc8dbb68b4b7038f2bd285fe0719f6359'
            '1feb96d870b044832cd7ab33c08d12727d9baf3f649df3e72200f7407eb90531243e2fe287d398e996b5b5f5461334e949d0fd6b916bbd79709e89dd41c6b80c')

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
  install -Dm644 $srcdir/kata1-b18c384nbt-s9644029184-d4221915864.bin.gz $pkgdir/usr/share/katago/networks/latest_net.bin.gz
  install -Dm644 $srcdir/kata1-b18c384nbt-s9613886976-d4214024973.bin.gz $pkgdir/usr/share/katago/networks/strongest_conf.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}
