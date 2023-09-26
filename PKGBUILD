# Maintainer: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=avro-c
pkgver=1.11.3
pkgrel=1
pkgdesc="C bindings for Avro data serialization framework"
arch=('i686' 'x86_64')
makedepends=(cmake)
depends=('jansson' 'snappy' 'xz' 'zlib')
optdepends=('asciidoc: build with documentation'
            'source-highlight: add syntax highlighting to documentation')
url="https://github.com/apache/avro"
license=('Apache')

source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/release-${pkgver}.tar.gz)

sha256sums=('da377ac1cf8b91458bf702cbcfb214eecb5c399b267f0ca9c0aade6cabaf126e')

build() {
  cd "$srcdir/avro-release-$pkgver/lang/c"

  msg2 'Building...'
  mkdir -p build && cd build

  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  cmake .. \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DTHREADSAFE=true \
    -Wno-dev
  make
}

package() {
  cd "$srcdir/avro-release-$pkgver/lang/c"

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/avro-c"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install -C build/
}
