# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=4.15
_pkgver=${_pkgvermajmin}.0
_verpostfix="rc1"
pkgver="${_pkgver}${_verpostfix}"
pkgrel=3
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
provides=('qtcreator')
conflicts=('qtcreator')
depends=('python2-beautifulsoup4' 'qt5-tools' 'qt5-declarative' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'clang' 'llvm')
install=qtcreator-prerelease.install
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
makedepends=('qbs' 'clang' 'qt5-base' 'patchelf')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('6107f8893d57b0d38df5718180d3407940af09a8ac5968ae08df6ebaa90080c2')

prepare() {
  cd ${srcdir}/${_filename}

  # fix hardcoded libexec path
  sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qtcreator.pri
  sed -e 's|libexec|lib|g' -i src/tools/tools.pro
  # use system qbs
  rm -r src/shared/qbs
}

build() {
  cd ${srcdir}/${_filename}

  qmake \
    -r \
    -spec linux-clang \
    DEFINES+=QBS_ENABLE_PROJECT_FILE_UPDATES \
    ${srcdir}/${_filename}/qtcreator.pro

  make
  make docs
}

package() {
  cd ${srcdir}/${_filename}

  make INSTALL_ROOT=${pkgdir}/usr/ install
  make INSTALL_ROOT=${pkgdir}/usr/ install_docs

  install -Dm644 ${srcdir}/${_filename}/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT

# Link clazy plugin explicitely
  #patchelf --add-needed ClazyPlugin.so "$pkgdir"/usr/lib/qtcreator/clangbackend
}
