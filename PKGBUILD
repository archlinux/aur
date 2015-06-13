# Maintainer: ant32 <antreimer@gmail.com>

_qt_module=qtsystems
pkgname="mingw-w64-qt5-systems-git"
pkgver=5.0.0.beta1.112.g44f70d9
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- Qt Service Framework (mingw-w64)"
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc' 'git')
conflicts=('mingw-w64-qt5-systems')
provides=('mingw-w64-qt5-systems')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}"  # "${_qt_module}-opensource-src-${pkgver}"
source=("git://gitorious.org/qt/${_pkgfqn}.git"
        "qt5-qtsystems-fix-gcc49-compatibility.patch")
md5sums=('SKIP'
         'ec1bc57a6ee2264e9c92e1f0701c31ba')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/${_pkgfqn}"
  git describe | sed -e 's/^v//' | tr - .
}

prepare() {
  cd "${srcdir}/${_pkgfqn}"
  
  # Fix FTBFS when using gcc 4.9
  patch -p0 -i ../qt5-qtsystems-fix-gcc49-compatibility.patch
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}

    ${_arch}-qmake-qt5 ../${_qt_module}.pro
    make

    popd
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    pushd build-${_arch}

    make INSTALL_ROOT="${pkgdir}" install

    ${_arch}-strip --strip-all "${pkgdir}/usr/${_arch}/bin/"*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a

    popd
  done

  # .prl files aren't interesting for us
  find "${pkgdir}" -name "*.prl" -delete
}
