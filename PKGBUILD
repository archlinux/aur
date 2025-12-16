# Maintainer: dllud <dllud riseup net>
# Contributor: Mario Finelli <mario at finel dot li>
# Contributor: Boohbah <boohbah at gmail dot com>
# Contributor: Mikkel Kroman <mk at maero dot dk>

pkgname=ricochet-refresh
pkgver=3.0.39
pkgrel=2
pkgdesc="Anonymous metadata-resistant instant messaging with Tor Onion Services v3 support."
arch=('i686' 'x86_64')
url="https://www.ricochetrefresh.net/"
license=('BSD 3-Clause')
depends=('qt5-base' 'qt5-declarative' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-multimedia'
         'openssl' 'protobuf' 'tor' 'hicolor-icon-theme')
makedepends=('cmake' 'git')
source=("${pkgname}::git+https://github.com/blueprint-freespeech/ricochet-refresh.git#tag=v${pkgver}-release")
sha256sums=('SKIP')

prepare() {
  cd ${pkgname}
  git submodule update --init
  mkdir -p build
  cmake -S ./src -B ./build -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DRICOCHET_REFRESH_INSTALL_DESKTOP=ON \
    -DUSE_SUBMODULE_FMT=ON -DFORCE_QT5=ON -DTEGO_STATIC_BUILD=ON \
    -DCMAKE_EXE_LINKER_FLAGS="-Wl,--copy-dt-needed-entries"
}

build() {
  cd ${pkgname}
  cmake --build ./build -j$(nproc)
}

package() {
  cd ${pkgname}
  cmake --build ./build --target install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 doc/manpage "${pkgdir}/usr/share/man/man1/ricochet-refresh.1"
}
