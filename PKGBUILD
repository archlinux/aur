# Maintainer: sgtbigman <sgtbigman at gmail dot com>
pkgname=openmalaria
pkgver=36.0
pkgrel=1
pkgdesc="A simulator of malaria epidemiology and control."
arch=('x86_64' 'i686')
url="https://github.com/SwissTPH/openmalaria"
license=('GPL2')
depends=('gcc-libs-multilib' 'gsl' 'xerces-c')
makedepends=('boost' 'cmake' 'python2' 'xsd' 'zlib')
source=("https://github.com/SwissTPH/openmalaria/archive/schema-${pkgver}.tar.gz"
        "$pkgname.sh")
sha256sums=('9b5b6c8383b02b36a9f08d43e79da633518000c485b3505d370f6fe7c0b34152'
            '3b4e42e0d5663485737a4d658df62e7e4901b059ca3bd19f4883158e49a2652c')

build() {
  cd "$pkgname-schema-$pkgver"

  mkdir -p build && cd build
  cmake -DCMAKE_BUILD_TYPE=Release -D PYTHON_EXECUTABLE=/usr/bin/python2 ..
  make
}

check() {
  cd "$pkgname-schema-$pkgver/build"

  make test
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cd "$pkgname-schema-$pkgver"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 build/openMalaria "$pkgdir/usr/bin/"
  install -Dm644 build/schema/scenario_current.xsd "$pkgdir/usr/share/$pkgname/"
  install -Dm644 test/densities.csv "$pkgdir/usr/share/$pkgname/"
  install -Dm644 test/autoRegressionParameters.csv "$pkgdir/usr/share/$pkgname/"
}
