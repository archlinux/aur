# Maintainer: Niels Martignène <niels.martignene@gmail.com>

pkgname=mingw-w64-hidapi
pkgver=0.8.0rc1
_hidapiver=0.8.0-rc1
pkgrel=2
pkgdesc="Simple library for communicating with USB and Bluetooth HID devices (mingw-w64)"
arch=(any)
url="http://www.signal11.us/oss/hidapi/"
license=('GPL3' 'BSD' 'custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=('staticlibs' '!makeflags' '!strip' '!buildflags')
source=("https://github.com/signal11/hidapi/archive/hidapi-$_hidapiver.tar.gz"
        'disable-hidtest.patch')
md5sums=('069f9dd746edc37b6b6d0e3656f47199'
         'ba66138154dba31f7ed17eb17dbf0cc7')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

prepare() {
  cd "${srcdir}/hidapi-hidapi-${_hidapiver}"

  patch -Np1 <"${srcdir}/disable-hidtest.patch"
}

build() {
  unset LDFLAGS
  cd "${srcdir}/hidapi-hidapi-${_hidapiver}"

  ./bootstrap
  for _arch in "${_architectures[@]}"; do
    mkdir -p build-${_arch}
    pushd build-${_arch}

    ../configure --prefix=/usr/${_arch} --host=${_arch}
    make

    popd
  done
}

package () {
  cd "${srcdir}/hidapi-hidapi-${_hidapiver}"

  for _arch in "${_architectures[@]}"; do
    pushd build-${_arch}

    make install DESTDIR="${pkgdir}/"
    rm -rf "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a

    popd
  done

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE.txt LICENSE-bsd.txt LICENSE-orig.txt "${pkgdir}/usr/share/licenses/${pkgname}/"
}
