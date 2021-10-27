# Maintainer: tytan652 <tytan652@tytanium.xyz>

_pluginname=advanced-scene-switcher
pkgname=obs-$_pluginname
pkgver=1.16.1
pkgrel=2
pkgdesc="An automated scene switcher for OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=("GPL2")
depends=("obs-studio" "libxss" "libxtst" "opencv")
makedepends=("cmake" "git")
source=(
  "$_pluginname"::"git+https://github.com/WarmUpTill/SceneSwitcher.git#tag=$pkgver"
  "git+https://github.com/chriskohlhoff/asio.git"
  "git+https://github.com/zaphoyd/websocketpp.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {
  cd $_pluginname

  git config submodule.deps/asio.url $srcdir/asio
  git config submodule.deps/websocketpp.url $srcdir/websocketpp
  git submodule update
}

build() {
  cd $_pluginname

  cmake -B build \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DBUILD_OUT_OF_TREE=ON \
  -DLIBOBS_FRONTEND_INCLUDE_DIR='/usr/include/obs/' \
  -DLIBOBS_FRONTEND_API_LIB='/usr/lib/libobs-frontend-api.so'

  make -C build
}

package() {
  cd $_pluginname

  make -C build DESTDIR="$pkgdir/" install
}
