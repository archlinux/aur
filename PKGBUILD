# Maintainer: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

_qt_module=qtimageformats
pkgname="mingw-w64-qt5-imageformats"
pkgver=5.4.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtImageformats module (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('b09f8aa0b04c96fddbdff623e7b4c17a')

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

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/qt/plugins/imageformats/"*.dll

    popd
  done
}
