# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=('seexpr' 'seexpr-doc')
_fragment="#tag=v3.0.0"
pkgver=3.0.0
pkgrel=1
pkgdesc="An embeddable expression evaluation engine"
arch=('i686' 'x86_64')
url="https://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('python' 'llvm-libs' 'qt5-base')
optdepends=('python-pyqt5: Editor support')
optdepends+=('boost-libs: Python bindings')
makedepends=('boost' 'llvm' 'python-pyqt5' 'doxygen' 'libpng' 'cmake' 'git' 'sip' 'python-sip' 'gtest')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/wdas/SeExpr.git${_fragment}")
md5sums=('SKIP')

build() {
  cd "$srcdir/SeExpr"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' -DPYQT_SIP_DIR='/usr/share/sip/PyQt5' -DENABLE_SLOW_TESTS=ON ..
  make
}

check() {
  cd "$srcdir/SeExpr/build"
  make test
}

package_seexpr() {
  cd "$srcdir/SeExpr/build"
  make DESTDIR="$pkgdir/" install
  # remove doc
  mkdir -p ${pkgdir}/../tmp/usr/share/
  mv ${pkgdir}/usr/share/doc ${pkgdir}/../tmp/usr/share/
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_seexpr-doc() {
#reset defs
  arch=('any')
  depends=()
  optdepends=()
  provides=()
  conflicts=()

  cd ${srcdir}/SeExpr/build
  mkdir -p ${pkgdir}/usr/share/
  mv ${pkgdir}/../tmp/usr/share/doc ${pkgdir}/usr/share/
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
