# Maintainer: Tim Schumacher <timschumi@gmx.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Brian <brain@derelict.garden>

pkgname=ladybird
pkgver=20230404
pkgrel=1
pkgdesc='Web browser built from scratch using the SerenityOS LibWeb engine'
arch=(x86_64)
url='https://github.com/SerenityOS/serenity'
license=(BSD)
depends=(brotli less libgl python qt6-base qt6-wayland)
makedepends=(cmake gendesk git ninja qt6-tools unzip)
options=(!lto)
source=("git+$url#commit=bd46397e1fb5bb2db0c406427801039a2611bbe4") # 2023-04-04
b2sums=('SKIP')

prepare() {
  cd "${srcdir}"

  gendesk -f --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

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
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -Dm644 serenity/LICENSE -t "${pkgdir}/usr/share/licenses/ladybird/"
}
