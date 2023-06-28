# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20230628
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url='https://github.com/SerenityOS/serenity'
license=(BSD)
depends=(brotli less libgl python qt6-base qt6-multimedia qt6-svg qt6-wayland)
makedepends=(cmake git ninja qt6-tools unzip)
options=(!lto)
source=("git+$url#commit=8ac4a5315b13d9aa9073ebda0df78c8de606540b" # 2023-06-28
        "ladybird.desktop")
b2sums=('SKIP'
        'SKIP')

build() {
  cd "${srcdir}"

  cmake \
    -B build \
    -S 'serenity/Ladybird' \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -GNinja \
    -Wno-dev
  ninja -C build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "serenity/Base/res/icons/32x32/app-browser.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 serenity/LICENSE -t "${pkgdir}/usr/share/licenses/ladybird/"
}
