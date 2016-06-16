# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_qt_module=qtquick1
pkgname="mingw-w64-qt5-quick1"
pkgver=5.5.1
pkgrel=1.1
arch=('any')
pkgdesc="Qt Declarative is provided for Qt 4 compatibility (mingw-w64)"
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-script' 'mingw-w64-qt5-tools')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver:0:3}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('46a61a405844cbe88a754127422f6b6d')

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

    # Prevent file conflict with mingw-qt4
    mv "${pkgdir}/usr/${_arch}/bin/qmlviewer.exe" "${pkgdir}/usr/${_arch}/bin/qmlviewer-qt5.exe"

    ${_arch}-strip --strip-all "${pkgdir}/usr/${_arch}/bin/"*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/"*.dll.a
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/qt/plugins/"*/*.dll
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/qt/imports/Qt/labs/"*/*.dll

    popd
  done

  # .prl files aren't interesting for us
  find ${pkgdir} -name "*.prl" -delete
}
