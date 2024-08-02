# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: rabyte <rabyte__gmail>

pkgname=mingw-w64-schroedinger
pkgver=1.0.11
pkgrel=6
pkgdesc='An implemenation of the Dirac video codec in ANSI C code (mingw-w64)'
arch=('any')
url='https://launchpad.net/schroedinger'
license=('GPL2' 'LGPL2.1' 'MPL' 'MIT')
depends=('mingw-w64-crt' 'mingw-w64-orc')
options=(!strip !buildflags !libtool staticlibs !debug)
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config')
source=("https://launchpad.net/schroedinger/trunk/${pkgver}/+download/schroedinger-${pkgver}.tar.gz"{,.asc}
        'testsuite.patch')
validpgpkeys=('9456AFC0814A8139E99483517FE6B095B582B0D4') # Timothy Gu
sha256sums=('1e572a0735b92aca5746c4528f9bebd35aa0ccf8619b22fa2756137a8cc9f912'
            'SKIP'
            '95a5ffb1175274d837170b0e3935284e5b4cecf77937883ce612322a5e89ec04')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/schroedinger-$pkgver
  patch -Np1 < ../testsuite.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}

    unset LDFLAGS CPPFLAGS
    export CFLAGS="-fpermissive" CXXFLAGS="-fpermissive"
    $srcdir/schroedinger-$pkgver/configure --prefix=/usr/${_arch} --host=${_arch}

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}

    make DESTDIR="$pkgdir" install
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
    rm -r ${pkgdir}/usr/${_arch}/share/gtk-doc
  done

  install -m644 -D ${srcdir}/schroedinger-$pkgver/COPYING.MIT "$pkgdir/usr/share/licenses/${pkgname}/schroedinger/COPYING.MIT"
}

# vim: ts=2 sw=2 et:
