# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird-git
pkgver=r66326.f5d13e32af1
pkgrel=1
pkgdesc='Truly independent web browser'
arch=(x86_64)
url='https://github.com/LadybirdBrowser/ladybird'
license=(BSD-2-Clause)
conflicts=(ladybird)
provides=(ladybird)
depends=(curl ffmpeg libgl qt6-base qt6-multimedia qt6-tools qt6-wayland ttf-liberation)
makedepends=(autoconf-archive automake cmake git nasm ninja tar unzip zip)
options=('!lto' '!debug' '!buildflags')
source=(
  "git+$url"
  "git+https://github.com/microsoft/vcpkg.git#commit=b322364f06308bdd24823f9d8f03fe0cc86fd46f" # 2024-12-16 (Toolchain/BuildVcpkg.py)
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
    -DENABLE_INSTALL_HEADERS=OFF \
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
