# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: anonimal <anonimal at zano dot org>

pkgbase="zano"
pkgname=('zano')
pkgver=1.1.5.82
pkgrel=1
pkgdesc="Zano: innovative private money"
license=('MIT')
arch=('x86_64')
url="https://zano.org/"
depends=('boost-libs' 'qt5-base' 'qt5-tools' 'qt5-webengine')
makedepends=('git' 'cmake' 'boost' 'clang')
provides=('zano')
source=("${pkgname}"::"git+https://github.com/hyle-team/zano#tag=${pkgver}")
sha256sums+=('SKIP')

_zano="${pkgbase}"
_build="build"

prepare()
{
  git -C "${pkgname}" submodule update --init --recursive --force
}

build()
{
  cd "${srcdir}/${_zano}"
  CMAKE_FLAGS+=" -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++"
  CMAKE_FLAGS+=" -DCMAKE_BUILD_TYPE=Release "
  CMAKE_FLAGS+=" -DCMAKE_INSTALL_PREFIX=/usr "
  CMAKE_FLAGS+=" -DBUILD_GUI=ON "
  mkdir -p $_build && cd $_build
  cmake $CMAKE_FLAGS ../
  make
}

package_zano()
{
  # TODO: upstream should provide a license file (though the code is licensed under MIT/X11)
  #install -Dm644 "${srcdir}/${_zano}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "${srcdir}/${_zano}/build/src/simplewallet" "${pkgdir}/usr/bin/zano-cli"
  install -Dm755 "${srcdir}/${_zano}/build/src/Zano" "${pkgdir}/usr/bin/zano-gui"
  install -Dm755 "${srcdir}/${_zano}/build/src/connectivity_tool" "${pkgdir}/usr/bin/zano-tool"
  install -Dm755 "${srcdir}/${_zano}/build/src/zanod" "${pkgdir}/usr/bin/zanod"

  install -dm755 "${srcdir}/${_zano}/src/gui/qt-daemon/html" "${pkgdir}/usr/share/zano/html"

  # TODO: this is a hack
  cp -r "${srcdir}/${_zano}/src/gui/qt-daemon/html" "${pkgdir}/usr/share/zano"

  # TODO: zano-gui currently requires `/usr/bin/zano-gui --html-path /usr/share/zano/html` because the binary expects html in same location
}
sha256sums=('SKIP')
