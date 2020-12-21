# Maintainer: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>

pkgname=mixxx-git
pkgver=r7694
pkgrel=1
pkgdesc="Digital DJ mixing software. Git master branch (development/alpha)."
arch=('i686' 'x86_64')
url="http://www.mixxx.org/"
license=('GPL2')
groups=('pro-audio')
depends=('chromaprint' 'flac' 'fftw' 'hidapi' 'lame' 'libsndfile' 'libmodplug' 'libid3tag' 'liblilv-0.so' 'libmad' 'libmp4v2' 'libportaudio.so' 
'libportmidi.so' 'librubberband.so' 'libtheora' 'opusfile' 'protobuf' 'qt5-script'
'qt5-svg' 'qt5-x11extras' 'qtkeychain' 'soundtouch' 'speex' 'taglib' 'upower' 'libebur128' 'qt5-declarative')
makedepends=('git' 'glu' 'lv2' 'qt5-tools' 'cmake' 'vamp-plugin-sdk')
provides=('mixxx')
conflicts=('mixxx')
source=("${pkgname%-*}::git+https://github.com/mixxxdj/mixxx.git")
md5sums=('SKIP')

pkgver() {
   cd "$srcdir/${pkgname%-*}"
   echo "r$(git log --pretty=oneline --first-parent | wc -l)"
}

prepare() {
	mkdir "$srcdir/${pkgname%-*}/cmake_build"
	cmake -S $srcdir/${pkgname%-*} -B $srcdir/${pkgname%-*}/cmake_build \
	-DCMAKE_INSTALL_PREFIX=/ \
	-DINSTALL_USER_UDEV_RULES=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DOPTIMIZE=native \
	-DFAAD=ON \
	-DLILV=ON \
	-DFFMPEG=ON \
	-DKEYFINDER=OFF \
	-DMAD=ON \
	-DMODPLUG=ON \
	-DOPUS=ON \
	-DQTKEYCHAIN=ON
}

build() {
  cmake --build $srcdir/${pkgname%-*}/cmake_build --parallel `nproc`
}

#check() {
#	cd "$srcdir/${pkgname%-*}"
#	xvfb-run lin64_build/${pkgname%-*}-test
#}

package() {
	DESTDIR="$pkgdir" cmake --install $srcdir/${pkgname%-*}/cmake_build
}
