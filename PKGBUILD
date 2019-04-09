# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=('seexpr-qt5' 'seexpr-qt5-doc')
_fragment="#branch=appleseed-qt5"
pkgver=2.11
pkgrel=1
pkgdesc="An embeddable expression evaluation engine"
arch=(x86_64)
url="https://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('python2' 'qt5-base')
optdepends=('python2-pyqt5: Editor support')
#makedepends=('python2-pyqt4' 'doxygen' 'glew' 'libpng' 'cmake>=2.4.6' 'git' 'python-sip' 'boost' 'llvm')
makedepends=('python2-pyqt5' 'doxygen' 'libpng' 'cmake' 'git' 'python2-sip')
provides=("${pkgname[0]%-qt5}")
conflicts=("${pkgname[0]%-qt5}")
source=("git+https://github.com/termhn/SeExpr.git${_fragment}"
        )
md5sums=('SKIP'
         )

build() {
  cd "$srcdir/SeExpr"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' ..
  make all doc
}

package_seexpr-qt5() {
  cd "$srcdir/SeExpr/build"
  make DESTDIR="$pkgdir/" install
  # remove doc
  mkdir -p ${pkgdir}/../tmp/usr/share/
  mv ${pkgdir}/usr/share/doc ${pkgdir}/../tmp/usr/share/
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_seexpr-qt5-doc() {
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
