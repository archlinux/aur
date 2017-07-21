# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
pkgname=qtcreator-prerelease
_pkgvermajmin=4.4
pkgver=${_pkgvermajmin}.0
_verpostfix="beta1"
pkgrel=1
_pkgver=${pkgver}
_urlbase="https://download.qt.io/official_releases"
if [[ -n $_verpostfix ]]; then
  _pkgver=${_pkgver}-${_verpostfix}
  _urlbase="https://download.qt.io/development_releases"
fi
_filename=qt-creator-opensource-src-${_pkgver}
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator' 'qbs')
conflicts=('qtcreator' 'qbs')
depends=('qt5-tools' 'qt5-declarative' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'clang' 'llvm')
optdepends=('qbs'
            'qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'openssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
makedepends=('clang' 'qt5-base')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('163e729a0c4a78f4cd8acb9c82cae806bd66d6e1612aa52b94c1345a85384460')

_qmake_cmd=qmake

build() {
  local src_dir=${startdir}/src/
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  QMAKESPEC=linux-clang QTC_PREFIX=/usr LLVM_INSTALL_DIR=/usr ${_qmake_cmd} QMAKE_CFLAGS_ISYSTEM=-I CONFIG+=journald -r ../${_filename}/qtcreator.pro
  make
  make docs -j1
}

package() {
  cd build

  make INSTALL_ROOT="${pkgdir}/usr/" install
  make INSTALL_ROOT="${pkgdir}/usr/" install_docs

  # Workaround for FS#40583
  mv "${pkgdir}"/usr/bin/qtcreator "${pkgdir}"/usr/bin/qtcreator-bin
  echo "#!/bin/sh" > "${pkgdir}"/usr/bin/qtcreator
  echo "QT_LOGGING_TO_CONSOLE=1 qtcreator-bin \$@" >> "${pkgdir}"/usr/bin/qtcreator
  chmod +x "${pkgdir}"/usr/bin/qtcreator

  install -Dm644 ${srcdir}/${_filename}/LICENSE.GPL3-EXCEPT ${pkgdir}/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT
}
