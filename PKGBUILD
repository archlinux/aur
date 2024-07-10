# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird-git
pkgver=r62487.d07cf26894
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD)
conflicts=(ladybird)
provides=(ladybird)
depends=(ffmpeg libgl qt6-base qt6-tools qt6-wayland qt6-multimedia ttf-liberation)
makedepends=(git cmake ninja curl unzip zip tar autoconf-archive nasm vcpkg)
options=('!lto' '!debug')
source=(
  "git+$url"
  "git+https://github.com/microsoft/vcpkg.git#commit=f7423ee180c4b7f40d43402c2feb3859161ef625" # 2024-06-15 (Toolchain/BuildVcpkg.sh)
  "ladybird.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd ladybird
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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

  install -Dm644 "ladybird.desktop" "${pkgdir}/usr/share/applications/ladybird.desktop"
  install -Dm644 "ladybird/Base/res/icons/128x128/app-browser.png" "${pkgdir}/usr/share/pixmaps/ladybird.png"

  install -Dm644 ladybird/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
