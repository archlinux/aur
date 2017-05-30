_pkgbasename=webrtc-audio-processing
pkgname=lib32-$_pkgbasename
pkgver=0.3
pkgrel=2
pkgdesc="AudioProcessing library based on Google's implementation of WebRTC"
url="https://freedesktop.org/software/pulseaudio/webrtc-audio-processing/"
arch=(x86_64)
license=(custom)
depends=(lib32-gcc-libs)
makedepends=(git)
optdepends=('webrtc-audio-processing: development headers')
_commit=fc0e76139404e08cc5b8024daafa1ddf576a4e21  # tags/v0.3^0
source=("git+https://anongit.freedesktop.org/git/pulseaudio/webrtc-audio-processing#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbasename
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgbasename
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgbasename
  export CC='gcc -m32'
  export CXX='g++ -m32'
  ./configure --disable-static --prefix=/usr --libdir=/usr/lib32 
  make
}

package() {
  cd $_pkgbasename
  make DESTDIR=${pkgdir} install
  if ! [ -z "$pkgdir/usr/include/webrtc_audio_processing" ]; then
	rm -r "$pkgdir/usr/include"
  fi
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
