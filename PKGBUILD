# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=('qtikz-git' 'ktikz-git')
pkgver=r344.6157e86
pkgrel=1
pkgdesc="Small application helping you to create TikZ diagrams"
arch=('i686' 'x86_64')
url="https://github.com/fhackenberger/ktikz"
license=('GPL')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt5-base' 'qt5-tools'
	     'texlive-core' 'kdoctools' 'kxmlgui' 'ktexteditor' 'kparts'
	     'kiconthemes' 'poppler' 'poppler-qt5' 'kdelibs4support')
source=("qtikz::git+https://github.com/fhackenberger/ktikz")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-git}"
  [[ -d build_q ]] || mkdir build_q
  [[ -d build_k ]] || mkdir build_k
  cd build_q
  qmake ../qtikz.pro
  make
  cd ../build_k
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr 
  make
}

package_qtikz-git() {
  pkgdesc+=" – Qt version"
  provides=('qtikz')
  conflicts=('qtikz')
  depends=('poppler-qt5' 'hicolor-icon-theme')
  
  cd "${pkgname%-git}"/build_q
  make INSTALL_ROOT="$pkgdir" install
  # Fix icons path
  sed -i 's:Icon=/usr/share/qtikz/qtikz-128.png:Icon=qtikz:' "${pkgdir}"/usr/share/applications/qtikz.desktop
  rm "${pkgdir}"/usr/share/qtikz/qtikz-128.png
  install -Dm644 ../app/icons/qtikz.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/qtikz.svg
  install -Dm644 ../app/icons/qtikz-22.png "${pkgdir}"/usr/share/icons/hicolor/22x22/apps/qtikz.png
  install -Dm644 ../app/icons/qtikz-128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/qtikz.png
}

package_ktikz-git() {
  provides=('ktikz')
  conflicts=('ktikz')
  pkgdesc+=" – KDE version"
  depends+=('kparts' 'poppler-qt5' 'hicolor-icon-theme' 'ktexteditor')

  cd "${pkgbase%-git}"/build_k
  make DESTDIR="${pkgdir}" install
}
