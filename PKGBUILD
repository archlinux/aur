# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-git
pkgver=20.0.test.2019.03.15
pkgrel=2
pkgdesc="A program for improving image files made with a digital camera, test-version"
url="https://gitlab.com/fotoxx/fotoxx.git"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('fotoxx')
provides=('fotoxx')
depends=('dcraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("git+https://gitlab.com/${pkgname%-git}/${pkgname%-git}.git#branch=${pkgname%-git}-200")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - . | cut -c8-
}

prepare() {
  cd ${pkgname%-git}/programs/${pkgname%-git}
  sed -i 's+libchamplain+champlain+g' Makefile
}

build() {
  cd ${pkgname%-git}/programs/${pkgname%-git}
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-git}/programs/${pkgname%-git}
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install
  rm -r "$pkgdir"/usr/share/appdata
  sed -i 's+/usr/share/fotoxx/icons/++' "$pkgdir"/usr/share/applications/fotoxx.desktop
}
