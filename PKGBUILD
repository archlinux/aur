# Maintainer: Alex Dahl <adahl1@umbc.edu>
pkgname=('seexpr-git' 'seexpr-git-doc')
pkgver=3.0.beta.2.r76.gdb4cfca
pkgrel=1
pkgdesc="An embeddable expression evaluation engine (git version)"
arch=('i686' 'x86_64')
url="http://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('python' 'qt4' 'boost-libs')
optdepends=('llvm-libs: LLVM backend support'
            'python-pyqt4: Editor support')
makedepends=('python-pyqt4' 'kdelibs' 'doxygen' 'glew' 'libpng' 'cmake>=2.4.6' 'git' 'python-sip' 'boost' 'llvm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/wdas/SeExpr.git'
    'install-UI-headers.patch')
md5sums=('SKIP'
         '4ca54b352f6aec08e7ef0e54e57d2e2d')
 
CMAKEFLAGS=( -DLLVM_ENABLE_EH=OFF
             -DLLVM_ENABLE_LTO=OFF
             -DLLVM_ENABLE_RTTI=ON
           )
 
pkgver() {
  cd "$srcdir/SeExpr"
  # Cutting off 'v' prefix that presents in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
prepare() {
  cd ${srcdir}
#  llvm50 compatibility fix
  sed -i 's/AttributeSet/AttributeList/' SeExpr/src/SeExpr/Evaluator.h
  sed -i '/dump()/d' SeExpr/src/SeExpr/Evaluator.h
# install UI headers for appleseed
  cd SeExpr
  patch -Np1 -i ../install-UI-headers.patch
}
 
build() {
  cd "$srcdir/SeExpr"
  mkdir -p build
  cd build
  cmake ${CMAKEFLAGS[@]} -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib' ..
  make
}
 
package_seexpr-git() {
  cd "$srcdir/SeExpr/build"
  make DESTDIR="$pkgdir/" install
  # remove doc
  mkdir -p ${pkgdir}/../tmp/usr/share/
  mv ${pkgdir}/usr/share/doc ${pkgdir}/../tmp/usr/share/
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
 
package_seexpr-git-doc() {
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