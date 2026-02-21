# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer : JSkier <jskier at gmail dot com>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=hyperscan-git
pkgver=5.4.2.r2.g78d23dab
pkgrel=1
pkgdesc="High-performance multiple regex matching library"
arch=('i686' 'x86_64')
url="https://www.hyperscan.io/"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'boost' 'cmake' 'ragel')
provides=("hyperscan=$pkgver")
conflicts=('hyperscan')
options=('staticlibs' '!lto')
source=("git+https://github.com/intel/hyperscan.git")
sha256sums=('SKIP')


prepare() {
  cd "hyperscan"

  # https://github.com/intel/hyperscan/issues/292#issuecomment-762635447
  sed -i -e 's|\[^ \]|\[^ @\]|g' "cmake/build_wrapper.sh"
}

pkgver() {
  cd "hyperscan"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "hyperscan"

  cmake \
    -B "_build" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DBUILD_STATIC_AND_SHARED=ON \
    -DCMAKE_POLICY_VERSION_MINIMUM="3.5" \
    ./
  cmake --build "_build"
}

package() {
  cd "hyperscan"

  DESTDIR="$pkgdir" cmake --install "_build"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/hyperscan"
}
