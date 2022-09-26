# Maintainer: lantw44 (at) gmail (dot) com

pkgname=mingw-w64-graphene
pkgver=1.10.8
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
  "graphene-${pkgver}.tar.gz::https://github.com/ebassi/graphene/archive/${pkgver}.tar.gz")
sha256sums=(
  '922dc109d2dc5dc56617a29bd716c79dd84db31721a8493a13a5f79109a4a4ed')

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
