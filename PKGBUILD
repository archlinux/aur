# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird-git
pkgver=r50376.5312a140fe
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url='https://github.com/SerenityOS/serenity'
license=(BSD)
depends=(brotli less libgl python qt6-base qt6-svg qt6-wayland)
conflicts=(ladybird)
provides=(ladybird)
makedepends=(cmake git ninja qt6-tools unzip)
options=('!lto')
source=(
  "git+$url"
  "ladybird.desktop"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd serenity
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"

  cmake \
    -B build \
    -S serenity/Ladybird \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -GNinja \
    -Wno-dev
  ninja -C build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "ladybird.desktop" "${pkgdir}/usr/share/applications/ladybird.desktop"
  install -Dm644 "serenity/Base/res/icons/32x32/app-browser.png" "${pkgdir}/usr/share/pixmaps/ladybird.png"

  install -Dm644 serenity/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
