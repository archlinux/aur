# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=florb-git
pkgver=r153.ee3e10f
pkgrel=1
pkgdesc="simple FLTK powered map viewer and GPX editor"
url="http://florb.shugaa.de/"
arch=('x86_64' 'i686')
license=('MIT')

depends=('fltk' 'yaml-cpp' 'libxpm' 'curl' 'tinyxml2' 'boost-libs')
optdepends=('gpsbabel')
makedepends=('omake' 'gendesk')
md5sums=('SKIP')


source=("${pkgname}"::'git://github.com/shugaa/florb.git')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname}/src"
  sed -i '/^#include/s%Fl/%FL/%' dlg_ui_ex.cpp dlg_settings_ex.cpp
}

build() {
  cd $srcdir/$pkgname/src
  gendesk -f -n --pkgname florb --exec florb --pkgdesc "$pkgdesc" --categories 'Utility'
  omake
}

package() {
  cd $srcdir/$pkgname/src
  omake PREFIX=$pkgdir/usr install
  install -Dm644 florb.desktop "${pkgdir}/usr/share/applications/florb.desktop"
  install -Dm755 res/florb.svg "${pkgdir}/usr/share/pixmaps/florb.svg"
  install -Dm755 res/florb.png "${pkgdir}/usr/share/pixmaps/florb.png"
}
