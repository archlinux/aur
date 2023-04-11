# Maintainer: Shupei Fan <dymarkfan@outlook.com>

pkgname=lsoracle-git
pkgver=r358.febd1523
pkgrel=1
pkgdesc='Logic Synthesis oracle (with yosys plugin enabled)'
arch=('x86_64')
url='https://github.com/lnis-uofu/LSOracle'
license=('MIT')
conflicts=('lsoracle')
provides=('lsoracle')
depends=('yosys' 'python' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'gtest')
source=('git+https://github.com/lnis-uofu/LSOracle.git')
        # 'git+https://github.com/lnis-uofu/alice.git'
        # 'git+https://github.com/lsils/kahypar.git'
        # 'git+https://github.com/lsils/mockturtle.git')

sha256sums=('SKIP')

pkgver() {
  cd $srcdir/LSOracle
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/LSOracle
  git submodule init
  git submodule update -- lib/OpenSTA
  git submodule update -- lib/json
  git submodule update -- lib/mockturtle
  git submodule update -- lib/kahypar
  git submodule update -- lib/alice
  git submodule update -- lib/json

  cd $srcdir/LSOracle/lib/kahypar
  git submodule init
  git submodule update

  cd $srcdir/LSOracle/lib/alice
  git submodule init
  git submodule update
}

build() {
  cmake -B build -S "$srcdir/LSOracle" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DYOSYS_PLUGIN=ON \
    -DYOSYS_INCLUDE_DIR=/usr/share/yosys/include \
    -DENABLE_OPENSTA=ON \
    -DENABLE_ABC=ON \
    -DLOCAL_PYBIND=OFF \
    -DLOCAL_BOOST=OFF \
    -DLOCAL_GTEST=OFF \
    -Wno-dev
  cmake --build build \
    --target lsoracle \
    --target yosys-plugin
}

# check() {
# }

package() {
  install -Dm755 build/core/lsoracle "$pkgdir/usr/bin/lsoracle"
  install -Dm755 build/yosys-plugin/oracle.so "$pkgdir/usr/lib/oracle_yosys.so"

  install -dm755 "$pkgdir/$(yosys-config --datdir)/plugins/"
  ln -s /usr/lib/oracle_yosys.so "$pkgdir/$(yosys-config --datdir)/plugins/oracle.so"

  install -Dm644 "$srcdir/LSOracle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

