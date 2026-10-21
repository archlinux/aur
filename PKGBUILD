# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=moondeckbuddy
pkgver=1.11.0
pkgrel=1
pkgdesc="Host companion that lets the MoonDeck Steam Deck plugin control Steam and the PC"
arch=('x86_64')
url="https://github.com/FrogTheFrog/moondeck-buddy"
# MIT: glaze, a header-only JSON library compiled into both binaries
license=('LGPL-3.0-only' 'MIT')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libstdc++' 'procps-ng'
         'qt6-base' 'qt6-httpserver' 'qt6-websockets')
makedepends=('cmake' 'ninja')
conflicts=('moondeckbuddy-appimage')
# The tag tarball leaves upstream's two submodules empty: resources/ssl, the
# self-signed certificate Buddy and MoonDeck share, and src/lib/json/glaze,
# the JSON library CMake adds with add_subdirectory. Both are pinned to the
# commit the tag references and stand in for the submodules in prepare();
# see pkg.sh.
_keys_commit="9d1cc7356181f6f6c0aa2a5e92ad7174f09fa539"
_glaze_commit="d78832c82289c61a9315bfbc35332cec9f4e93ca"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FrogTheFrog/moondeck-buddy/archive/refs/tags/v${pkgver}.tar.gz"
        "moondeck-keys-${_keys_commit}.tar.gz::https://github.com/FrogTheFrog/moondeck-keys/archive/${_keys_commit}.tar.gz"
        "glaze-${_glaze_commit}.tar.gz::https://github.com/stephenberry/glaze/archive/${_glaze_commit}.tar.gz")
sha256sums=('e602e08ed5a4dabd1452c37f87aaf50fc43a32bce0cf48aa621ec645375a64e9' '80438b7cec54f89e3b03ad4bf1bf46edd36a8438e5ebcdb5333ecacd45aba7cc' '72e88f46a96e3cd014fb26af644c540a11811407fb1332fb0a4e068ceec5ba3f')

prepare() {
  cd "moondeck-buddy-${pkgver}"

  rm -rf resources/ssl src/lib/json/glaze
  ln -s "$srcdir/moondeck-keys-${_keys_commit}" resources/ssl
  ln -s "$srcdir/glaze-${_glaze_commit}" src/lib/json/glaze

  # upstream builds with -Werror against GCC 13 and Qt 6.8; warnings that a
  # newer toolchain adds must not fail the package build
  sed -i 's/ -Werror)/)/' CMakeLists.txt
}

build() {
  cmake -B build -S "moondeck-buddy-${pkgver}" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  # both binaries, the desktop entry and the icons
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "moondeck-buddy-${pkgver}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "glaze-${_glaze_commit}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.glaze"
}
