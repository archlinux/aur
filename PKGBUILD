# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20241221
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-tools qt6-wayland ttf-liberation)
makedepends=(autoconf-archive automake cmake git nasm ninja tar unzip zip)
options=('!lto' '!debug' '!buildflags')
source=(
  "git+$url#commit=34f78ca1522654dbb1a4977020b0d5fb22bbd764" # 2024-12-21
  "git+https://github.com/microsoft/vcpkg.git#commit=b2cb0da531c2f1f740045bfe7c4dac59f0b2b69c" # 2024-11-16 (Toolchain/BuildVcpkg.py)
  "ladybird.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

build() {
  cd "${srcdir}"

  export VCPKG_ROOT="${srcdir}/vcpkg"

  cmake \
    --preset default \
    -B build \
    -S ladybird \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_TOOLCHAIN_FILE="${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" \
    -DENABLE_INSTALL_HEADERS=OFF \
    -GNinja \
    -Wno-dev
  ninja -C build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "ladybird.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "ladybird/Base/res/icons/128x128/app-browser.png" "${pkgdir}/usr/share/pixmaps/ladybird.png"

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
