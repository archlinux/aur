# Maintainer: kikadf <kikadf.01@gmail.com>

pkgname=clipgrab-kde
pkgver=3.8.13
_patchver=3.8.7
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
        https://gitlab.com/kikadf/clipgrab-qt5/raw/master/clipgrab-${_patchver}-kde.patch)
sha256sums=('050f0983c5b7464cc6580beeb511133e928c311a485d9d65073e903a8682ca67'
            '840910097d8c129ea12c395c4a33f562591e878e521c98fde8a7b3f9403aa23f'
            '4ff806da653541afa481029432343ee2c20b51857cea69bd59d422fcea58ef4d')

prepare() {
  cd clipgrab-${pkgver}
  patch -p1 -i ../clipgrab-${_patchver}-kde.patch
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
