# Maintainer: tytan652 <tytan652@tytanium.xyz>

pkgname=obs-advanced-scene-switcher
pkgver=1.20.5
pkgrel=1
pkgdesc="An automated scene switcher for OBS Studio"
arch=("x86_64" "aarch64")
url="https://obsproject.com/forum/resources/advanced-scene-switcher.395/"
license=("GPL2")
depends=(
  "obs-studio>=28" "libxss" "libxtst" "opencv" "openvr"
  "procps"
)
makedepends=("cmake" "git" "asio" "websocketpp")
options=('debug')
source=(
  "$pkgname::git+https://github.com/WarmUpTill/SceneSwitcher.git#tag=$pkgver"
  "obs-websocket::git+https://github.com/obsproject/obs-websocket.git"
)
sha256sums=(
  "SKIP"
  "SKIP"
)

prepare() {
  cd $pkgname

  git config submodule.deps/obs-websocket.url $srcdir/obs-websocket
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $pkgname

  cmake -B build \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX='/usr' \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DLINUX_PORTABLE=OFF \
  -DQT_VERSION=6

  make -C build
}

package() {
  cd $pkgname
  make -C build DESTDIR="$pkgdir/" install
}
