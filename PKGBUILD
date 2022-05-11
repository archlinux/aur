# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: flovo <flovo-git-commit@f-voegele.de>

pkgname=katago-cuda
pkgver=1.11.0
pkgrel=2
pkgdesc='Baduk engine with no human-provided knowledge'
arch=(x86_64)
provides=(katago)
url='https://github.com/lightvector/KataGo'
license=(MIT)
depends=(boost-libs libzip ocl-icd)
makedepends=(boost cmake cuda git ninja)
source=("$pkgname::git+https://github.com/lightvector/KataGo#tag=v$pkgver"
        "g170e-b20c256x2-s5303129600-d1228401921.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170e-b20c256x2-s5303129600-d1228401921.bin.gz"
        "g170-b30c320x2-s4824661760-d1229536699.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b30c320x2-s4824661760-d1229536699.bin.gz"
        "g170-b40c256x2-s5095420928-d1229425124.bin.gz::https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b40c256x2-s5095420928-d1229425124.bin.gz")
b2sums=('SKIP'
        '294f42448e3c561520990f33e1681052de06afa790c3c8bb3544c2f4f03df40ffa6714158f072fce020f5600574bc55ce1a85c6d8eb675ad78f3b3e19ddd3cd3'
        '11279b147955da817a8d08de83509fe92b03fd11b03b630bb08454ccfe5e95a45a9079420e53f090ec6d03518478da9c5e1b2e3569b5403885531a6edf640c3a'
        'c59da2e4594c51862fc8ffaa21dcf362761240cfcaa06a408689024c622d9e06b2edce1b53e01ea266db44735895eca08a41a2064832fd7568b2a1ca0e713dac')

prepare() {
  cd $pkgname
  git submodule init
}

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D NO_GIT_REVISION=1 \
    -D USE_BACKEND=CUDA \
    -G Ninja \
    -S $pkgname/cpp
  ninja -C build
}

package() {
  install -Dm755 build/katago "$pkgdir/usr/bin/katago"
  install -Dm644 g170e-b20c256x2-s5303129600-d1228401921.bin.gz "$pkgdir/usr/share/katago/networks/weights-b20.bin.gz"
  install -Dm644 g170-b30c320x2-s4824661760-d1229536699.bin.gz "$pkgdir/usr/share/katago/networks/weights-b30.bin.gz"
  install -Dm644 g170-b40c256x2-s5095420928-d1229425124.bin.gz "$pkgdir/usr/share/katago/networks/weights-b40.bin.gz"
  install -Dm644 $pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
