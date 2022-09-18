# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
pkgname=ja2-stracciatella
pkgver=0.19.1
pkgrel=1
pkgdesc="Jagged Alliance 2 Stracciatella"
arch=('x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
# TODO: Add dependencies on rapidjson, lua53, and sol2 with the next release
depends=('sdl2>2.0.6' 'fltk')
makedepends=('cargo' 'cmake' 'ninja')
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e9806755f471275b653408f5b1ffc6f1629e83ac2fe04370b8756ed6eb87fee7')

build() {
  cd "${srcdir}"

  # TODO: Add -DLOCAL_LUA_LIB=OFF -DLOCAL_SOL_LIB=OFF -DLOCAL_RAPIDJSON_LIB=OFF with the next release
  # We deliberately don't set the build type here, because upstream sets a
  # reasonable default type
  cmake -GNinja -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DEXTRA_DATA_DIR=/usr/share/ja2-stracciatella \
    -DWITH_UNITTESTS=OFF \
    "${srcdir}/ja2-stracciatella-${pkgver}"
  cmake --build build
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" cmake --install build

  install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/ja2-stracciatella-${pkgver}/README.md"
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ja2-stracciatella-${pkgver}/SFI Source Code license agreement.txt"
}
