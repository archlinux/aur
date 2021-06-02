# Maintainer: tytan652 <tytan652@tytanium.xyz>
_pluginname=dvds3
_pluginname2=dvd-screensaver
pkgname=obs-$_pluginname
pkgver=1.1
_obsver=27.0.0
pkgrel=2
pkgdesc="obs-studio plugin, which adds a dvd screen saver source type"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/dvd-screensaver.762/"
license=("GPL2")
depends=("obs-studio>=$_obsver")
makedepends=("cmake" "libxcomposite")
source=(
  "$pkgname-$pkgver.tar.gz"::"https://github.com/univrsal/$_pluginname/archive/v$pkgver.tar.gz"
  "dvds3_fix_argument.patch"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "be521ad0ad69df2565d4edc3eca52125d87da019152afcd669d5d7b67d8ba150"
  "d2a2b747e942f23ce204fab1334f204fd271e0bb65c860c98bca2dca4018a23a"
  "c7ea5369f4c94203a8a81b73c6372873f08ab9e5b20860691dad2c29f5dda85e"
)

prepare() {
  rm -rf fakeroot

  cd "obs-studio-$_obsver"/plugins
  cp -r "$srcdir/$_pluginname-$pkgver" .
  echo "add_subdirectory($_pluginname-$pkgver)" | tee -a CMakeLists.txt >/dev/null

  cd "$_pluginname-$pkgver"
  patch -Np1 < "$srcdir"/dvds3_fix_argument.patch
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
  cp -a "$srcdir"/fakeroot/usr/lib/obs-plugins/$_pluginname2.so "$pkgdir"/usr/lib/obs-plugins/
  cp -a "$srcdir"/fakeroot/usr/share/obs/obs-plugins/$_pluginname2 "$pkgdir"/usr/share/obs/obs-plugins/
}