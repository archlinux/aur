# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.3.5
pkgrel=3
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "g170e-b20c256x2-s3761649408-d809581368.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.5-nets/g170e-b20c256x2-s3761649408-d809581368.bin.gz"
        "g170-b30c320x2-s2846858752-d829865719.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.5-nets/g170-b30c320x2-s2846858752-d829865719.bin.gz"
        "g170-b40c256x2-s2990766336-d830712531.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.3.5-nets/g170-b40c256x2-s2990766336-d830712531.bin.gz")
sha256sums=('SKIP'
            '872175c02c50486c990aa5c2f9f0099ceece7bfcf024c3194dc7fa4760dca6c1'
            '1229b83725345694e7d08f5cf1f483b7409583dd532a914b0809485a91c3f5e5'
            'fc3e56e0ef92801b28cc0f363f31b4436f0ac0f55dff752f270d3ef27346b0b7')

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
  install -Dm644 $srcdir/g170e-b20c256x2-s3761649408-d809581368.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/g170-b30c320x2-s2846858752-d829865719.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/g170-b40c256x2-s2990766336-d830712531.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

