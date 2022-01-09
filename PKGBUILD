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
pkgver=1.6.1
pkgrel=2
arch=("i686" "x86_64" "aarch64")
pkgdesc="Get song info from right within obs"
url="https://obsproject.com/forum/resources/tuna.843/"
license=('GPL2')
depends=("obs-studio")
makedepends=("cmake" "git")
conflicts=("obs-plugin-tuna-bin" "obs-plugin-tuna-git")
source=(
  "$_pluginname::git+https://github.com/univrsal/tuna.git#tag=v$pkgver"
  "taglib::git+https://github.com/taglib/taglib"
  "libmpdclient::git+https://github.com/MusicPlayerDaemon/libmpdclient")
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {
  cd $_pluginname
  git config submodule.deps/taglib.url $srcdir/taglib
  git config submodule.deps/libmpdclient.url $srcdir/libmpdclient
  git submodule update
}

build() {
  cd $_pluginname
  cmake -B build\
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
