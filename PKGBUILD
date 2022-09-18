# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=ja2-stracciatella-git
pkgver=11237.829db5183
pkgrel=1
pkgdesc="Jagged Alliance 2 Stracciatella project with a goal of improving JA2"
arch=('x86_64')
url="https://github.com/ja2-stracciatella/ja2-stracciatella"
license=('custom')
conflicts=('ja2-stracciatella')
provides=('ja2-stracciatella')
depends=('sdl2' 'sdl2>2.0.6' 'fltk' 'rapidjson' 'lua53' 'sol2')
makedepends=('git' 'cargo' 'cmake' 'ninja')
source=('git+https://github.com/ja2-stracciatella/ja2-stracciatella.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ja2-stracciatella"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}"

  cmake -GNinja -B build \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DEXTRA_DATA_DIR=/usr/share/ja2 \
    -DLOCAL_LUA_LIB=OFF \
    -DLOCAL_SOL_LIB=OFF \
    -DLOCAL_RAPIDJSON_LIB=OFF \
    -DWITH_UNITTESTS=OFF \
    "${srcdir}/ja2-stracciatella"
  cmake --build build
}

package() {
  cd "${srcdir}/"

  DESTDIR="${pkgdir}" cmake --install build

  install -m644 -Dt "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/ja2-stracciatella/README.md"
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/ja2-stracciatella/SFI Source Code license agreement.txt"
}

# vim:set ts=2 sw=2 et:
