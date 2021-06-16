# Maintainer: Brodi <me@brodi.space>
_pkgname=obs-rtspserver
pkgname=${_pkgname}-git
pkgver=0.r432
_obsver=27.0.1
pkgrel=1
pkgdesc="RTSP server plugin for obs-studio"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/iamscottxu/obs-rtspserver"
license=("GPL2")
depends=('obs-studio>=24.0.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=("cmake" "git")
source=(
  "${pkgname}::git+${url}"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha512sums=(
  "SKIP"
  "c15dda62c1f212f623914e61a90c6b1e035720fb84d64726c14f43d77ae7569777a23d04221db34347ce610e7c3407c29e726ae36412e98e34ea2ddb2072b7f3"
)

pkgver() {
	cd "${pkgname}"
	echo "0.r$(git rev-list --count HEAD)"
}

prepare() {
  rm -rf fakeroot

  cd "obs-studio-$_obsver"/plugins
  cp -r "$srcdir/$pkgname" .
  echo "add_subdirectory($pkgname)" | tee -a CMakeLists.txt >/dev/null
}

# Need to compile plugin in OBS compilation process
build() {
  cd "obs-studio-$_obsver"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DDISABLE_UI=ON \
  -DENABLE_WAYLAND=OFF \
  -DENABLE_PIPEWIRE=OFF \
  -DENABLE_SCRIPTING=OFF \
  -DDISABLE_DECKLINK=ON \
  -DDISABLE_ALSA=ON \
  -DDISABLE_JACK=ON \
  -DDISABLE_PULSEAUDIO=ON \
  -DDISABLE_V4L2=ON \
  -DDISABLE_SPEEXDSP=ON \
  -DDISABLE_LIBFDK=ON \
  -DDISABLE_SNDIO=ON \
  -DDISABLE_FREETYPE=ON \
  -DDISABLE_VLC=ON \
  -DBUILD_BROWSER=OFF \
  -DBUILD_VST=OFF \
  -DWITH_RTMPS=OFF

  make -C build
}

package() {
  mkdir -p "$pkgdir"/usr/lib/obs-plugins
  mkdir -p "$pkgdir"/usr/share/obs/obs-plugins

  cd "obs-studio-$_obsver"
  make -C build DESTDIR="$srcdir/fakeroot/" install
  cp -a "$srcdir"/fakeroot/usr/lib/obs-plugins/$_pkgname.so "$pkgdir"/usr/lib/obs-plugins/
  cp -a "$srcdir"/fakeroot/usr/share/obs/obs-plugins/$_pkgname "$pkgdir"/usr/share/obs/obs-plugins/
}

