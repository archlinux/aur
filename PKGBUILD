# Maintainer: Fabian Maurer <dark.shadow4@web.de>
pkgname=libbcd
pkgver=1.1
pkgrel=3
pkgdesc="Bayesian Collaborative Denoiser for Monte Carlo Rendering "
arch=('x86_64')
url="https://github.com/superboubek/bcd"
license=('BSD')
depends=('zlib' 'eigen' 'nlohmann-json' 'openexr')
makedepends=('cmake')
source=("https://github.com/superboubek/bcd/archive/v1.1.tar.gz"
        "fix-dependencies.patch")
md5sums=('582b77cc22088ad42123f626b3190aee'
         '2ab37640c1e6658d3241136f0ad7c1c3')

build() {
  cd "$srcdir/bcd-$pkgver"

  patch -Np1 < "$srcdir/fix-dependencies.patch"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
	-DBCD_USE_CUDA=OFF \
	-DBCD_BUILD_GUI=OFF \
    .
  make
}

package() {
  cd "$srcdir/bcd-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cp -dr --no-preserve=ownership include "$pkgdir/usr/"

  make DESTDIR="$pkgdir" install
}
