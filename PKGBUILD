# Maintainer: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-git
pkgver=r7032
pkgrel=1
pkgdesc="Digital DJ mixing software. Git master branch (development/alpha)."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=('libmad' 'qt5-script' 'qt5-svg' 'qt5-x11extras' 'taglib' 'libmp4v2' 
'rubberband' 'portaudio' 'portmidi' 'protobuf' 'libshout' 'libid3tag' 'opusfile' 'chromaprint' 'lilv' 'upower')
makedepends=('git' 'scons' 'pkgconfig' 'glu' 'qt5-tools')
provides=('mixxx')
conflicts=('mixxx')
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git")
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
		modplug=1 \
		opus=1 \
		optimize=native \
		virtualize=0
}

package() {
  cd "$srcdir/${pkgname%-*}"
  scons qtdir=/usr/lib/qt prefix=/usr install_root="$pkgdir/usr" install
}
