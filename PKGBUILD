# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Ramon Buldó <ramon@manjaro.org>

pkgbase=artwork-maia
pkgname=('artwork-maia' 'maia-icon-theme' 'plasma5-themes-maia' 'sddm-maia-theme' 'maia-wallpaper')
pkgver=deea19f
pkgrel=1
_gitcommit=deea19f587c6f7c41d4a1c8c18c068a21654876b
url='https://github.com/manjaro/artwork-maia/'
arch=('any')
license=('LGPL')
makedepends=('extra-cmake-modules' 'plasma-framework' 'git')

source=("maia-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
sha256sums=('072b3f19dcdc5632b5afbd838f846dfbc012ae31a8207ca1c43bd1329f97d814')

pkg_ver() {
  git rev-parse --short HEAD
}

_gitcommit() {
  git rev-parse HEAD
}

prepare() {
  mv $srcdir/artwork-maia-$_gitcommit $srcdir/maia
  mkdir -p build
}

build() {
  cd build
  cmake ../maia \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package_artwork-maia() {
  pkgdesc="Maia artwork meta-package"
  depends=('maia-icon-theme' 'maia-wallpaper' 'plasma5-themes-maia' 'sddm-maia-theme')
}

package_maia-wallpaper() {
  pkgdesc='Maia wallpaper'
  cd build
  make DESTDIR="${pkgdir}" install

  install -D ${pkgdir}/usr/share/wallpapers/Maia/contents/images/1920x1080.png ${pkgdir}/usr/share/backgrounds/maia.png

  rm -rf "${pkgdir}/usr/share/icons"
  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/wallpapers"
}

package_maia-icon-theme() {
  pkgdesc='Maia icon theme'
  cd build
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/wallpapers"
}

package_plasma5-themes-maia() {
  pkgdesc='Maia theme for KDE Plasma 5'
  depends=('breeze' 'maia-icon-theme')
  replaces=('maia-themes')
  cd build
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/sddm"
  rm -rf "${pkgdir}/usr/share/icons"
}

package_sddm-maia-theme() {
  pkgdesc="Maia theme for SDDM"
  cd build
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/share/color-schemes"
  rm -rf "${pkgdir}/usr/share/icons"
  rm -rf "${pkgdir}/usr/share/kservices5"
  rm -rf "${pkgdir}/usr/share/plasma"
  rm -rf "${pkgdir}/usr/share/wallpapers"
}
