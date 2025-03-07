# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mingw-w64-orc
pkgver=0.4.41
pkgrel=1
pkgdesc="Optimized Inner Loop Runtime Compiler (mingw-w64)"
arch=(any)
license=(BSD-3-Clause)
url="https://gstreamer.freedesktop.org/modules/orc.html"
depends=(mingw-w64-crt)
makedepends=(
  mingw-w64-gcc
  mingw-w64-meson
  wine
  git
)
options=(
  '!strip'
  '!buildflags'
  '!libtool'
  staticlibs
)
source=("git+https://gitlab.freedesktop.org/gstreamer/orc.git?signed#tag=$pkgver"
        meson_i686-w64-mingw32
        meson_x86_64-w64-mingw32)
b2sums=('eb29733e3033b272c718a622e774379d993aa50ca4f23be0ef1d7dc1e99c267b0c07173f2a79ce47cbf1cb1fecfe2742c48e43994b15308c703aecf8887526e3'
        '982c4e5403159748625fccdea5754e10c7f191e04058f76378271a63c5ff5aa7d093b22a004382e47837412e836ee2278e762c98aaceb47afe690e8e48ea8c43'
        '96fe847dc06e9dd81ed0d28200275ef0ee8873666236b732c9933202e19d81f37625a2b7ca59056531877e9d4542a8faa34dba2f0bdcd87ac74b6c1360c3a4b7')
validpgpkeys=(
  D637032E45B8C6585B9456565D2EEE6F6F349D7C # Tim-Philipp Müller <tim@centricular.com>
)
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  for _arch in ${_architectures}; do
    #mkdir -p "${srcdir}/orc-$pkgver/build-${_arch}" && cd "${srcdir}/orc-$pkgver/build-${_arch}"
    mkdir -p "${srcdir}/orc/build-${_arch}" && cd "${srcdir}/orc/build-${_arch}"

    ${_arch}-meson \
          --default-library both \
	  -D examples=disabled \
	  -D gtk_doc=disabled \
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
    #install -Dm644 "${srcdir}/orc-$pkgver/COPYING" "$pkgdir/usr/share/licenses/mingw-w64-orc/COPYING"
    install -Dm644 "${srcdir}/orc/COPYING" "$pkgdir/usr//share/licenses/mingw-w64-orc/COPYING"

    #${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    #${_arch}-strip -x -g ${pkgdir}/usr/${_arch}/bin/*.dll
    #${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
# vim:set sw=2 sts=-1 et:
