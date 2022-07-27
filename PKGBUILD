# Maintainer: tytan652 <tytan652@tytanium.xyz>

# You can make those variable persistent by adding them to `~/.makepkg.conf`
if [ -z "$SPOTIFY_TOKEN" ]; then
  SPOTIFY_TOKEN="MISSING"
fi

if [ -z "$LASTFM_KEY" ]; then
  LASTFM_KEY="MISSING"
fi

_pluginname=tuna
pkgname=obs-$_pluginname
pkgver=1.7.1
pkgrel=1
arch=("i686" "x86_64" "aarch64")
pkgdesc="Get song info from right within obs"
url="https://obsproject.com/forum/resources/tuna.843/"
license=('GPL2')
depends=("obs-studio<28" "libmpdclient" "taglib")
makedepends=("cmake" "vlc" "git")
conflicts=("obs-plugin-tuna-bin" "obs-plugin-tuna-git")
options=('debug')
source=(
  "$_pluginname::git+https://github.com/univrsal/tuna.git#tag=v$pkgver"
  "FindLibMPDClient.cmake"
  "FindTaglib.cmake"
  "deps_CMakeLists.txt")
sha256sums=(
  "SKIP"
  "7a98baa9bcaddbb76cf00d11b3765fec4a696d2d793ef25c04939941e44cf4dc"
  "8b6b5627dee73246eff61de3189d7ed33fe6c81c19373851feafe98421ffb3ae"
  "6b90db87873aa90d1127200e0a23a7eb0a3bebad1c110fb698a1e421a06c6758"
)

prepare() {
  cd $_pluginname

  cp $srcdir/FindLibMPDClient.cmake cmake/external/.
  cp $srcdir/FindTaglib.cmake cmake/external/.
  cp $srcdir/deps_CMakeLists.txt deps/CMakeLists.txt

  sed -i '29 a find_package(LibMPDClient REQUIRED)\nfind_package(Taglib REQUIRED)\nfind_package(LibVLC REQUIRED)' CMakeLists.txt
  sed -i '40 a include_directories(${LIBVLC_INCLUDE_DIRS})' CMakeLists.txt
}

build() {
  cd $_pluginname
  cmake -B build\
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DGLOBAL_INSTALLATION=ON \
  -DCREDS="$SPOTIFY_TOKEN" \
  -DLASTFM_CREDS="$LASTFM_KEY"
  make -C build
}

package() {
  cd $_pluginname
  make -C build DESTDIR="$pkgdir/" install
}
