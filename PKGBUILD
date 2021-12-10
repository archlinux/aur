# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>

pkgname=lc0
pkgver=0.28.0
pkgrel=1
pkgdesc="UCI-compliant chess engine designed to play chess via neural network, \
		       specifically those of the LeelaChessZero project."
arch=('x86_64')

url="https://lczero.org/"
license=('GPL3')

depends=('ocl-icd' 'zlib' 'opencl-driver')
makedepends=('meson' 'eigen' 'opencl-headers' 'openblas-cblas-git')
checkdepends=('gtest')
optdepends=("cudnn: Neural network library for use with nvidia GPUs")

_weights="weights_sergio-v_256x20-T40-1541.pb.gz"
install=lc0.install
source=("$pkgname"
	"$pkgname-$pkgver.tar.gz::https://github.com/LeelaChessZero/$pkgname/archive/v$pkgver.tar.gz"
	"lczero-common-master.tar.gz::https://github.com/LeelaChessZero/lczero-common/archive/master.tar.gz"
	"$_weights::https://www.comp.nus.edu.sg/~sergio-v/t40/256x20/256x20-t40-1541.pb.gz")
md5sums=('8ef8809da2c627dd2472859b157bb408'
         'eba27fccaa7e3e162abda751fa77366b'
         'f0111da33207c6941ff06f268fba675f'
         '59da4859de827d3cd75866c40920f8a0')
noextract=('$_weights')

prepare() {
  cp -PRu "$srcdir/lczero-common-master/proto" "$srcdir/$pkgname-$pkgver/libs/lczero-common/"
  rm -dr "$srcdir/lczero-common-master"
}

build() {
  cd "$pkgname-$pkgver"
  sh build.sh 
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
