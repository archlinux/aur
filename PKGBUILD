# Maintainer: ant32 <antreimer@gmail.com>

_qt_module=qt3d
pkgname="mingw-w64-qt5-3d-git"
pkgver=5.0.0.beta1.84.g8a9723d
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- Qt3d module (mingw-w64)"
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-declarative' 'mingw-w64-qt5-quick1')
makedepends=('mingw-w64-gcc' 'git')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}"  # "${_qt_module}-opensource-src-${pkgver}"
source=("git://gitorious.org/qt/${_pkgfqn}.git")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd "${srcdir}/${_pkgfqn}"
  git describe | sed -e 's/^v//' | tr - .
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

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a

    popd
  done

  # .prl files aren't interesting for us
  find "${pkgdir}" -name "*.prl" -delete
}
