# Contributor: Maxime Arthaud <maxime@arthaud.me>

pkgname='ikos'
pkgver='3.5'
pkgrel='1'
pkgdesc='Static analyzer for C and C++ developed by NASA'
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/nasa-sw-vnv/ikos'
license=('custom:NOSA 1.3')
depends=('gmp'
         'boost-libs'
         'python'
         'python-pygments'
         'sqlite'
         'intel-tbb'
         'llvm14'
         'llvm14-libs'
         'clang14'
         'ppl')
makedepends=('cmake'
             'boost'
             'llvm14')
source=($pkgname'-'$pkgver'.tar.gz::https://github.com/NASA-SW-VnV/'${pkgname}'/archive/refs/tags/v'${pkgver}'.tar.gz')
b2sums=('7af9fd5fe20d7ef86f9a550b542a59db4ada853c7a192b508067c17c4d3127b2a7594b1e03888085cbf941d7a35ea5a663eb8b3efc9e1f2026a8530340d9c324')

build() {
  cd $srcdir'/ikos-'$pkgver
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cd $srcdir'/ikos-'$pkgver'/build'
  cmake \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DLLVM_CONFIG_EXECUTABLE='/usr/bin/llvm-config-14' \
    -DIKOS_LINK_LLVM_DYLIB='ON' \
    ..
  make
}

#check() {
#  cd $srcdir'/ikos-'$pkgver'/build'
#  make check
#}

package() {
  cd $srcdir'/ikos-'$pkgver'/build'
  make DESTDIR="$pkgdir" install
  install -Dm644 $srcdir'/ikos-'$pkgver'/LICENSE.txt' $pkgdir'/usr/share/licenses/ikos/LICENSE'
}
