# Maintainer: Cogumelo cogumelo@tutamail.com
pkgname=imageviewer
pkgver=1.9.1
pkgrel=1
license=('GPL-3.0-or-later')
arch=('x86_64')
pkgdesc="Simple, cross-platform image viewer"
url="https://github.com/AlienCowEatCake/ImageViewer"
depends=('openexr' 'freetype2' 'qt6-base' 'qt6-svg' 'qt6-imageformats' 'libexif' 'libavif' 'libheif' 'jxrlib' 'librsvg' 'giflib' 'zlib' 'lcms2' 'exiv2' 'libjpeg-turbo' 'libmng' 'libpng' 'jbigkit' 'libtiff' 'libwebp' 'libwmf' 'openjpeg2' 'libraw' 'libjxl' 'libyuv')
makedepends=('git' 'gcc' 'make' 'qt6-tools')
optdepends=('kimageformats' 'qt6-imageformats' 'resvg')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
source=(
  ImageViewer-"$pkgver".tar.gz::https://github.com/AlienCowEatCake/ImageViewer/releases/download/v"$pkgver"/ImageViewer-"$pkgver".tar.xz
  com.github.aliencoweatcake.imageviewer.desktop
  com.github.aliencoweatcake.imageviewer.appdata.xml
)
sha256sums=(
  'd304c47afcba88a95e1309fca5b75710dd5f919ed5f62c6a8895e2c383d76c00'
  '1a6c1e058714e80740e6caf8f73be2cd646c994d7abea0988005b1f777d3533e'
  '240692987a63667433c1a85587ad86bd15a7895c9c91325265450515c0b595a5'
)

prepare() {
  cp ImageViewer-"$pkgver"/src/ImageViewer/resources/icon/drawing.svg ImageViewer.svg
  rm -r ImageViewer-"$pkgver"/src/ImageViewer/resources/icon
}

build() {
  qmake6 \
    CONFIG+="release system_thirdparty" \
    CONFIG+="disable_libjasper disable_libbpg disable_flif disable_lerc" \
    INCLUDEPATH+="/usr/include/jxrlib" \
  -r "$srcdir"/ImageViewer-"$pkgver"/ImageViewer.pro
  make
}

package() {
  install -Dm 755 "$srcdir"/src/ImageViewer/ImageViewer "$pkgdir"/usr/bin/ImageViewer
  install -Dm 755 ImageViewer.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/ImageViewer.svg
  install -Dm 755 com.github.aliencoweatcake.imageviewer.desktop "$pkgdir"/usr/share/applications/com.github.aliencoweatcake.imageviewer.desktop
  install -Dm 755 com.github.aliencoweatcake.imageviewer.appdata.xml "$pkgdir"/usr/share/metainfo/com.github.aliencoweatcake.imageviewer.appdata.xml
}
