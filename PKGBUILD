# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=breeze-git
pkgver=r853.af09860
pkgrel=1
pkgdesc='Artwork, styles and assets for the Breeze visual style for the Plasma Desktop'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/breeze'
license=(LGPL)
depends=(frameworkintegration kdecoration-git kcmutils hicolor-icon-theme)
makedepends=(extra-cmake-modules git)
optdepends=('breeze-kde4-git: Breeze widget style for KDE4 applications' 'oxygen-icons: fallback icon theme')
conflicts=(breeze breeze-icons)
provides=(breeze breeze-icons)
source=('git://anongit.kde.org/breeze.git')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd breeze
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../breeze \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# make QtCurve preset and color scheme available for KDE4 too
  install -d -m755 "$pkgdir"/usr/share/apps/{QtCurve,color-schemes}
  ln -sr "$pkgdir"/usr/share/QtCurve/Breeze.qtcurve "$pkgdir"/usr/share/apps/QtCurve
  ln -sr "$pkgdir"/usr/share/color-schemes/Breeze*.colors "$pkgdir"/usr/share/apps/color-schemes
}
