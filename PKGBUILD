# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=polyphone
pkgver=2.0.1
pkgrel=1
pkgdesc="Graphical user interface for editing sf2 and sfz files"
arch=('i686' 'x86_64')
url="http://polyphone-soundfonts.com/"
license=('GPL3')
depends=('desktop-file-utils' 'libvorbis' 'qt5-svg' 'portaudio' 'stk')
makedepends=('rtmidi')
source=("${pkgname}-${pkgver}-src.zip::https://www.polyphone-soundfonts.com/en/download/file/611-polyphone-2-0-src-zip/latest/download?20ccdbdec80fcdb11e421a6e127e4241=1"
        "https://raw.githubusercontent.com/davy7125/polyphone/master/deployment/debian/polyphone.desktop"
        "https://raw.githubusercontent.com/davy7125/polyphone/master/deployment/debian/polyphone.sharedmimeinfo")
changelog='ChangeLog'
sha256sums=('b0748ae1ad6d9455ccc686b531caeef2107ae78ba0bc8b77f6fe96ce39d77ef0'
            '18ba291bab99097767326738852e26e26ba124fd94398a2b2fc243ea3d16f2b9'
            '62ae04b2768feeafd22c8be223b0192df0a1dfc318a613e7eacc69164e7e9be6')


prepare() {
  cd "$srcdir/sources"

  # See https://github.com/davy7125/polyphone/issues/45
  sed -i \
    -e 's|#DEFINES += USE_LOCAL_QCUSTOMPLOT|DEFINES += USE_LOCAL_QCUSTOMPLOT|' \
    polyphone.pro
}

build() {
  cd "$srcdir/sources"

  qmake-qt5
  make
}

package() {
  cd "$srcdir/sources"

  install -D bin/polyphone "$pkgdir/usr/bin/$pkgname"
  install -Dm644 resources/polyphone.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.sharedmimeinfo" "$pkgdir/usr/share/mime/packages/$pkgname.xml"
}
