# Maintainer: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-opencl
pkgver=1.4.3
pkgrel=1
pkgdesc="Baduk engine with no human-provided knowledge."
arch=('x86_64')
provides=("katago")
url="https://github.com/lightvector/KataGo"
license=('MIT')
depends=('libzip' 'ocl-icd' 'boost-libs')
makedepends=('git' 'opencl-headers' 'cmake' 'boost')
source=("${pkgname}::git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "g170e-b20c256x2-s5055114240-d1149032340.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.2-nets/g170e-b20c256x2-s5055114240-d1149032340.bin.gz"
        "g170-b30c320x2-s4432082944-d1149895217.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.2-nets/g170-b30c320x2-s4432082944-d1149895217.bin.gz"
        "g170-b40c256x2-s4679779328-d1149909226.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.2-nets/g170-b40c256x2-s4679779328-d1149909226.bin.gz")
sha512sums=('SKIP'
            'f812c288681754afa60ec676951162cc38cc510c9c4065ce73ad80edc9b63a37980adb74b8da8aabfefdd2e058c3dfbe387ff17b8b9d628c38fea767b3770238'
            '573ed15991ca2f34164ecce64c2535d3426d57120a7fce16f89a15f08fa0af720f97e20249208dd300f6cca3e67d48ed9a790d09e97c8900855707887a20ca0e'
            'ee59ef0dd02084e0ec1ca0643954889e10512a6bd27a1577aa9a7d09d0450c57a68042d29ed70af542530680ebc433e8e683aed5b47fc48d5f42d43303f84121')

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
  install -Dm644 $srcdir/g170e-b20c256x2-s5055114240-d1149032340.bin.gz $pkgdir/usr/share/katago/networks/weights-b20.bin.gz
  install -Dm644 $srcdir/g170-b30c320x2-s4432082944-d1149895217.bin.gz $pkgdir/usr/share/katago/networks/weights-b30.bin.gz
  install -Dm644 $srcdir/g170-b40c256x2-s4679779328-d1149909226.bin.gz $pkgdir/usr/share/katago/networks/weights-b40.bin.gz
  install -Dm644 $srcdir/katago-opencl/LICENSE $pkgdir/usr/share/licenses/katago-opencl/LICENSE
}

