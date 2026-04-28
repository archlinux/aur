# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=sabaki-electron
_pkgname=sabaki
pkgver=0.52.2
pkgrel=1
pkgdesc='An elegant SGF editor for the game of Go'
arch=('any')
url='http://sabaki.yichuanshen.de/'
license=('MIT')
depends=('nodejs' 'electron13-bin')
makedepends=('npm')
install=${_pkgname}.install
source=("https://github.com/SabakiHQ/Sabaki/archive/v${pkgver}.tar.gz"
        "${_pkgname}.desktop"
        'sabaki.xml')
md5sums=('b82401897dff0f182dddbe7e51bc31c8'
         '7b6a953fe14a27d3e6e96d287db95f34'
         'efbd547e892c7781a5ece702d389dd9e')

build() {
  cd $srcdir/Sabaki-$pkgver

  npm install --cache "${srcdir}/npm-cache"
  npm run build
}

check() {
  cd $srcdir/Sabaki-$pkgver
  npm test
}

package() {
  mkdir $pkgdir/opt
  mkdir -p $pkgdir/usr/bin

  cp -r $srcdir/Sabaki-$pkgver/dist/linux-unpacked/resources $pkgdir/opt/Sabaki
  echo -e '#!/bin/bash \nelectron13 /opt/Sabaki/app.asar' > $pkgdir/usr/bin/sabaki
  chmod 755 $pkgdir/usr/bin/sabaki
  install -Dm644 ${srcdir}/Sabaki-${pkgver}/logo.png $pkgdir/usr/share/pixmaps/sabaki.png
  install -Dm644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${srcdir}/${_pkgname}.xml ${pkgdir}/usr/share/mime/packages/${_pkgname}.xml
}
