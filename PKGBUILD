# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: D. Can Celasun <dcelasun@gmail.com>

pkgname=ubuntu-themes-wildblueyonder
_pkgname=ubuntu-themes
_actual_ver=14.04
_extra_ver=+16.04.20160324.1
pkgver=${_actual_ver}${_extra_ver}
# pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Ambiance and Radiance themes, with a slight colour variation."
arch=(any)
url="https://launchpad.net/ubuntu-themes"
license=(CCPL)
depends=(humanity-icon-theme gnome-icon-theme hicolor-icon-theme
         gtk-engine-unico gtk-engine-murrine)
makedepends=(python2 imagemagick icon-naming-utils)
provides=(ubuntu-themes ubuntu-mono)
conflicts=(ubuntu-themes ubuntu-mono)
install=${pkgname}.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${_pkgname}_${_actual_ver}${_extra_ver}.orig.tar.gz"
        gtk2.patch gtk3.patch)
md5sums=('ce30d562a8b1bb80eb65997ba8e90abc'
         '82ca564f78217c88358fedc5003bf149'
         'b3808ebed9a637971a934646349cde69')

prepare () {
  cd "$srcdir"

  patch Ambiance/gtk-2.0/gtkrc -i ../gtk2.patch
  patch -Np0 -i "../gtk3.patch"

  sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py
}

build() {
  cd "$srcdir"
  make
}

package () {

  cd "$srcdir"

  # Install themes
  install -dm755   "${pkgdir}/usr/share/themes/"
  cp -rp "Ambiance" "$pkgdir/usr/share/themes"
  cp -rp "Radiance" "$pkgdir/usr/share/themes"

  # Install icons
  install -dm755            "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mono-dark/  "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mono-light/ "${pkgdir}/usr/share/icons/"
  cp -av LoginIcons/        "${pkgdir}/usr/share/icons/"
  cp -av suru-icons/        "${pkgdir}/usr/share/icons/"
  cp -av ubuntu-mobile/     "${pkgdir}/usr/share/icons/"

  mv "${pkgdir}"/usr/share/icons/{suru-icons,suru}/

  install -Dm644 distributor-logo.png \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/distributor-logo.png"
}
