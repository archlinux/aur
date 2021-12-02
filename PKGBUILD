# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=6.0
_pkgver=${_pkgvermajmin}.0
_verpostfix=""
pkgver="${_pkgver}${_verpostfix}"
pkgrel=2
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
depends=('python2-beautifulsoup4' 'qt6-base' 'qt6-tools' 'qt6-declarative' 'qt6-quickcontrols2' 'clang' 'llvm')
install=qtcreator-prerelease.install
optdepends=('qbs'
            'qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'openssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
makedepends=('qbs' 'clang' 'qt6-base' 'patchelf')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha512sums=('4d97b18cb5ad8388f3ea0f1cff3b4d0cb04251d2dba22770a7d9f387efbe670b9461a8d83e08a92aefb6472c36e19d0902ff42fd85fd224318b99c66d2526bbb')

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

  # chokes with Qt 6
  qmake6 \
    -spec linux-clang \
    -r \
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
