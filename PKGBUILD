# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive
pkgver=20181223
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia')
makedepends=('libicns')
source=("${pkgver}.tar.gz::https://github.com/olive-editor/olive/archive/${pkgver}.tar.gz"
        "olive.desktop"
       )
sha512sums=('b9421faa8bc03855cd51837d1f4a264eea1e32d8a4a2fdbb033f4a5a5622220215c66b52b08ba4eb62788665e065b8bfdf43eae6383f4cf6b8e2bd36c5625f95'
            '5c6e6fb0309bfc6a45cde61051df285e8b092545dd56e08aa49c322dd5ce52f8b50f094e5056350222c78e38b1f07a179244beaf8053c923a9fe06d2bff21f3d'
           )

prepare() {
  # Configure qmake project
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s/^/target.path = \/usr\/bin\n/' $pkgname.pro
  sed -i '1s/^/INSTALLS += target\n/' $pkgname.pro

  # Extract icons from the ICNS file
  cd "$srcdir/$pkgname-$pkgver/icons"
  icns2png -x olive.icns
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake $pkgname.pro
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 "$srcdir/olive.desktop" \
                 "$pkgdir/usr/share/applications/olive.desktop"

  install -Dm644 "$srcdir/$pkgname-$pkgver/icons/olive_16x16x32.png" \
                 "$pkgdir/usr/share/icons/hicolor/16x16/apps/olive.png"

  install -Dm644 "$srcdir/$pkgname-$pkgver/icons/olive_32x32x32.png" \
                 "$pkgdir/usr/share/icons/hicolor/32x32/apps/olive.png"

  install -Dm644 "$srcdir/$pkgname-$pkgver/icons/olive_256x256x32.png" \
                 "$pkgdir/usr/share/icons/hicolor/256x256/apps/olive.png"

  install -Dm644 "$srcdir/$pkgname-$pkgver/icons/olive_512x512x32.png" \
                 "$pkgdir/usr/share/icons/hicolor/512x512/apps/olive.png"

  install -Dm644 "$srcdir/$pkgname-$pkgver/icons/olive_1024x1024x32.png" \
                 "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/olive.png"
}
