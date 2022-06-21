# Maintainer: Alexandre BIQUE <bique.alexandre@gmail.com>
pkgname=clap-host
pkgver=1.0
pkgrel=3
pkgdesc="CLAP host"
arch=(x86_64)
url="https://github.com/free-audio/clap-host"
license=('MIT')
groups=()
depends=(qt6-base rtmidi rtaudio)
makedepends=(cmake ninja)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/free-audio/clap-host#tag=$pkgver
  git+https://github.com/free-audio/clap#branch=main
  git+https://github.com/free-audio/clap-helpers#branch=main
  git+https://github.com/microsoft/vcpkg#branch=master)
noextract=()
sha256sums=(SKIP
  SKIP
  SKIP
  SKIP) #autofill using updpkgsums

build() {
  cd "$pkgname"

  git submodule init
  git config submodule.clap.url "$srcdir/clap"
  git config submodule.clap-helpers.url "$srcdir/clap-helpers"
  git config submodule.vcpkg.url "$srcdir/vcpkg"
  git submodule update

  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DUsePkgConfig=TRUE -GNinja ..
  ninja
}

package() {
  cd "$pkgname/build"

  DESTDIR="$pkgdir/" ninja install
}
