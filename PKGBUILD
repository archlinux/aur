# Maintainer: robertfoster

pkgname=whatsie
pkgver=6.0.3.r0.gb5800ff
pkgrel=1
pkgdesc="Fast Light weight WhatsApp Client based on Qt's WebEngine, With lots of settings and packed goodies"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/keshavbhatt/whatsie"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-location' 'qt6-svg' 'qt6-webchannel' 'qt6-webengine')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}#tag=v6.0.3")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd "${pkgname%-git}"

  git submodule update --init --recursive
}

build() {
  cmake -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWHATSIE_BUILD_TESTS=OFF \
    -Bbuild

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" \
    cmake --install build
}
