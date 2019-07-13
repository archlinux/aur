# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: <nontlikeuname at tuta dot io>

pkgname=mingw-w64-atk
pkgver=2.32.0
pkgrel=2
pkgdesc="A library providing a set of interfaces for accessibility (mingw-w64)"
arch=('any')
url="https://gitlab.gnome.org/GNOME/atk"
license=('LGPL')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'python')
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnome.org/pub/gnome/sources/atk/${pkgver%.*}/atk-${pkgver}.tar.xz")
sha256sums=('cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091cc')

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
      ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" meson install -C ${srcdir}/atk-${pkgver}/build-${_arch}
    
    rm -r ${pkgdir}/usr/${_arch}/share

    #FIXME: Ranlib (isn't meson supposed to do this?)
    ${_arch}-ranlib ${pkgdir}/usr/${_arch}/lib/*.a

    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
  done
}
