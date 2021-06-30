#Maintainer: Alexander Fasching <fasching.a91@gmail.com>
#Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
#Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=qsstv
pkgver=9.5.3
_pkgver=9.5.3
pkgrel=2
pkgdesc="Radio Slow-Scan TV for qt"
url="http://users.telenet.be/on4qz/"
depends=('qt5-base' 'libpulse' 'v4l-utils' 'hamlib' 'fftw' 'openjpeg2' 'alsa-lib')
source=(http://users.telenet.be/on4qz/qsstv/downloads/${pkgname}_${pkgver}.tar.gz
        $pkgname.desktop
        0001-filpathlen.patch)

arch=('i686' 'x86_64')
license=('GPL')
sha512sums=('1753bb498163d17c80c3c322eda2725eae3de17c99e07fd99f4223508c3048521547148d69623f16f4192212a754f415e0f12f5fc98527b14bf00afcb3ae7c6d'
            '793be2e500824966d4288fff059fe5c869ec547ff5f4e32fbec02eeae1b12d6aa4e5ba34a9ce590bb166b73086291bfa3e0c2d76fb7c03187f656e8955acef4c'
            '43da3a50dab3a0b3cbac0a395877e409bcbba94c357e55da99bda7cbf0b82b90098fdefc50de1f6c6dd902e95880f4c2f078dee48c24a009e507e74f0dd755d3')

prepare() {
  cd "$srcdir/${pkgname}_$_pkgver"
  patch --forward --strip=1 --input="${srcdir}/0001-filpathlen.patch"
}

build() {
  cd "$srcdir/${pkgname}_$_pkgver"

  # trick qmake
  # qmake-qt5 PREFIX="$pkgdir/usr/"
  qmake-qt5 PREFIX=/usr/
  make $MAKEFLAGS
}

package() {
  cd "$srcdir/${pkgname}_$_pkgver"
  mkdir -p "$pkgdir/usr/bin/"
  make INSTALL_ROOT="$pkgdir" install

  cd $srcdir
  install -D -m644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 "$srcdir/${pkgname}_$_pkgver/icons/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
