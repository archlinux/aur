# Maintainer: Florian Bigard <florian.bigard@gmail.com>
# Thanks to Adria Arrufat <swiftscythe@gmail.com>

pkgname=clementine-qt5-git
pkgver=1.2.3.r1648.gc224911
pkgrel=1
pkgdesc="Experimental Qt5 version of Clementine, a modern music player and library organiser."
arch=('i686' 'x86_64')
license=('GPL')
depends=('gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly'
         'gst-libav' 'taglib' 'glew' 'desktop-file-utils' 'hicolor-icon-theme'
         'qt5-base' 'libechonest-qt5' 'protobuf' 'crypto++' 'chromaprint'
         'libmygpo-qt5-git' 'qt5-x11extras')
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
        'spotify_install.patch')
sha256sums=('SKIP' '05a438fb445790200258c536d396a6bda9df38a9b775d5259421376ec1878786')

provides=('clementine')
conflicts=('clementine' 'clementine-lxqt' 'clementine-git')
replaces=('clementine' 'clementine-lxqt' 'clementine-git')


pkgver() {
  cd Clementine
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Clementine
  git revert -n 170c64cd8bef9df2ea88dd4f72eec641c250bcfd
  patch -Np0 -i ../spotify_install.patch
}

build() {
  mkdir -p build
  cd build

  # Don't make a release build since it's experimental and we would need debug/info/warning messages
  # Add -DCMAKE_BUILD_TYPE=Release if you're an adventurer
  cmake "../Clementine" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR=${pkgdir} install
}
