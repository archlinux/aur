# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=clipgrab-kde
pkgver=3.8.2
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
sha256sums=('ad95bd33cffa776e1456ad8b6e61b03b46035b97b39a1a4b29aedc466bd81136'
            '840910097d8c129ea12c395c4a33f562591e878e521c98fde8a7b3f9403aa23f'
            '7be395e3e034fba8760057b96c4cc6a684d96a1444225246bbc4b787ec8b7e84')

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
