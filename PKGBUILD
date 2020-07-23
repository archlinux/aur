# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>

_sip_ver="4.19.22"
_fragment="#tag=v3.0.1"
pkgname=('seexpr' 'seexpr-doc')
pkgver=${_fragment###tag=v}
pkgrel=1
pkgdesc="An embeddable expression evaluation engine"
arch=('i686' 'x86_64')
url="https://www.disneyanimation.com/technology/seexpr.html"
license=('custom:Apache')
depends=('python' 'llvm-libs' 'qt5-base')
optdepends=('python-pyqt5: Editor support')
optdepends+=('boost-libs: Python bindings')
makedepends=('boost' 'llvm' 'python-pyqt5' 'doxygen' 'libpng' 'cmake' 'git' "sip=$_sip_ver" "python-sip=$_sip_ver" 'python-pyqt5' 'gtest')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("git+https://github.com/wdas/SeExpr.git${_fragment}"
	"llvm10.0.0.patch")
sha256sums=('SKIP'
            'e93da9176d30da97461825e8b9970f20a68aa652f032ea1d8a16076884ff20cb')

prepare() {
  git -C SeExpr apply -v ${srcdir}/llvm10.0.0.patch
}

build() {
  cmake \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DUSE_PYTHON=ON \
    -DPYQT_SIP_DIR='/usr/lib/python3.8/site-packages/PyQt5/bindings' \
    -DENABLE_SLOW_TESTS=ON \
    -DGTEST_DIR=/usr \
    -S SeExpr \
    -B build
  make -C build
}

check() {
  make -C build test
}

package_seexpr() {
  make -C build DESTDIR="$pkgdir/" install
  # remove doc
  mkdir -p ${pkgdir}/../tmp/usr/share/
  mv ${pkgdir}/usr/share/doc ${pkgdir}/../tmp/usr/share/
  # Copy custom Apache license
  install -D -m644 "SeExpr/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_seexpr-doc() {
#reset defs
  arch=('any')
  depends=()
  optdepends=()
  provides=()
  conflicts=()

  install -dm644 ${pkgdir}/usr/share
  mv ${pkgdir}/../tmp/usr/share/doc ${pkgdir}/usr/share/
  install -D -m644 "SeExpr/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
