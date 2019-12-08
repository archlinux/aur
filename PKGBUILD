# Maintainer: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx_beta-git
pkgver=r6750
pkgrel=1
pkgdesc="Digital DJ mixing software. 2.3 (beta) branch."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=('chromaprint' 'faad2' 'gcc-libs' 'glibc' 'glib2' 'hidapi' 'libFLAC.so'
'libglvnd' 'libid3tag' 'liblilv-0.so' 'libmad' 'libmodplug' 'libmp4v2' 'libogg'
'libportaudio.so' 'libportmidi.so' 'librubberband.so' 'libshout' 'libsndfile'
'libtcmalloc.so' 'libusb-1.0.so' 'libvorbis.so' 'libvorbisenc.so'
'libvorbisfile.so' 'libx11' 'opusfile' 'protobuf' 'qt5-base' 'qt5-script'
'qt5-svg' 'qt5-x11extras' 'qtkeychain' 'soundtouch' 'sqlite' 'taglib' 'upower'
'wavpack')
makedepends=('git' 'glu' 'lv2' 'qt5-tools' 'scons' 'vamp-plugin-sdk')
checkdepends=('xorg-server-xvfb')
provides=("mixxx")
conflicts=(${mixxx%-*})
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git#branch=2.2"
        "${pkgname%-*}-scons-python3.patch::https://github.com/mixxxdj/mixxx/commit/73d02e58bcd.patch"
        "${pkgname%-*}-list-fix.patch::https://github.com/mixxxdj/mixxx/commit/03fad27e1f0.patch")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
#  echo "$(git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
   echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

prepare() {
  cd "$srcdir/${pkgname%-*}"
  # fixes for building with python3 based scons (from the official package)
  patch -Np1 -i ../${pkgname%-*}-scons-python3.patch
  patch -Np1 -i ../${pkgname%-*}-list-fix.patch
}

build() {
  cd "$srcdir/${pkgname%-*}"
  export SCONSFLAGS="-j $(nproc)"
  scons qtdir=/usr/lib/qt \
		prefix=/usr install_root="$pkgdir/usr" \
		virtualize=0 \
		opus=1 \
		optimize=native \
		build=release \
		faad=1 \
		modplug=1	
}

#check() {
#  cd "$srcdir/${pkgname%-*}"
#  xvfb-run lin64_build/${pkgname%-*}-test
#}

package() {
  cd "$srcdir/${pkgname%-*}"
  scons qtdir=/usr/lib/qt prefix=/usr install_root="$pkgdir/usr" install
}
