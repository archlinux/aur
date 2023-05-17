# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20230517
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url='https://github.com/SerenityOS/serenity'
license=(BSD)
depends=(brotli less libgl python qt6-base qt6-svg qt6-wayland)
makedepends=(cmake gendesk git ninja qt6-tools unzip)
options=(!lto)
source=("git+$url#commit=5312a140fedc08f8fd2469b65f5d7b05a172bd62" # 2023-05-17
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
