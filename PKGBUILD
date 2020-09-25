# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-orc
pkgver=0.4.32
pkgrel=1
pkgdesc="Optimized Inner Loop Runtime Compiler (mingw-w64)"
arch=('any')
license=('custom:BSD')
url="https://gitlab.freedesktop.org/gstreamer/orc"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'wine' 'git')
options=('!strip' '!buildflags' '!libtool' 'staticlibs')
#source=(https://gstreamer.freedesktop.org/data/src/orc/orc-${pkgver}.tar.xz{,.asc}
_commit=629864f073ae003e63c026c1de2407fec713cb53  # tags/0.4.32^0
source=("git+https://gitlab.freedesktop.org/gstreamer/orc.git#commit=$_commit"
        meson_i686-w64-mingw32
        meson_x86_64-w64-mingw32)
validpgpkeys=('7F4BC7CC3CA06F97336BBFEB0668CC1486C2D7B5') #Sebastian Dröge
sha256sums=('SKIP'
            '3eed78156a85a6b8238cd9b64d37df1a0dd8ec9816e71c2ed7a70874289f8e2e'
            'a07b08deafafabf9196dbc0583093fff8be9c45e29f73f7c286d5fc99492434d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    #mkdir -p "${srcdir}/orc-$pkgver/build-${_arch}" && cd "${srcdir}/orc-$pkgver/build-${_arch}"
    mkdir -p "${srcdir}/orc/build-${_arch}" && cd "${srcdir}/orc/build-${_arch}"

    ${_arch}-meson \
          --default-library both \
          "${srcdir}/orc"
    ninja
  done
}

check() {
  for _arch in ${_architectures}; do
    #cd "${srcdir}/orc-$pkgver/build-${_arch}"
    cd "${srcdir}/orc/build-${_arch}"

    # Copy dlls necessary to run most tests
    cp "${srcdir}/orc/build-${_arch}/orc/liborc"*.dll .
    cp "${srcdir}/orc/build-${_arch}/orc-test/liborc-test"*.dll .

    meson test --print-errorlogs
  done
}

package() {
  for _arch in ${_architectures}; do
    #cd "${srcdir}/orc-$pkgver/build-${_arch}"
    cd "${srcdir}/orc/build-${_arch}"
    DESTDIR="$pkgdir" ninja -C . install
    #install -Dm644 "${srcdir}/orc-$pkgver/COPYING" "$pkgdir/usr/${_arch}/share/licenses/orc/COPYING"
    install -Dm644 "${srcdir}/orc/COPYING" "$pkgdir/usr/${_arch}/share/licenses/orc/COPYING"

    #${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    #${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    #${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
