# AUR with fixes applied:
# Maintainer: Aaron Barany <akb825@gmail.com>
# Original:
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator-fixed-themes
pkgver=4.8.0
_clangver=7.0.0
pkgrel=4
pkgdesc='Lightweight, cross-platform integrated development environment, with fixes applied for various themes'
arch=(x86_64)
url='http://qt-project.org'
license=(LGPL)
depends=(qt5-tools qt5-quickcontrols qt5-quickcontrols2 qt5-webengine clang=$_clangver qbs clazy)
makedepends=(git mesa llvm python)
conflicts=(qtcreator)
options=(docs)
optdepends=('qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
source=("http://download.qt.io/official_releases/qtcreator/${pkgver%.*}/$pkgver/qt-creator-opensource-src-$pkgver.tar.xz"
        qtcreator-clang-plugins.patch
        qtcreator-dark-theme-fixes.patch
        qtcreator-dark-and-flat-selection-fixes.patch
		qtcreator-exit-debugger-fix.patch
		qtcreator-occurrences-fix.patch
		qtcreator-breakpoint-fix.patch)
sha256sums=('aec7b4595e17f5536eb2eef4331057f2d0fa4ba0a46f4968cc06959a1d589b43'
            '6f19fc9d83964a5460d224b3d44ce580553847960181fe0364e2ce26e1efd2e6'
            'a7b87219de0ee3e18754749a057535c04357acc2478dcb3fca6bc4b1ba8a8178'
            '514d9ff2989b0c865ead40b62df79f46871cbc1840ca552c64947b2e6c7d7d18'
			'f938a72cc79c9ed8de07da8af79b170f67448a74dbd3228dd3de7e4855ed633d'
			'ba6a48156cc14935a0dea12e8282bdfb1936e0c67216c660eef41bd5b5a44d4b'
			'12dad35519cfc62119b0af21b31a96149081ae1ee6d6e7cb65ee80f3774ff06f')

prepare() {
  mkdir -p build

  cd qt-creator-opensource-src-$pkgver
  # fix hardcoded libexec path
  sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qtcreator.pri
  # use system qbs
  rm -r src/shared/qbs
  # Load analyzer plugins on demand, since upstream clang doesn't link to all plugins
  # see http://code.qt.io/cgit/clang/clang.git/commit/?id=7f349701d3ea0c47be3a43e265699dddd3fd55cf
  # and https://bugs.archlinux.org/task/59492
  patch -p1 -i ../qtcreator-clang-plugins.patch
  # Theme fixes
  patch -p1 -i ../qtcreator-dark-theme-fixes.patch
  patch -p1 -i ../qtcreator-dark-and-flat-selection-fixes.patch
  patch -p1 -i ../qtcreator-occurrences-fix.patch
  # Bonus patches!
  # Fix exiting debugger on program exit.
  patch -p1 -i ../qtcreator-exit-debugger-fix.patch
  # Fix infinite looping breakpoints.
  patch -p1 -i ../qtcreator-breakpoint-fix.patch
}

build() {
  cd build

  qmake LLVM_INSTALL_DIR=/usr QBS_INSTALL_DIR=/usr CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
    DEFINES+=QBS_ENABLE_PROJECT_FILE_UPDATES "$srcdir"/qt-creator-opensource-src-$pkgver/qtcreator.pro
  make
  make docs
}

package() {
  cd build

  make INSTALL_ROOT="$pkgdir/usr/" install
  make INSTALL_ROOT="$pkgdir/usr/" install_docs

  install -Dm644 "$srcdir"/qt-creator-opensource-src-$pkgver/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT
}
