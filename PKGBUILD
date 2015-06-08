# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=flacon-git
pkgname=('flacon-qt4-git' 'flacon-qt5-git')
pkgver=v1.0.1.3.ga605b17
pkgrel=1
pkgdesc="Extracts individual tracks from one big audio file containing the entire album of music and saves them as separate audio files. (Git Version)"
arch=('x86_64' 'i686')
url="http://flacon.github.io/"
license=('LGPL2.1')
makedepends=('cmake' 'git' 'qt4' 'qt5-tools' 'qt5-base' 'uchardet' 'shntool')
optdepends=('faac: For AAC support'
            'flac: For FLAC support'
            'lame: For MP3 support'
            'mac: For APE support'
            'mp3gain: For MP3 Replay Gain support'
            'vorbis-tools: For OGG support'
            'ttaenc: For TrueAudio support'
            'vorbisgain: For OGG Replay Gain support'
            'wavpack: For WavPack support')
source=('git+https://github.com/flacon/flacon.git')
sha1sums=('SKIP')

pkgver() {
  cd flacon
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build-qt{4,5}
}

build() {
  msg2 'Build with Qt4'
  cd build-qt4
  cmake ../flacon \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT4=ON
  make
  msg2 'Build with Qt5'
  cd ../build-qt5
  cmake ../flacon \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON
  make
}

package_flacon-qt4-git() {
  pkgdesc="Extracts individual tracks from one big audio file containing the entire album of music and saves them as separate audio files. Qt4 build (Git Version)"
  depends=('qt4' 'uchardet' 'shntool')
  conflicts=('flacon' 'flacon-qt5')
  provides=('flacon' 'flacon-qt4')
  install=flacon-git.install

  make -C build-qt4 DESTDIR="${pkgdir}" install
}

package_flacon-qt5-git() {
  pkgdesc="Extracts individual tracks from one big audio file containing the entire album of music and saves them as separate audio files. Qt5 build (Git Version)"
  depends=('qt5-base' 'uchardet' 'shntool' 'hicolor-icon-theme' 'desktop-file-utils')
  conflicts=('flacon' 'flacon-qt4')
  provides=('flacon' 'flacon-qt5')
  install=flacon-git.install

  make -C build-qt5 DESTDIR="${pkgdir}" install
}