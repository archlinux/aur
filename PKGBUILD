# Maintainer: crab2313 <crab2313@gmail.com>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libvirt-glib
pkgver=1.0.0
pkgrel=1
pkgdesc="Glib bindings for libvirt (remote only for windows)"
arch=('any')
url="https://libvirt.org/"
license=('LGPL')
depends=('mingw-w64-crt' 'mingw-w64-libvirt')
makedepends=('mingw-w64-configure' 'gettext' 'libxslt' 'python' 'perl')
options=('!strip' 'staticlibs' '!buildflags')
validpgpkeys=('DAF3A6FDB26B62912D0E8E3FBE86EBB415104FDF')
source=("ftp://libvirt.org/libvirt/glib/libvirt-glib-${pkgver}.tar.gz"{,.asc})

sha256sums=('ca9158d01cc4d9e0218f94f8c9ee04ae367d8c3b4396daaebca2c4b89a2e8a47'
            'SKIP')

build() {
  cd "${srcdir}/libvirt-glib-${pkgver}"

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libvirt-glib-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' | xargs -rtl1 ${_arch}-strip
    find "${pkgdir}/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "${pkgdir}/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}

# vim:set ts=2 sw=2 et:
