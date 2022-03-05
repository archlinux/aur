# Maintainer: Ivan Marquesi Lerner <ivanmlerner@protonmail.com>

pkgname=lc0
pkgver=0.28.2
pkgrel=2
pkgdesc="UCI-compliant chess engine designed to play chess via neural network, \
		       specifically those of the LeelaChessZero project."
arch=('x86_64')

url="https://lczero.org/"
license=('GPL3')

depends=('ocl-icd' 'zlib' 'opencl-driver' 'clang')
makedepends=('meson' 'eigen' 'opencl-headers' 'openblas-cblas-git')
checkdepends=('gtest')
optdepends=("cudnn: Neural network library for use with nvidia GPUs")

_weights="weights_hanse-69722-vf2.gz"
install=lc0.install
source=("$pkgname"
	"$pkgname-$pkgver.tar.gz::https://github.com/LeelaChessZero/$pkgname/archive/v$pkgver.tar.gz"
	"lczero-common-master.tar.gz::https://github.com/LeelaChessZero/lczero-common/archive/master.tar.gz"
	"$_weights::https://storage.lczero.org/files/networks-contrib/hanse-69722-vf2.gz")
sha256sums=('10f0fc4126bd2c9303bd2474c0d9ef488ceb7690cbca7c7d8ace61679ae97b49'
            '5fe8a39c82a9be2b185b57d093417ed290fc36596cb23bc731e05a57fa70f65c'
            'fa3671e89e647c7da931b1934c66b4de129681d9b0a8df22ce932596357cda1a'
            'a519393981e68112628f739e261303987477058027f73c584c1e89302ec55b87')
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
