# Maintainer: Cogumelo cogumelo@tutamail.com
pkgname=imageviewer
pkgver=1.8.2
pkgrel=6
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
  '69dc4f00858e38bdaeff79991bc53e862fd378a2b9bd1326d864a43526843eab'
  '5873ba480dcf1729494af0499611f4389cabc69e3862b491141a03a05dc4ec3b'
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
