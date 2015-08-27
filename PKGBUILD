# Maintainer: ant32 <antreimer@gmail.com>
_qt_module=qtwebsockets
pkgname="mingw-w64-qt5-websockets"
pkgver=5.5.0
pkgrel=1
arch=('any')
pkgdesc="Qt5 for Windows -- QtWebSockets module (mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc')
options=('!strip' '!buildflags' 'staticlibs')
license=('GPL3' 'LGPL')
url="http://qt-project.org/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.5/${pkgver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('aa7b160a4b97fafe71d5546c20715b8f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

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

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    popd
  done

  # .prl files aren't interesting for us
  find "${pkgdir}" -name "*.prl" -delete
}
