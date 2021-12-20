# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python-llvmlite
pkgver=0.38.0rc1
pkgrel=1
pkgdesc="Lightweight LLVM python binding for writing JIT compilers"
url="https://github.com/numba/llvmlite"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'llvm11-libs>=11.0.0' 'llvm11-libs<12.0.0')
makedepends=('cython' 'llvm11>=11.0.0' 'llvm11<12.0.0')
source=(llvmlite-$pkgver.tar.gz::"https://github.com/numba/llvmlite/archive/v$pkgver.tar.gz")
sha256sums=('7b4b703ceee3d8df66d5357c0a80fbc6b50e95cc0d00a4f8485b099e21e4ac6a')

build() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py check
}

package() {
  cd "$srcdir/llvmlite-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1

  pydir=$(python -c "from distutils.sysconfig import get_python_lib; \
    print(get_python_lib())")
  install -m755 "$srcdir"/llvmlite-$pkgver/ffi/libllvmlite.so \
    "$pkgdir/$pydir"/llvmlite/binding
}
