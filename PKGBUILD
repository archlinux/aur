# Maintainer: Cogumelo cogumelo@tutamail.com
pkgname=imageviewer
pkgver=1.9.2
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
  '4635767ebf9243f67428ee47aaadba4e39081dc03e718036fb44b783cbd79777'
  '7f8fd6ceca5850471c7360417766b2fd3eb16e55aa4cc24d80b600b9606656ad'
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
  install -Dm 644 ImageViewer.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/ImageViewer.svg
  install -Dm 644 com.github.aliencoweatcake.imageviewer.desktop "$pkgdir"/usr/share/applications/com.github.aliencoweatcake.imageviewer.desktop
  install -Dm 644 com.github.aliencoweatcake.imageviewer.appdata.xml "$pkgdir"/usr/share/metainfo/com.github.aliencoweatcake.imageviewer.appdata.xml
}
