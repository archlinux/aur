# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>

pkgname=lc0
pkgver=0.31.2
pkgrel=1
pkgdesc="UCI-compliant chess engine designed to play chess via neural network, \
		       specifically those of the LeelaChessZero project."
arch=('x86_64')

url="https://lczero.org/"
license=('GPL-3.0-or-later')

depends=('ocl-icd' 'openblas')
makedepends=('git' 'meson' 'eigen' 'clang' 'opencl-headers' 'blas-openblas')
#checkdepends=('gtest')
optdepends=("blas-openblas: Backend for use with CPUs"
	    "cudnn: Backend for use with nvidia GPUs"
	    "opencl-driver: Backend for use with OpenCL")

_weights="weights_hanse-69722-vf2.gz"
install=lc0.install
source=("$pkgname"
	"$pkgname-$pkgver.tar.gz::https://github.com/LeelaChessZero/$pkgname/archive/v$pkgver.tar.gz"
	"$_weights::https://storage.lczero.org/files/networks-contrib/hanse-69722-vf2.gz")
sha256sums=('cc9c40a508afd0aa2032a6eb309f69e8731a0a7d01f6601a653ae4e509772bd7'
            '6dea1e67e33ec0513853df4fef24d51318e47a6cf0f35c0491cce5c1547dc023'
            'a519393981e68112628f739e261303987477058027f73c584c1e89302ec55b87')

noextract=('$_weights')

_common='55e1b38'

prepare() {
  cd "$srcdir/$pkgname-$pkgver/libs"
  if [ -d ./lczero-common ]; then {
    rm -rf lczero-common
  }
  fi
  git clone https://github.com/LeelaChessZero/lczero-common.git
  cd "lczero-common"
  git checkout $_common
}

build() {
  cd "$pkgname-$pkgver"
  ./build.sh 
}

check() {
  cd "$pkgname-$pkgver/build/release"
  ./chessboard_test
  ./encoder_test
  ./hashcat_test
  ./optionsparser_test
  ./position_test
  ./syzygy_test
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/build/release/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
  install -Dm644 "$srcdir/${_weights}" "$pkgdir/usr/lib/$pkgname/${_weights}"
}
