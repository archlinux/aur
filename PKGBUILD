# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser < git at msrd0 dot de >
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgbase=mingw-w64-harfbuzz-static
pkgname=('mingw-w64-harfbuzz-static' 'mingw-w64-harfbuzz-static-icu')
pkgver=4.0.1
pkgrel=1
pkgdesc="OpenType text shaping engine (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
license=('MIT')
depends=('mingw-w64-crt'
         'mingw-w64-glib2'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-meson'
             'mingw-w64-cairo'
             'mingw-w64-icu'
             'python'
             'ragel')
options=('!strip' 'staticlibs' '!buildflags')
source=("https://github.com/harfbuzz/harfbuzz/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('449edee95208344d75f8e886da6ae390a3e1002e5b3ca4eb7ed42e69958491e2')

build() {
  cd "$srcdir/harfbuzz-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-meson \
      --default-library static \
      -D b_lto=false \
      -D tests=disabled \
      -D docs=disabled \
      ..
    # fix linker selection error
    sed -i 's|: c_LINKER|: cpp_LINKER|g' build.ninja
    ninja
    popd
  done
}

package_mingw-w64-harfbuzz-static() {
  conflicts=('mingw-w64-harfbuzz')
  provides=("mingw-w64-harfbuzz=$pkgver")
  
  for _arch in ${_architectures}; do
    cd "$srcdir/harfbuzz-$pkgver/build-${_arch}-static"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' | xargs ${_arch}-strip -g

    mkdir -p hb-icu/usr/${_arch}/{bin,include/harfbuzz,lib/pkgconfig}; cd hb-icu
    mv "${pkgdir}"/usr/${_arch}/lib/libharfbuzz-icu* ./usr/${_arch}/lib
    mv "${pkgdir}"/usr/${_arch}/lib/pkgconfig/harfbuzz-icu.pc ./usr/${_arch}/lib/pkgconfig
    mv "${pkgdir}"/usr/${_arch}/include/harfbuzz/hb-icu.h ./usr/${_arch}/include/harfbuzz
  done
}

package_mingw-w64-harfbuzz-static-icu() {
  pkgdesc="OpenType text shaping engine (ICU integration, mingw-w64)"
  depends=('mingw-w64-harfbuzz-static'
           'mingw-w64-icu')
  provides=("mingw-w64-harfbuzz-icu=$pkgver")
  conflicts=('mingw-w64-harfbuzz-icu')
  for _arch in ${_architectures}; do
    cd "$srcdir/harfbuzz-$pkgver/build-${_arch}-static"
    mkdir -p "${pkgdir}/usr/${_arch}"
    mv hb-icu/usr/${_arch}/* "${pkgdir}/usr/${_arch}"
  done
}
