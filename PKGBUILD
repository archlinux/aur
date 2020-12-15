# Maintainer: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>

pkgname=mixxx-git
pkgver=r7686
pkgrel=1
pkgdesc="Digital DJ mixing software. Git master branch (development/alpha)."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=('chromaprint' 'flac' 'fftw' 'hidapi' 'lame' 'libsndfile' 'libmodplug' 'libid3tag' 'liblilv-0.so' 'libmad' 'libmp4v2' 'libportaudio.so' 
'libportmidi.so' 'librubberband.so' 'libtheora' 'opusfile' 'protobuf' 'qt5-script'
'qt5-svg' 'qt5-x11extras' 'qtkeychain' 'soundtouch' 'speex' 'taglib' 'upower')
makedepends=('git' 'glu' 'lv2' 'qt5-tools' 'cmake' 'vamp-plugin-sdk' 'qt5-declarative')
provides=('mixxx')
conflicts=('mixxx')
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git")
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/${pkgname%-*}"
   echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

build() {
   mkdir -p "$srcdir/build"
   cd "$srcdir/build" || exit 1
   cmake \
    -DCMAKE_INSTALL_PREFIX=/ \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DOPTIMIZE=native \
    -DFAAD=ON \
    -DLILV=ON \
    -DFFMPEG=ON \
    -DKEYFINDER=OFF \
    -DMAD=ON \
    -DMODPLUG=ON \
    -DOPUS=ON \
    -DQTKEYCHAIN=ON \
    "$srcdir/${pkgname%-*}"
  cmake --build . --parallel "$(nproc)"
 }
 
package() {
	DESTDIR="$pkgdir" cmake --install $srcdir/${pkgname%-*}/cmake_build
}

 package() {
  cd "$srcdir/build" || exit 1
  make DESTDIR="$pkgdir" install
 }
