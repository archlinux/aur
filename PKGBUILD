pkgname=python-clang15
pkgver=15.0.7
pkgrel=1
pkgdesc="Python bindings for clang version 15"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=('clang15' 'python')
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/clang-$pkgver.src.tar.xz)
sha256sums=('a6b673ef15377fb46062d164e8ddc4d05c348ff8968f015f7f4af03f51000067')
prepare(){
  cd clang-$pkgver.src
  sed 's,import clang,import clang15,g' -i bindings/python/clang/cindex.py
  sed 's,clang.enumerations,clang15.enumerations,g' -i bindings/python/clang/cindex.py
}

_python_optimize() {
  python -m compileall "$@"
  python -O -m compileall "$@"
  python -OO -m compileall "$@"
}

package(){
  cd clang-$pkgver.src
  
  # install Python bindings
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/$site_packages"
  cp -a bindings/python/clang "$pkgdir/$site_packages/clang15"

  # Compile Python scripts
  _python_optimize "$pkgdir/$site_packages"
}
