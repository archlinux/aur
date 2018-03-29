
pkgname=fcd
pkgver=3
pkgrel=1
arch=('x86_64')
pkgdesc="LLVM-based native program optimizing decompiler"
depends=('llvm40' 'capstone')
makedepends=('clang')
license=('GPL')
url="http://zneak.github.io/fcd/"
source=("https://github.com/zneak/fcd/archive/llvm-4.0.tar.gz")
sha1sums=('SKIP')

prepare()
{
  cd "$srcdir/fcd-llvm-4.0"
  sed -i "s| python | python2 |g" CMakeLists.txt
}

build()
{
  cd "$srcdir/fcd-llvm-4.0"
  mkdir -p build && cd build
  LDFLAGS="-Wl,-rpath,/usr/lib/llvm-4.0/lib" cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
    -DLLVM_DIR=/usr/lib/llvm-4.0/lib/cmake/llvm ..
  make
}

package()
{
  cd "$srcdir/fcd-llvm-4.0"/build
  install -d "$pkgdir"/usr/bin/
  install -m755 fcd "$pkgdir"/usr/bin/
}
