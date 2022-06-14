# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.17.7
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=("i686" "x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=("GPL2")
depends=("obs-studio<28" "libxss" "libxtst" "opencv" "procps")
makedepends=("cmake" "git")
options=('debug')
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#tag=$pkgver"
  "asio::git+https://github.com/chriskohlhoff/asio.git"
  "websocketpp::git+https://github.com/zaphoyd/websocketpp.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
  "SKIP"
)

prepare() {
  cd $pkgname

  git config submodule.deps/asio.url $srcdir/asio
  git config submodule.deps/websocketpp.url $srcdir/websocketpp
  git submodule update
}

build() {
  cd $pkgname

  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DBUILD_OUT_OF_TREE=ON \
  -DLIBOBS_FRONTEND_INCLUDE_DIR='/usr/include/obs/' \
  -DLIBOBS_FRONTEND_API_LIB='/usr/lib/libobs-frontend-api.so'

  make -C build
}

package() {
  cd $pkgname

  make -C build DESTDIR="$pkgdir/" install
}
