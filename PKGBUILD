# Maintainer: Demetri0 <d3i0@ya.ru>
pkgname=databaseanime-git
pkgver=374.f821fe6
pkgrel=1
pkgdesc="Management of your collection Anime, Manga, AMV and Dorama"
arch=('i686' 'x86_64')
url="https://github.com/LibertaSoft/DatabaseAnime"
license=('GPLv3')
makedepends=('git' 'make')
depends=('qt5-base>=5.3' 'qt5-translations' 'sqlite>=3.7.9' 'hicolor-icon-theme' 'desktop-file-utils')
 optdepends=('giflib: GIF images support'
             'libjpeg: JPEG images support'
             'libpng: PNG images support')
conflicts=('databaseanime')
provides=('databaseanime')
options=()
install=databaseanime.install
source=("$pkgname"::'git+https://github.com/LibertaSoft/DatabaseAnime.git' 
  'DatabaseAnime.desktop'
  'databaseanime.install')
md5sums=('SKIP'
  '55dc0013104bcb53eb012389f30e5411'
  '51eef5ac2bb99c96ecea1d705734e04d')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"

  mkdir build && cd build
  qmake .. -config release
  make
  lrelease ../DatabaseAnime/DatabaseAnime.pro
}

package() {
  # [MAKE DIRS]
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/128x128/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/256x256/apps
  mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/apps
  mkdir -p images/DBA_Icon.png $pkgdir/usr/share/pixmaps

  # [COPY LOCALIZATIONS]
  cd "$srcdir/$pkgname/DatabaseAnime"
  cp DatabaseAnime_ru.qm $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  cp DatabaseAnime_en.qm $pkgdir/usr/share/LibertaSoft/DatabaseAnime/l10n/
  cd "../../../"
  
  cp ./DatabaseAnime.desktop $pkgdir/usr/share/applications/DatabaseAnime.desktop
  
  # [COPY ICONS]
  cd "$srcdir/$pkgname/DatabaseAnime/images"
  cp DBA_Icon-64.png $pkgdir/usr/share/icons/hicolor/64x64/apps/DatabaseAnime.png
  cp DBA_Icon.png $pkgdir/usr/share/icons/hicolor/128x128/apps/DatabaseAnime.png
  cp DBA_Icon-256.png $pkgdir/usr/share/icons/hicolor/256x256/apps/DatabaseAnime.png
  cp DBA_Icon-512.png $pkgdir/usr/share/icons/hicolor/512x512/apps/DatabaseAnime.png
  cp DBA_Icon.png $pkgdir/usr/share/pixmaps/DatabaseAnime.png
  cd "../../../../"

  cd "$srcdir/$pkgname/build"
  cp ./DatabaseAnime/DatabaseAnime $pkgdir/usr/bin/dba
  cd "../../../"
}
