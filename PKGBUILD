# Maintainer: David Phillips <david@sighup.nz>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=ttf-oxygen
epoch=1
pkgver=5.4.3
pkgrel=4
pkgdesc='A desktop/gui font family for integrated use with the KDE desktop'
url='https://projects.kde.org/projects/kde/workspace/oxygen-fonts'
arch=('any')
license=('custom:OFL' 'GPL' 'custom:GPL+FE')
makedepends=('extra-cmake-modules' 'fontforge' 'qt5-base')
provides=('ttf-font')
options=('!emptydirs')
source=("https://cgit.kde.org/oxygen-fonts.git/snapshot/oxygen-fonts-${pkgver}.tar.xz")
sha256sums=('c240a0ecf5c0acbc638f0ae16a87b1733a8f1f0512374923c1ee1be694ac72fe')

prepare() {
  mkdir -p build
}

build() {
  cd build

  cmake ../oxygen-fonts-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build

  make DESTDIR="$pkgdir" install

  # Fix install path
  install -d "$pkgdir"/usr/share/fonts/TTF
  mv "$pkgdir"/usr/share/fonts/truetype/oxygen/*.ttf \
    "$pkgdir"/usr/share/fonts/TTF/

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 ../oxygen-fonts-$pkgver/COPYING-{GPL+FE.txt,OFL} \
    "$pkgdir"/usr/share/licenses/$pkgname
}
