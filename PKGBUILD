pkgname=cantata-git
pkgver=2.0.50.r6107.854eec9
pkgrel=1
pkgdesc="Qt5 graphical client for Music Player Daemon (MPD) - git version."
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
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  _ver="$(cat CMakeLists.txt | grep -m3 -e CPACK_PACKAGE_VERSION_MAJOR -e CPACK_PACKAGE_VERSION_MINOR \
       -e CPACK_PACKAGE_VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
    -DENABLE_LIBVLC=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
