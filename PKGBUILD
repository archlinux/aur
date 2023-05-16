# Maintainer: HLFH <gaspard@dhautefeuille.eu>
# Contributor: Dakeryas <mrdakeryas at gmail dot com>
pkgname=mac-optimised
pkgver=10.11
_pkgver="${pkgver//./}"
pkgrel=2
pkgdesc="APE codec and decompressor with optimised build flags"
arch=('x86_64')
url="https://monkeysaudio.com/"
license=("custom: Monkey's Audio License Agreement")
provides=('mac')
conflicts=('mac')
makedepends=('glibc' 'gcc-libs')
source=(
  "$pkgname-$pkgver.zip::https://monkeysaudio.com/files/MAC_${_pkgver}_SDK.zip"
  "$pkgname-$pkgver-license.html::https://www.monkeysaudio.com/license.html"
)
b2sums=('404b27063e4fa831c835923bd31d5db3fb4f0ed912eb2c4799d17fd880a9313f4e871f67200b5b96bc0614d2ce25c1ac3618500483403b0cd5f38a7971c11a12'
        '6f8ab6ca6e7b367a901c083c2390c1fd175cc0aee9b86b6280a7883797525172ad5f6e3b4293ca288009adc550cd1646a54b74bdbaae40759fa3be551d16de50')

build() {
  export CXXFLAGS="${CXXFLAGS} -O3 -march=native"
  export LDFLAGS="${LDFLAGS} -Wl,-rpath,\\$\$ORIGIN/../lib"

  cmake \
    -S . \
    -B build \
    -D CMAKE_BUILD_TYPE='None' \
    -D CMAKE_INSTALL_PREFIX='/usr'

  cmake --build build

  # generate license
  html2text --ignore-links "$pkgname-$pkgver-license.html" \
    | sed -n '/^## License$/,$p' \
    > LICENSE.md
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
