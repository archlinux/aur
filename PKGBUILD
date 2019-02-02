# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=mediainfo-gui-git
pkgver=18.12.r6.gddd0e66e
pkgrel=1
pkgdesc="GUI utility for displaying technical and tag data for media files"
arch=('i686' 'x86_64')
url="https://mediaarea.net/en/MediaInfo"
license=('BSD')
depends=('glibc' 'desktop-file-utils' 'hicolor-icon-theme' 'libmediainfo' 'qt5-base')
makedepends=('git')
provides=('mediainfo-gui')
conflicts=('mediainfo-gui')
source=("git+https://github.com/MediaArea/MediaInfo.git")
sha256sums=('SKIP')


pkgver() {
  cd "MediaInfo"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "MediaInfo/Project/QMake/GUI"

  qmake "MediaInfoQt.pro"
  make
}

package() {
  cd "MediaInfo"

  pushd "Project/QMake/GUI"
  make INSTALL_ROOT="$pkgdir" install
  popd

  install -Dm644 "Source/Resource/Image/MediaInfo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/mediainfo.png"
  install -Dm644 "Source/Resource/Image/MediaInfo.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/mediainfo.svg"
  install -Dm644 "Source/Resource/Image/MediaInfo.xpm" \
    "$pkgdir/usr/share/pixmaps/mediainfo.xpm"
  install -Dm644 "Project/GNU/GUI/mediainfo-gui.desktop" \
    "$pkgdir/usr/share/applications/mediainfo-gui.desktop"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/mediainfo-gui/LICENSE"
}
