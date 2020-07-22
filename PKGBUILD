# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=('seexpr1-2' 'seexpr1-2-doc')
_fragment="#tag=v2.11"
pkgver=2.11
pkgrel=1
pkgdesc="An embeddable expression evaluation engine"
arch=('i686' 'x86_64')
url="http://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('python2' 'qt4')
optdepends=('python2-pyqt4: Editor support')
#makedepends=('python2-pyqt4' 'doxygen' 'glew' 'libpng' 'cmake>=2.4.6' 'git' 'python-sip' 'boost' 'llvm')
makedepends=('python2-pyqt4' 'doxygen' 'libpng' 'cmake' 'git' 'sip=4.19.22' 'python2-sip')
provides=("${pkgname%-2}=${pkgver}")
conflicts=("${pkgname%-2}")
source=("git+https://github.com/wdas/SeExpr.git${_fragment}"
        "build.patch")
md5sums=('SKIP'
         'ad7a72d539fbb5b899f26f7fd1cfc950')

prepare() {
  cd ${srcdir}/SeExpr
  sed -i 's/env python/env python2/' src/build/build-info
  patch -Np1 -i ../build.patch 
}

build() {
  cd "$srcdir/SeExpr"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' ..
  make
}

package_seexpr1-2() {
  cd "$srcdir/SeExpr/build"
  make DESTDIR="$pkgdir/" install
  # remove doc
  mkdir -p ${pkgdir}/../tmp/usr/share/
  mv ${pkgdir}/usr/share/doc ${pkgdir}/../tmp/usr/share/
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_seexpr1-2-doc() {
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
