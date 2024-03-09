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
pkgver=1.9.7
pkgrel=2
arch=("x86_64" "aarch64")
pkgdesc="Get song info from right within obs"
url="https://obsproject.com/forum/resources/tuna.843/"
license=(GPL-2.0-or-later)
depends=(
  "obs-studio>=28" "curl" "dbus" "gcc-libs" "glibc" "libmpdclient"
  "qt6-base" "taglib"
)
makedepends=("cmake" "git" "vlc")
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
  "f73a37aeb6e5af5a2f2e2fd0eda78c5b3eb909bdd52f291f740bf8092b1bf70a"
)

prepare() {
  cd $_pluginname

  cp $srcdir/FindLibMPDClient.cmake cmake/external/.
  cp $srcdir/FindTaglib.cmake cmake/external/.
  cp $srcdir/deps_CMakeLists.txt deps/CMakeLists.txt

  sed -i '13 a find_package(LibMPDClient REQUIRED)\nfind_package(Taglib REQUIRED)' CMakeLists.txt
}

build() {
  cmake -B build -S $_pluginname \
  -DCMAKE_BUILD_TYPE=None \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCREDS="$SPOTIFY_TOKEN" \
  -DLASTFM_CREDS="$LASTFM_KEY" \
  -Wno-dev \
  -DCMAKE_CXX_FLAGS="-Wno-error=deprecated-declarations"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
