# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=clipgrab-kde
pkgver=3.8.1
pkgrel=1
pkgdesc='A video downloader and converter for YouTube, Veoh, DailyMotion, MyVideo, ...'
arch=(x86_64)
url='https://clipgrab.org'
license=(GPL3)
depends=(qt5-webengine)
optdepends=('ffmpeg: for the conversion functionality')
makedepends=('qt5-tools')
conflicts=('clipgrab')
provides=('clipgrab')
source=(https://download.clipgrab.org/clipgrab-${pkgver}.tar.gz
        clipgrab.desktop
       https://gitlab.com/kikadf/clipgrab-qt5/raw/master/clipgrab-${pkgver}-kde.patch)
sha256sums=('e4ab4a1337eeaa1fb06d638afd86414b9bdff5606e1a7a1e396f19cfd017dd3e'
            '840910097d8c129ea12c395c4a33f562591e878e521c98fde8a7b3f9403aa23f'
            'bd53c8b3130eb2a3bc908f7595bd52ef6a15b8bc3cfca89cbdef397404c3c5a5')

prepare() {
  cd clipgrab-${pkgver}
  patch -p1 -i ../clipgrab-${pkgver}-kde.patch
  lrelease clipgrab.pro
  lupdate clipgrab.pro
}

build() {
  cd clipgrab-${pkgver}
  qmake \
    QMAKE_CFLAGS_RELEASE="$CPPFLAGS $CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CPPFLAGS $CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS" \
    clipgrab.pro
  make
}

package() {
  cd clipgrab-${pkgver}
  install -Dm755 clipgrab -t "$pkgdir"/usr/bin/
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/clipgrab.png"
  install -Dm644 "$srcdir"/clipgrab.desktop -t "$pkgdir"/usr/share/applications/
}
