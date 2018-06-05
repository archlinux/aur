# Maintainer: Pierpaolo Valerio <gondsman@techgeek.co.in>
pkgname=cirkuit-kf5-git
pkgver=r408.cdc3e89
pkgrel=2
pkgdesc="KDE interface for LaTeX graphic tools (such as TikZ, Gnuplot, Circuit Macros) to produce publication-ready pictures"
arch=('i686' 'x86_64')
url="git://anongit.kde.org/cirkuit.git"
license=('GPL')
depends=('poppler-qt5' 'm4' 'ghostscript' 'texlive-pstricks' 'netpbm' 'knewstuff' 'ktexteditor' 'kdelibs4support' 'hicolor-icon-theme' 'kdoctools')
optdepends=('dpic: improved circuit macros support' 'gnuplot: Gnuplot backend')
makedepends=('git' 'texlive-core' 'cmake' 'extra-cmake-modules' 'kdesignerplugin')
provides=("cirkuit=${pkgver}" "cirkuit-kf5=${pkgver}")
conflicts=('cirkuit')
source=("git://anongit.kde.org/cirkuit.git#branch=frameworks")
md5sums=('SKIP')
_gitname=cirkuit
options=('!makeflags')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"/src/
  sed -i 's/CMman.pdf/Circuit_macros.pdf/g' backends/circuitmacros/circuitmacrosbackend.cpp
  sed -i 's/loadFile(filename)/loadFile(KUrl(filename))/g' mainwindow.cpp

}

build() {
  cd "$_gitname"
  rm -rf build
  mkdir  build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make clean
  make
}

package() {
  cd "$_gitname"/build
  make DESTDIR=${pkgdir} install
  mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
  rmdir ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/share/apps/katepart/syntax/gnuplot.xml
}