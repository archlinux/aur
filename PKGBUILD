# Maintainer: Florian Bigard <florian.bigard@gmail.com>
# Thanks to Adria Arrufat <swiftscythe@gmail.com>

pkgname=clementine-qt5-git
pkgver=1.3.1.r659.g453270c8b
pkgrel=1
pkgdesc="Experimental Qt5 version of Clementine, a modern music player and library organiser."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
         'gst-libav' 'taglib' 'glew' 'desktop-file-utils' 'hicolor-icon-theme'
         'qt5-base' 'protobuf' 'crypto++' 'chromaprint'
         'libmygpo-qt5' 'qt5-x11extras')
makedepends=('git' 'boost' 'cmake' 'mesa' 'qt5-tools')
install=clementine.install
# Uncomment next lines to enable all the  features
#depends+=('libspotify' 'libgpod' 'liblastfm-qt5' 'sparsehash' 'libcdio' 'libmtp' 'fftw')
optdepends=(
  'libspotify: for Spotify support'
  'libgpod: for iPhone and iPod Touch support'
  'liblastfm-qt5: for LastFM support'
  'sparsehash: for cloud support (Dropbox, Google Drive...)'
  'libcdio: for CD support'
  'libmtp: for MTP support'
  'fftw: for moodbar support'
)

url="http://www.clementine-player.org/"
source=('git+https://github.com/clementine-player/Clementine.git#branch=qt5'
        'qtdbus.patch')
sha256sums=('SKIP' '289ba9393bec5def2ed4fef317be3bdfa749081b85c5e743de4dd223bb666b5c')

provides=('clementine')
conflicts=('clementine' 'clementine-lxqt' 'clementine-git')
replaces=('clementine' 'clementine-lxqt' 'clementine-git')


pkgver() {
  cd Clementine
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Clementine
  patch -Np1 -i ../qtdbus.patch
}

build() {
  mkdir -p build
  cd build

  # Don't make a release build since it's experimental and we would need debug/info/warning messages
  # Add -DCMAKE_BUILD_TYPE=Release if you're an adventurer
  cmake "../Clementine" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_SPOTIFY_BLOB=off
  make
}

package(){
  cd build
  make DESTDIR=${pkgdir} install
}
