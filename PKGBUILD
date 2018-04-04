# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=castxml-git
_gitname=CastXML
pkgdesc="C-family abstract syntax tree XML output tool."
pkgver=r337.c2a44d0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/CastXML/CastXML"
license=('APACHE')
depends=('llvm' 'clang')
makedepends=('git' 'cmake' 'python-sphinx' 'clang-tools-extra')
provides=('castxml')
conflicts=('castxml')
source=(
  'git://github.com/CastXML/CastXML'
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git log | head -n 1 | cut -d" " -f2 | awk '{print substr($0,0,7)}')"
  )
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Fix build issue as reported by Kniyl here
  # https://github.com/CastXML/CastXML/issues/102
  sed -i "s|\${llvm_libs}|LLVM|g" src/CMakeLists.txt

  cmake -DSPHINX_EXECUTABLE=/usr/bin/sphinx-build \
        -DSPHINX_HTML=1 \
        -DSPHINX_MAN=1 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCastXML_INSTALL_DOC_DIR=share/doc/castxml \
        -DCastXML_INSTALL_MAN_DIR=share/man
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package(){
  cd "$srcdir/${_gitname}"
  make DESTDIR="$pkgdir" install
}
