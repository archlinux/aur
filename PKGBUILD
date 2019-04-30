# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=approxmc-git
pkgver=3.0.r32.g1022b19
pkgrel=1
pkgdesc="Approximate Model Counter for SAT/CNF"
arch=('x86_64')
url="https://github.com/meelgroup/ApproxMC"
license=('MIT')
provides=('approxmc')
conflicts=('approxmc')
depends=('cryptominisat5-git')  # -git version provides the needed Gaussian features
makedepends=('git' 'cmake' 'help2man' 'boost')
source=("git+https://github.com/meelgroup/ApproxMC/")
md5sums=('SKIP')

pkgver() {
    cd ApproxMC
    git describe --long --tags | sed 's|^releases/||;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ApproxMC
  # cmake is very stubborn about the DATAROOTDIR
  sed -i 's|}/man/man1|}/share/man/man1|' CMakeLists.txt
}

build() {
  cd ApproxMC
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ../
  make
}

package() {
  cd ApproxMC
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd build
  make install DESTDIR="$pkgdir"
}

