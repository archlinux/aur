pkgname=python-clang20
pkgver=20.1.8
pkgrel=1
pkgdesc="Python bindings for clang version 20"
arch=('x86_64')
url="https://clang.llvm.org/"
license=('custom:Apache 2.0 with LLVM Exception')
depends=(
clang20
python)
source=(https://github.com/llvm/llvm-project/releases/download/llvmorg-$pkgver/clang-$pkgver.src.tar.xz)
sha256sums=('b7a1b7b0af7b9c7596af6bd46e36d11321926eaa66a7a7dc957ab0a1375ee4b0')
prepare(){
  cd clang-$pkgver.src
  sed 's,import clang,import clang20,g' -i bindings/python/clang/cindex.py
  sed 's,clang.enumerations,clang20.enumerations,g' -i bindings/python/clang/cindex.py
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
  cp -a bindings/python/clang "$pkgdir/$site_packages/clang20"

  # Compile Python scripts
  _python_optimize "$pkgdir/$site_packages"
}
