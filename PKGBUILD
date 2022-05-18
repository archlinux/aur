# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-rtspserver
pkgver=2.2.1
_obsver=27.2.0
pkgrel=3
pkgdesc="This is a plugin for obs-studio, encoding the output and publish rtsp stream"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/obs-rtspserver.1037/"
license=("GPL2")
depends=("obs-studio>=$_obsver" "obs-studio<28")
makedepends=("cmake" "git" "libxcomposite" "ffmpeg" "pciutils")
source=(
  "$pkgname::git+https://github.com/iamscottxu/obs-rtspserver.git#tag=v$pkgver"
  "obs-studio-$_obsver.tar.gz::https://github.com/obsproject/obs-studio/archive/$_obsver.tar.gz"
)
sha256sums=(
  "SKIP"
  "c52d99cba6c536cb805e3e0f54663c33cfc43a1b7521bec97d241019499f9789"
)

prepare() {
  cd "obs-studio-$_obsver"/plugins

  cp -r "$srcdir/$pkgname" .

  echo "add_subdirectory($pkgname)" | tee -a CMakeLists.txt >/dev/null
}

# Need to compile plugin in OBS compilation process
build() {
  cd "obs-studio-$_obsver"

  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr' \
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
  mkdir -p $pkgdir/usr/lib/obs-plugins
  mkdir -p $pkgdir/usr/share/obs/obs-plugins

  cd "obs-studio-$_obsver"

  _fake_install_dir="$srcdir/obs-install"

  make -C build DESTDIR="$_fake_install_dir/" install

  cp -a $_fake_install_dir/usr/lib/obs-plugins/$pkgname.so $pkgdir/usr/lib/obs-plugins/
  cp -a $_fake_install_dir/usr/share/obs/obs-plugins/$pkgname $pkgdir/usr/share/obs/obs-plugins/

  rm -rf $_fake_install_dir
}
