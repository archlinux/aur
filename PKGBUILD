# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=scale-to-sound
pkgname=obs-$_pluginname
pkgver=1.1.0
_obsver=27.0.0
pkgrel=1
pkgdesc="A plugin for OBS Studio that adds a filter which makes a source scale based on the audio levels of any audio source you choose"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/scale-to-sound.1336/"
license=("GPL2")
depends=("obs-studio>=$_obsver")
makedepends=("cmake" "git" "libxcomposite")
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Qufyy/obs-scale-to-sound/archive/$pkgver.tar.gz"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "f4a90e8a0ec501243f88bbe1ccbfd85d6d88106d9a828f1dbb1ea75fcba18e23"
  "c7ea5369f4c94203a8a81b73c6372873f08ab9e5b20860691dad2c29f5dda85e"
)

prepare() {
  cd "obs-studio-$_obsver"/plugins

  cp -r "$srcdir/$pkgname-$pkgver" .

  echo "add_subdirectory($pkgname-$pkgver)" >> CMakeLists.txt
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
  mkdir -p $pkgdir/usr/lib/obs-plugins
  mkdir -p $pkgdir/usr/share/obs/obs-plugins

  cd "obs-studio-$_obsver"

  _fake_install_dir="$srcdir/obs-install"

  make -C build DESTDIR="$_fake_install_dir/" install

  cp -a $_fake_install_dir/usr/lib/obs-plugins/$_pluginname.so $pkgdir/usr/lib/obs-plugins/
  cp -a $_fake_install_dir/usr/share/obs/obs-plugins/$_pluginname $pkgdir/usr/share/obs/obs-plugins/

  rm -rf $_fake_install_dir
}
