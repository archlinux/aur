# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=dir-watch-media
pkgname=obs-$_pluginname
pkgver=0.5.3
_obsver=27.2.0
pkgrel=4
pkgdesc="Adds a filter you can add to media source to load the oldest or newest file in a directory"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/directory-watch-media.801/"
license=("GPL2")
depends=("obs-studio>=$_obsver")
makedepends=("cmake" "git" "libxcomposite" "ffmpeg" "pciutils")
source=(
  "$pkgname::git+https://github.com/exeldro/$pkgname#commit=859eac497a3976919b4c40b04c270544ac5b26f5"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "SKIP"
  "c52d99cba6c536cb805e3e0f54663c33cfc43a1b7521bec97d241019499f9789"
)

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
  cp -a "$srcdir"/fakeroot/usr/lib/obs-plugins/$_pluginname.so "$pkgdir"/usr/lib/obs-plugins/
  cp -a "$srcdir"/fakeroot/usr/share/obs/obs-plugins/$_pluginname "$pkgdir"/usr/share/obs/obs-plugins/
}