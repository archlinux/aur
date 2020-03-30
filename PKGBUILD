# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.3.4
pkgrel=1
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "g170e-b20c256x2-s3354994176-d716845198.bin.gz::https://github.com/lightvector/KataGo/releases/download/v${pkgver}/g170e-b20c256x2-s3354994176-d716845198.bin.gz"
        "g170-b30c320x2-s2271129088-d716970897.bin.gz::https://github.com/lightvector/KataGo/releases/download/v${pkgver}/g170-b30c320x2-s2271129088-d716970897.bin.gz"
        "g170-b40c256x2-s2383550464-d716628997.bin.gz::https://github.com/lightvector/KataGo/releases/download/v${pkgver}/g170-b40c256x2-s2383550464-d716628997.bin.gz")
sha256sums=('SKIP'
            'fa73912ad2fc84940e5b9edc78a3ef2d775ed18f3c9a735f4051c378b7526d6e'
            '16a907dca44709d69c64f738c9cce727c91406d10aea212631db30da66bef98a'
            '08721ba6daef132f12255535352c6b15bcc51c56f48761ddfefcd522ec47a3f2')


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
  install -Dm644 $srcdir/g170e-b20c256x2-s3354994176-d716845198.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/g170-b30c320x2-s2271129088-d716970897.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/g170-b40c256x2-s2383550464-d716628997.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

