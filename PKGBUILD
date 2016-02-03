# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>

_qt_module=qtxmlpatterns
pkgname="mingw-w64-qt5-xmlpatterns"
pkgver=5.5.1
pkgrel=1
arch=('any')
pkgdesc="Support for XPath, XQuery, XSLT and XML schema validation (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('17b9ee5031262b5b875ce0e1045e6bdc')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
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
