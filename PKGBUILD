# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=ttf-oxygen-git
pkgver=5.4.90.r170.5f935c7
pkgrel=1
pkgdesc="A desktop/gui font family for integrated use with the KDE desktop"
url='https://projects.kde.org/projects/kde/workspace/oxygen-fonts'
arch=('i686' 'x86_64') # CMake files are arch-dependent
license=('custom:OFL' 'GPL' 'custom:GPL+FE')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git' 'extra-cmake-modules' 'fontforge')
provides=('ttf-oxygen' 'ttf-font')
conflicts=('ttf-oxygen')
options=('!emptydirs')
install=${pkgname}.install
source=('git://anongit.kde.org/oxygen-fonts.git')
sha1sums=('SKIP')

pkgver() {
  cd oxygen-fonts
  _ver="$(grep -m1 PROJECT_VERSION CMakeLists.txt | cut -d '"' -f2)"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ../oxygen-fonts \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # Fix install path
  install -d "${pkgdir}"/usr/share/fonts/TTF
  mv "${pkgdir}"/usr/share/fonts/truetype/oxygen/*.ttf \
    "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m644 "${srcdir}"/oxygen-fonts/COPYING-{GPL+FE.txt,OFL} \
    "${pkgdir}"/usr/share/licenses/${pkgname}
}
