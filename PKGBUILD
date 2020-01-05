# Maintainer: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx_beta-git
pkgver=r6755
pkgrel=1
pkgdesc="Digital DJ mixing software. 2.3 (beta) branch."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=('chromaprint' 'faad2' 'hidapi' 'libid3tag' 'liblilv-0.so' 'libmad' 'libmp4v2' 'libportaudio.so' 
'libportmidi.so' 'librubberband.so' 'libshout' 'opusfile' 'protobuf' 'qt5-script'
'qt5-svg' 'qt5-x11extras' 'soundtouch' 'taglib' 'upower')
makedepends=('git' 'glu' 'lv2' 'qt5-tools' 'scons' 'vamp-plugin-sdk')
#checkdepends=('xorg-server-xvfb')
provides=('mixxx')
conflicts=('mixxx')
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git#branch=2.2")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
#  echo "$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
   echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

build() {
  cd "$srcdir/${pkgname%-*}"
  export SCONSFLAGS="-j $(nproc)"
  scons qtdir=/usr/lib/qt \
		prefix=/usr install_root="$pkgdir/usr" \
		build=release \
		faad=1 \
		ffmpeg=1 \
		modplug=1 \
		opus=1 \
		optimize=native \
		virtualize=0
}

#check() {
#  cd "$srcdir/${pkgname%-*}"
#  xvfb-run lin64_build/${pkgname%-*}-test
#}

package() {
  cd "$srcdir/${pkgname%-*}"
  scons qtdir=/usr/lib/qt prefix=/usr install_root="$pkgdir/usr" install
}
