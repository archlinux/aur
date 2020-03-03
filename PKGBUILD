# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=castxml-git
pkgdesc="C-family abstract syntax tree XML output tool."
pkgver=0.3.1.r6.g861054e
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/CastXML/CastXML"
license=('Apache')
depends=('llvm' 'clang')
makedepends=('git' 'cmake' 'python-sphinx')
provides=('castxml')
conflicts=('castxml')
source=("${pkgname%-git}::git+https://github.com/CastXML/CastXML")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  # Fix build issue as reported by Kniyl here https://github.com/CastXML/CastXML/issues/102
  sed -i "s|\${llvm_libs}|LLVM|g" src/CMakeLists.txt

  cmake . \
    -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build \
    -DSPHINX_HTML=1 \
    -DSPHINX_MAN=1 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCastXML_INSTALL_DOC_DIR=share/doc/castxml \
    -DCastXML_INSTALL_MAN_DIR=share/man

  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
