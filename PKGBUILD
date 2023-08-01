pkgname=lpython-git
pkgver=r13725.1bc5ad672
pkgrel=1
pkgdesc="Python compiler" 
license=('BSD')
arch=('x86_64')
url="https://lpython.org/"
depends=(llvm)
makedepends=(cmake git)
provides=(lpython)
conflicts=(lpython)
source=(git+https://github.com/lcompilers/lpython.git)
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/lpython"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd lpython
  ./build0.sh
  sed -i "161iset(llvm_libs LLVM)" CMakeLists.txt
  sed -i "s|orcjit native|orcjit|g" CMakeLists.txt
}

build() {
  cmake -S lpython -B build -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_LLVM=ON -DWITH_XEUS=ON -DLPYTHON_BUILD_ALL=ON 
  cmake --build build --target all
}

check() {
  ctest --verbose --output-on-failure --test-dir build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
}

