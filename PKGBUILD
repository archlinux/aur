# Maintainer: Daniel Kirchner <daniel.kirchner@ethereum.org>
# Contributor: Afri 5chdn <aur@5chdn.co>

pkgname=solidity-git
pkgver=0.5.0.20181110.9709dfe04
pkgrel=1
pkgdesc="The Solidity Contract-Oriented Programming Language (latest unstable git version)"
arch=('x86_64')
depends=('gcc-libs' 'boost-libs')
optdepends=(
  'z3: SMTChecker support'
  'cvc4: SMTChecker support'
)
makedepends=('cmake' 'git' 'boost')
groups=('ethereum')
url="https://github.com/ethereum/solidity"
license=('GPL3')
source=("${pkgname%-git}::git+https://github.com/ethereum/solidity#branch=develop")
sha256sums=('SKIP')
provides=('solidity')
conflicts=('solidity')

pkgver() {
  cd ${pkgname%-git}
  echo "`grep -m1 "PROJECT\_VERSION" CMakeLists.txt | tr -cd '[[:digit:]].'`.`date +%Y%m%d`.`git log --pretty=format:%h -n 1`"
}

build() {
  cd ${pkgname%-git}
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBoost_USE_STATIC_LIBS=OFF -DTESTS=OFF -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install -C build
}
