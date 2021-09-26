# Maintainer: lantw44 (at) gmail (dot) com

pkgname=mingw-w64-graphene
pkgver=1.10.6
pkgrel=1
pkgdesc='A thin layer of graphic data types (mingw-w64)'
arch=('any')
url='https://ebassi.github.io/graphene/'
license=('MIT')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-meson')
depends=(
  'mingw-w64-crt'
  'mingw-w64-glib2>=2.30.0')
options=('!strip' '!buildflags' 'staticlibs')
source=(
  "https://github.com/ebassi/graphene/releases/download/${pkgver}/graphene-${pkgver}.tar.xz")
sha256sums=(
  '80ae57723e4608e6875626a88aaa6f56dd25df75024bd16e9d77e718c3560b25')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd "${srcdir}/graphene-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-meson" \
      --default-library both \
      -Dgtk_doc=false \
      -Dintrospection=disabled
    ninja
    cd ..
  done
}

package() {
  cd "${srcdir}/graphene-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "${pkgdir}/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
