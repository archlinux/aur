# Maintainer: Giusy Digital <kurmikon@libero.it>
# Contributor: Juan Simón <play4pro@protonmail.com>
# Contributor: Serhii Starovoitov <drommer.94@gmail.com>

_pkgbasename=mediainfo-gui
pkgname=mediainfo-gui-qt
pkgver=25.10
pkgrel=1
pkgdesc="Supplies technical and tag information about a video or audio file (Qt GUI interface)"
arch=('x86_64')
url="https://github.com/MediaArea/MediaInfo"
license=('BSD-2-Clause')
depends=('hicolor-icon-theme' 'libmediainfo' 'qt6-base' 'qt6-webengine')
makedepends=('clang' 'glibc' 'qt6-tools')
conflicts=("$_pkgbasename")
provides=("$_pkgbasename=$pkgver")
source=("$pkgname-$pkgver.tar.gz::https://github.com/MediaArea/MediaInfo/archive/v$pkgver.tar.gz"
        "$_pkgbasename.desktop")
sha256sums=('2edaff16dfad9ee372d17d6d01eb2e3d2f8ee8dd4af606b1ee6f045c9b009662'
            'dbac58889cd842729bbe0e9cfeb0d7492bea8b0a4801a10d2017c079251fc797')

prepare() {
  cd "$srcdir/MediaInfo-$pkgver/Source/GUI/Qt/Qt_Translations_Updater"
  sed -i -e 's|lupdate|/usr/lib/qt6/bin/lupdate|' \
         -e 's|lrelease|/usr/lib/qt6/bin/lrelease|' update_Qt_translations.sh
  chmod +x ./update_Qt_translations.sh
  ./update_Qt_translations.sh
}

build() {
  cd "$srcdir/MediaInfo-$pkgver/Project/QMake/GUI"
  qmake6 "MediaInfoQt.pro"
  make
}

package() {
  cd "$srcdir/MediaInfo-$pkgver"

  install -Dm644 "../$_pkgbasename.desktop" -t "$pkgdir/usr/share/kio/servicemenus"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "Source/Resource/Image/MediaInfo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/mediainfo.svg"
  install -Dm644 "Project/GNU/GUI/$_pkgbasename.desktop" -t "$pkgdir/usr/share/applications"

  cd "Project/QMake/GUI"
  make INSTALL_ROOT="$pkgdir" install
}
