# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-orc
pkgver=0.4.28
pkgrel=1
pkgdesc="Optimized Inner Loop Runtime Compiler (mingw-w64)"
arch=('any')
license=('custom')
url="https://cgit.freedesktop.org/gstreamer/orc/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-configure' 'git')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
#source=(https://gstreamer.freedesktop.org/data/src/orc/orc-${pkgver}.tar.xz{,.asc}
_commit=31cb4bfc51de81b5c2569abdcff830b83c74499c  # tags/orc-0.4.28^0
source=("git+https://anongit.freedesktop.org/git/gstreamer/orc#commit=$_commit")
validpgpkeys=('7F4BC7CC3CA06F97336BBFEB0668CC1486C2D7B5') #Sebastian Dröge
sha256sums=('SKIP')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/orc/"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  for _arch in ${_architectures}; do
    #mkdir -p "${srcdir}/orc-$pkgver/build-${_arch}" && cd "${srcdir}/orc-$pkgver/build-${_arch}"
    mkdir -p "${srcdir}/orc/build-${_arch}" && cd "${srcdir}/orc/build-${_arch}"

    unset LDFLAGS CPPFLAGS
    ${_arch}-configure --disable-gtk-doc
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    #cd "${srcdir}/orc-$pkgver/build-${_arch}"
    cd "${srcdir}/orc/build-${_arch}"

    make DESTDIR="$pkgdir" install
    #install -Dm644 "${srcdir}/orc-$pkgver/COPYING" "$pkgdir/usr/${_arch}/share/licenses/orc/COPYING"
    install -Dm644 "${srcdir}/orc/COPYING" "$pkgdir/usr/${_arch}/share/licenses/orc/COPYING"

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
