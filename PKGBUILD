# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=4.12
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
depends=('python2-beautifulsoup4' 'qt5-tools' 'qt5-declarative' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'clang' 'llvm')
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
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz"
        qtcreator-preload-plugins.patch
        qtcreator-clang-libs.patch)
sha256sums=('d76655799ad2af81fb15f85d412d74583659fb1b4cf27b758ad8aae73675948b'
            'b40e222b30c355d1230160a4e933dbd161b8748125662e3bde312ea52296457a'
            '0f6d0dc41a87aae9ef371b1950f5b9d823db8b5685c6ac04a7a7ac133eb19a3f')

prepare() {
  cd ${srcdir}/${_filename}

  # fix hardcoded libexec path
  sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qtcreator.pri
  sed -e 's|libexec|lib|g' -i src/tools/tools.pro
  # use system qbs
  rm -r src/shared/qbs
  # Preload analyzer plugins, since upstream clang doesn't link to all plugins
  # see http://code.qt.io/cgit/clang/clang.git/commit/?id=7f349701d3ea0c47be3a43e265699dddd3fd55cf
  # and https://bugs.archlinux.org/task/59492
  patch -p1 -i ../qtcreator-preload-plugins.patch

  # Fix build with clang 10
  patch -p1 -i ../qtcreator-clang-libs.patch
}

build() {
  cd ${srcdir}/${_filename}

  qmake \
    -r \
    -spec linux-clang \
    LLVM_INSTALL_DIR=/usr QBS_INSTALL_DIR=/usr \
    KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
    DEFINES+=QBS_ENABLE_PROJECT_FILE_UPDATES \
    ${srcdir}/${_filename}/qtcreator.pro

  make
  make docs
}

package() {
  cd ${srcdir}/${_filename}

  make INSTALL_ROOT="$pkgdir/usr/" install
  make INSTALL_ROOT="$pkgdir/usr/" install_docs

  install -Dm644 "$srcdir"/qt-creator-opensource-src-$pkgver/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT

# Link clazy plugin explicitely
  patchelf --add-needed ClazyPlugin.so "$pkgdir"/usr/lib/qtcreator/clangbackend
}
