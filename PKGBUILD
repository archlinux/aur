# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Atterratio <atterratio@gmail.com>

pkgbase=q4wine-git
pkgname=('q4wine-qt4-git'
         'q4wine-qt5-git'
         )
pkgver=v1.1.r2.30.gea45aa1
pkgrel=1
pkgdesc="A Qt GUI for Wine. (GIT Version)"
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/q4wine'
license=('GPL3')
makedepends=('cmake'
             'git'
             'icoutils'
             'qt4'
             'qt5-tools'
             'qt-solutions-git'
             )
source=('git://github.com/brezerk/q4wine.git')
sha1sums=('SKIP')
install=q4wine-git.install

pkgver() {
  cd q4wine
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cp -R q4wine q4wine-qt5
}

build() {
  cd "${srcdir}/q4wine"
  msg2 'Build with Qt4'
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBS_ENTRY_PATH=/usr/lib/q4wine
  make
  cd "${srcdir}/q4wine-qt5"
  msg2 'Build with Qt5'
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBS_ENTRY_PATH=/usr/lib/q4wine\
    -DQT5=ON \
    -DWITH_SYSTEM_SINGLEAPP=ON
  make
}

package_q4wine-qt4-git() {
  pkgdesc="A Qt GUI for Wine. Qt4 build (GIT Version)"
  optdepends=('winetricks: Tweak wine'
              'fuseiso: Mount ISO files')
  depends=('icoutils'
           'qt4'
           'wine'
           )
  provides=('q4wine'
            'q4wine-qt4'
            )
  conflicts=('q4wine'
             'q4wine-qt5'
             )
  install=q4wine-git.install

  make -C q4wine DESTDIR="${pkgdir}" install
}

package_q4wine-qt5-git() {
  pkgdesc="A Qt GUI for Wine. Qt5 build (GIT Version)"
  optdepends=('winetricks: Tweak wine'
              'fuseiso: Mount ISO files')
  depends=('icoutils'
           'desktop-file-utils'
           'hicolor-icon-theme'
           'qt5-base'
           'qt-solutions'
           'wine'
           )
  provides=('q4wine'
            'q4wine-qt5'
            )
  conflicts=('q4wine'
             'q4wine-qt4'
             )
  install=q4wine-git.install

  make -C q4wine-qt5 DESTDIR="${pkgdir}" install
}
