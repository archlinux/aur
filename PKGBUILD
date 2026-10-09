# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=moondeckbuddy
pkgver=1.10.0
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
# The tag tarball carries neither the resources/ssl submodule (the self-signed
# certificate Buddy and MoonDeck share) nor glaze, which CMake would fetch at
# configure time. Both are pinned to what the tag references; see pkg.sh.
_keys_commit="9d1cc7356181f6f6c0aa2a5e92ad7174f09fa539"
_glaze_ver="7.7.1"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FrogTheFrog/moondeck-buddy/archive/refs/tags/v${pkgver}.tar.gz"
        "moondeck-keys-${_keys_commit}.tar.gz::https://github.com/FrogTheFrog/moondeck-keys/archive/${_keys_commit}.tar.gz"
        "glaze-${_glaze_ver}.tar.gz::https://github.com/stephenberry/glaze/archive/refs/tags/v${_glaze_ver}.tar.gz")
sha256sums=('f68aff3e26c51618bd78e7656cfe3481fd0c4d2be377a26fc4e5db54e9541642' '80438b7cec54f89e3b03ad4bf1bf46edd36a8438e5ebcdb5333ecacd45aba7cc' 'c51217ca374f2a7d556c501a849d3a43dfffff47ba7711b6f0c22020e71ff63d')

prepare() {
  cd "moondeck-buddy-${pkgver}"

  rm -rf resources/ssl
  ln -s "$srcdir/moondeck-keys-${_keys_commit}" resources/ssl

  # upstream builds with -Werror against GCC 13 and Qt 6.8; warnings that a
  # newer toolchain adds must not fail the package build
  sed -i 's/ -Werror)/)/' CMakeLists.txt
}

build() {
  cmake -B build -S "moondeck-buddy-${pkgver}" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
    -DFETCHCONTENT_SOURCE_DIR_GLAZE="$srcdir/glaze-${_glaze_ver}"
  cmake --build build
}

package() {
  # both binaries, the desktop entry and the icons
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "moondeck-buddy-${pkgver}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "glaze-${_glaze_ver}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.glaze"
}
