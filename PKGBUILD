# Maintainer: lantw44 at gmail dot com

pkgname=mingw-w64-libepoxy
pkgver=1.5.8
pkgrel=1
pkgdesc="A library for handling OpenGL function pointer management for you (mingw-w64)"
arch=('any')
url="https://github.com/anholt/libepoxy"
license=('MIT')
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-meson'
  'python')
depends=(
  'mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/anholt/libepoxy/releases/download/${pkgver}/libepoxy-${pkgver}.tar.xz")
sha256sums=('cf05e4901778c434aef68bb7dc01bea2bce15440c0cecb777fb446f04db6fe0d')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd "${srcdir}/libepoxy-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    mkdir -p "build-${_arch}"
    cd "build-${_arch}"
    "${_arch}-meson" \
      --default-library both
    ninja
    cd ..
  done
}

package() {
  cd "${srcdir}/libepoxy-${pkgver}"
  for _arch in "${_architectures[@]}"; do
    cd "build-${_arch}"
    DESTDIR="$pkgdir" ninja install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec "${_arch}-strip" '{}' ';'
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec "${_arch}-strip" --strip-unneeded '{}' ';'
    find "$pkgdir/usr/${_arch}" '(' -name '*.a' -o -name '*.dll' ')' -exec "${_arch}-strip" -g '{}' ';'
    cd ..
  done
}
