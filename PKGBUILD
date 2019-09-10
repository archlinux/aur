# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: <nontlikeuname at tuta dot io>

pkgname=mingw-w64-atk
pkgver=2.34.1
pkgrel=1
pkgdesc="Interface definitions of accessibility infrastructure (mingw-w64)"
arch=('any')
url="https://gitlab.gnome.org/GNOME/atk"
license=('LGPL')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'python')
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnome.org/pub/gnome/sources/atk/${pkgver%.*}/atk-${pkgver}.tar.xz")
sha256sums=('d4f0e3b3d21265fcf2bc371e117da51c42ede1a71f6db1c834e6976bb20997cb')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/atk-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson \
      --buildtype=plain \
      --default-library=both \
      -Ddocs=false \
      -Dintrospection=false \
      -Dstrip=false \
      ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" meson install -C ${srcdir}/atk-${pkgver}/build-${_arch}
    
    rm -r ${pkgdir}/usr/${_arch}/share

    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
