pkgname=cantata-git
pkgver=1.5.2.r5592.9ab375f
pkgrel=1
pkgdesc="Qt5 client for the Music Player Daemon (MPD) - git version."
arch=('i686' 'x86_64')
url="https://github.com/cdrummond/cantata"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'libmtp' 'libcddb' 'libmusicbrainz5' 'mpg123'
         'taglib-extras' 'hicolor-icon-theme' 'cdparanoia' 'speex' 'media-player-info' 'udisks2')
optdepends=('perl-uri: dynamic playlist'
            'mpd: playback'
            'ffmpeg: ReplayGain support')
makedepends=('git' 'cmake' 'qt5-tools' 'qt5-svg')
conflicts=('cantata' 'cantata-kde' 'cantata-kde-svn' 'cantata-kde-svn')
provides=('cantata')
source=("$pkgname::git+https://github.com/CDrummond/cantata.git")
install="${pkgname}.install"
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.5.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]
  then
    rm -rf build
  fi
   mkdir build
}

build() {
  cd build
  cmake ../${pkgname} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_HTTP_STREAM_PLAYBACK=ON \
    -DENABLE_KDE=OFF -DENABLE_QT5=ON \
    -DENABLE_UDISKS2=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
