# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>

pkgname=lc0
pkgver=0.28.2
pkgrel=7
pkgdesc="UCI-compliant chess engine designed to play chess via neural network, \
		       specifically those of the LeelaChessZero project."
arch=('x86_64')

url="https://lczero.org/"
license=('GPL3')

depends=('ocl-icd' 'opencl-driver' 'openblas')
makedepends=('git' 'meson' 'eigen' 'clang' 'opencl-headers' 'cblas')
checkdepends=('gtest')
optdepends=("cudnn: Neural network library for use with nvidia GPUs")

_weights="weights_hanse-69722-vf2.gz"
install=lc0.install
source=("$pkgname"
	"$pkgname-$pkgver.tar.gz::https://github.com/LeelaChessZero/$pkgname/archive/v$pkgver.tar.gz"
	"$_weights::https://storage.lczero.org/files/networks-contrib/hanse-69722-vf2.gz")
sha256sums=('cc9c40a508afd0aa2032a6eb309f69e8731a0a7d01f6601a653ae4e509772bd7'
            '5fe8a39c82a9be2b185b57d093417ed290fc36596cb23bc731e05a57fa70f65c'
            'a519393981e68112628f739e261303987477058027f73c584c1e89302ec55b87')
noextract=('$_weights')

prepare() {
  cd "$srcdir/$pkgname-$pkgver/libs"
  if [ -d ./lczero-common ]; then {
    rm -rf lczero-common
  }
  fi
  git clone https://github.com/LeelaChessZero/lczero-common.git
}

build() {
  cd "$pkgname-$pkgver"
  ./build.sh 
}

check() {
  cd "$pkgname-$pkgver/build/release"
  gtester chessboard_test
  gtester encoder_test
  gtester hashcat_test
  gtester optionsparser_test
  gtester position_test
  gtester syzygy_test
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$pkgname-$pkgver/build/release/$pkgname" "$pkgdir/usr/lib/$pkgname/$pkgname"
  install -Dm644 "$srcdir/${_weights}" "$pkgdir/usr/lib/$pkgname/${_weights}"
}
