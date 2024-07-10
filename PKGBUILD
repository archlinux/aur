# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20240711
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD)
depends=(ffmpeg libgl qt6-base qt6-tools qt6-wayland qt6-multimedia ttf-liberation)
makedepends=(git cmake ninja curl unzip zip tar autoconf-archive nasm vcpkg)
options=(!lto !debug)
source=("git+$url#commit=d07cf26894bcaa5791ed3b7715b94e25227b2bda" # 2024-07-11
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
  install -Dm644 "ladybird/Base/res/icons/128x128/app-browser.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/ladybird/"
}
