# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=clap-plugins
pkgver=1.0
pkgrel=5
pkgdesc="CLAP example plugins"
arch=(x86_64)
url="https://github.com/free-audio/clap-plugins"
license=('MIT')
groups=()
depends=(qt6-base qt6-declarative)
makedepends=(cmake ninja git catch2)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/free-audio/clap-plugins#tag=$pkgver
  git+https://github.com/free-audio/clap#branch=main
  git+https://github.com/free-audio/clap-helpers#branch=main
  git+https://github.com/niXman/yas#branch=master)
noextract=()
sha256sums=(SKIP
  SKIP
  SKIP
  SKIP)

build() {
  cd "$pkgname"

  git submodule init
  git config submodule.clap.url "$srcdir/clap"
  git config submodule.clap-helpers.url "$srcdir/clap-helpers"
  git config submodule.yas.url "$srcdir/yas"
  git submodule deinit vcpkg
  git submodule update

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCLAP_PLUGINS_REMOTE_GUI=TRUE -DCLAP_PLUGINS_EMBED_QML=TRUE -GNinja ..
  ninja
}

package() {
  cd "$pkgname/build"

  DESTDIR="$pkgdir/" ninja install
}
