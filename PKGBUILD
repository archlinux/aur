# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

pkgname=('seexpr2' 'seexpr2-doc')
_fragment="#tag=v2-1.11.4"
pkgver=1.11.4
pkgrel=2
pkgdesc="An embeddable expression evaluation engine"
arch=('i686' 'x86_64')
url="https://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('python' 'boost-libs' 'llvm7-libs' 'qt5-base')
#makedepends=('python2-pyqt4' 'doxygen' 'glew' 'libpng' 'cmake>=2.4.6' 'git' 'python-sip' 'boost' 'llvm')
makedepends=('boost' 'cmake' 'doxygen' 'git' 'llvm7' 'libpng' 'python-pyqt5' 'python-sip' 'sip')
source=("git+https://github.com/wdas/SeExpr.git${_fragment}"
	"llvm.patch")
md5sums=('SKIP'
         '3d70da8447176865505d36e9a86a2b70')

_CMAKE_FLAGS=( 	-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR='lib' \
		-DENABLE_QT5=true \
		-DPYQT_SIP_DIR=/usr/share/sip/PyQt5 \
		-DOpenGL_GL_PREFERENCE=GLVND \
		)
#		-DPNG_DIR=/usr \
#		-DLLVM_DIR=/usr/lib/cmake/llvm \
#		-DGTEST_DIR=/usr \
#		-DUSE_PYTHON=ON \
#		-DBOOST_DIR=${BOOST}  \
#		-DCUSTOM_PYTHON_FRAMEWORK=${CUSTOM_PYTHON_FRAMEWORK} \

prepare() {
  cd ${srcdir}/SeExpr
  patch -Np1 -i ../llvm.patch 
}

build() {
  cd "$srcdir/SeExpr"
  mkdir -p build && cd build
  cmake ${_CMAKE_FLAGS[@]} ..
  make
  #cp Makefile.config.example Makefile.config
  #make RP_qt5=true PR_pyqt5=true
}

package_seexpr2() {
  cd "$srcdir/SeExpr/build"
  make DESTDIR="$pkgdir/" install
  # move doc to next package
  mkdir -p ${pkgdir}/../tmp/usr/share/
  mv ${pkgdir}/usr/share/doc ${pkgdir}/../tmp/usr/share/
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_seexpr2-doc() {
#reset defs
  arch=('any')
  depends=()
  optdepends=()
  provides=()
  conflicts=()

  cd ${srcdir}/SeExpr/build
  mkdir -p ${pkgdir}/usr/share/
  mv ${pkgdir}/../tmp/usr/share/doc ${pkgdir}/usr/share/
  # Copy custom Apache license
  install -D -m644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
