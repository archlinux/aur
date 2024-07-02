# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20240702
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD)
depends=(ffmpeg libgl qt6-base qt6-tools qt6-wayland qt6-multimedia ttf-liberation)
makedepends=(git cmake ninja curl unzip zip tar autoconf-archive vcpkg)
options=(!lto !debug)
source=("git+$url#commit=09f76098b06804efb1f82f2244338ad4a97c9cfb" # 2024-07-02
        "git+https://github.com/microsoft/vcpkg.git#commit=f7423ee180c4b7f40d43402c2feb3859161ef625" # 2024-06-15 (Toolchain/BuildVcpkg.sh)
        "ladybird.desktop")
b2sums=('SKIP'
        'SKIP'
        'SKIP')

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
    -GNinja \
    -Wno-dev
  ninja -C build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "ladybird/Base/res/icons/32x32/app-browser.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/ladybird/"
}
