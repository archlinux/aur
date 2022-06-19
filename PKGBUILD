# Maintainer: dllud <dllud riseup net>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=ricochet-refresh
pkgver=3.0.11
pkgrel=2
pkgdesc="Anonymous metadata-resistant instant messaging with Tor Onion Services v3 support."
arch=('i686' 'x86_64')
url="https://www.ricochetrefresh.net/"
license=('BSD 3-Clause')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols'
         'openssl' 'fmt' 'protobuf' 'tor' 'hicolor-icon-theme')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/blueprint-freespeech/ricochet-refresh.git#tag=v${pkgver}-release")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  git submodule update --init
  mkdir -p build
  cmake -S ./src -B ./build -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}" -DRICOCHET_REFRESH_INSTALL_DESKTOP=ON
}

build() {
  cd ${pkgname}
  cmake --build ./build -j$(nproc)
}

package() {
  cd ${pkgname}
  cmake --build ./build --target install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" src/LICENSE
  install -Dm644 doc/manpage "${pkgdir}/usr/share/man/man1/ricochet-refresh.1"
}
