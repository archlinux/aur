# Maintainer: tytan652 <tytan652@tytanium.xyz>
_pluginname=SceneSwitcher
_pluginname2=advanced-scene-switcher
pkgname=obs-$_pluginname2
pkgver=1.15.1
_obsver=27.0.0
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=("GPL2")
depends=("obs-studio>=$_obsver" "libxss" "libxtst")
makedepends=("cmake" "git" "libxcomposite")
source=(
  "$pkgname-$pkgver"::"git+https://github.com/WarmUpTill/$_pluginname.git#tag=$pkgver"
  "git+https://github.com/chriskohlhoff/asio.git"
  "git+https://github.com/zaphoyd/websocketpp.git"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "c7ea5369f4c94203a8a81b73c6372873f08ab9e5b20860691dad2c29f5dda85e"
)

prepare() {
  rm -rf fakeroot

  cd "$pkgname-$pkgver"

  git config submodule.deps/asio.url $srcdir/asio
  git config submodule.deps/websocketpp.url $srcdir/websocketpp
  git submodule update

  cd "$srcdir/obs-studio-$_obsver"/UI/frontend-plugins
  cp -r "$srcdir/$pkgname-$pkgver" .
  echo "add_subdirectory($pkgname-$pkgver)" | tee -a CMakeLists.txt >/dev/null
}

# Need to compile plugin in OBS compilation process
build() {
  cd "obs-studio-$_obsver"
  cmake -B build \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DENABLE_UI=ON \
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
  cp -a "$srcdir"/fakeroot/usr/lib/obs-plugins/$_pluginname2.so "$pkgdir"/usr/lib/obs-plugins/
  cp -a "$srcdir"/fakeroot/usr/share/obs/obs-plugins/$_pluginname2 "$pkgdir"/usr/share/obs/obs-plugins/
}
