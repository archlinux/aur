# Maintainer: Shupei Fan <dymarkfan@outlook.com>
# Contributor: Jiuyang Liu <jiuyang.liu@sifive.com>

pkgname=openroad-git
pkgver=r34136.5114b0e881
pkgrel=2
pkgdesc='A framework for RTL synthesis'
arch=('x86_64')
url='https://theopenroadproject.org/'
license=('BSD-3-Clause')
conflicts=('openroad' 'opensta')
provides=('openroad')
depends=('blas' 'boost-libs' 'tcl' 'python' 'zlib' 'or-tools' 'coin-or-lemon' 'spdlog' 'qt5-base' 'cudd' 'yaml-cpp' 'qt5-charts' 'gtest')
makedepends=('git' 'cmake' 'boost' 'swig' 'bison' 'flex')
source=('git+https://github.com/The-OpenROAD-Project/OpenROAD.git'
        'git+https://github.com/The-OpenROAD-Project/OpenSTA.git'
        'git+https://github.com/The-OpenROAD-Project/abc.git'
        'boost-system.patch'
        )

sha256sums=('SKIP'
           'SKIP'
           'SKIP'
           '302de77a4ed4fa93a0586e0b42e5c98d750295e860dd575d8c129a4a5e0bcdec'
           )

pkgver() {
  cd $srcdir/OpenROAD
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/OpenROAD
  git submodule init
  git config submodule.module/OpenSTA.url $srcdir/OpenSTA
  git config submodule.src/abc.url $srcdir/abc
  git -c protocol.file.allow=always submodule update
  git apply $srcdir/boost-system.patch
}

build() {
  cd $srcdir/OpenROAD
  cmake -B build \
    -DENABLE_TESTS=OFF \
    -DUSE_SYSTEM_ABC=OFF \
    -DUSE_SYSTEM_BOOST=ON \
    -DUSE_SYSTEM_OPENSTA=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=YES \
    -Wno-dev
  cmake --build build
}

# check() {
# }

package() {
  cd $srcdir/OpenROAD
  DESTDIR="$pkgdir" cmake --install build
  # Remove gtest related files, which cause confilct
  rm -r "$pkgdir"/usr/lib/cmake
  rm -r "$pkgdir"/usr/lib/pkgconfig
  rm -r "$pkgdir"/usr/include/gtest
  rm -r "$pkgdir"/usr/include/gmock
  rm "$pkgdir"/usr/lib/{libgmock.a,libgmock_main.a,libgtest.a,libgtest_main.a}
  install -Dm644 "$srcdir/OpenROAD/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

