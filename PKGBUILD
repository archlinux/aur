# Maintainer: ant32 <antreimer@gmail.com>
_qt_module=qtwinextras
pkgname="mingw-w64-qt5-winextras"
pkgver=5.4.2
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtWinExtras component (mingw-w64)"
depends=('mingw-w64-qt5-base' 'mingw-w64-qt5-declarative')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('11c3949a279ca6339e70cceed8d45ea2')

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

    popd
  done
    
  # .prl files aren't interesting for us
  find "${pkgdir}" -name "*.prl" -delete
}
