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
pkgver=1.9.5
pkgrel=1
arch=("x86_64" "aarch64")
pkgdesc="Get song info from right within obs"
url="https://obsproject.com/forum/resources/tuna.843/"
license=('GPL2')
depends=("obs-studio>=28" "libmpdclient" "taglib")
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
  cd $_pluginname
  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6 \
  -DCREDS="$SPOTIFY_TOKEN" \
  -DLASTFM_CREDS="$LASTFM_KEY"

  make -C build
}

package() {
  cd $_pluginname
  make -C build DESTDIR="$pkgdir/" install
}