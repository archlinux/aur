# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: <nontlikeuname at tuta dot io>

pkgname=mingw-w64-atk
pkgver=2.32.0
pkgrel=1
pkgdesc="A library providing a set of interfaces for accessibility (mingw-w64)"
arch=('any')
url="https://developer.gnome.org/atk/"
license=('LGPL2')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'python')
depends=('mingw-w64-crt' 'mingw-w64-glib2')
options=('!strip' '!buildflags' 'staticlibs')
source=("http://ftp.gnome.org/pub/gnome/sources/atk/${pkgver%.*}/atk-${pkgver}.tar.xz")
md5sums=('c10b0b2af3c199e42caa6275b845c49d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/atk-${pkgver}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-meson .. -Ddocs=false -Dintrospection=false
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
