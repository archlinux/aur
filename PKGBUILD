# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_commit=afcae83a064843d71d47624bc162e121cc56c08b  # tags/6.0.0
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgbase=mingw-w64-harfbuzz
pkgname=('mingw-w64-harfbuzz' 'mingw-w64-harfbuzz-icu')
pkgver=6.0.0
pkgrel=1
pkgdesc="OpenType text shaping engine (mingw-w64)"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/HarfBuzz"
license=('MIT')
depends=('mingw-w64-crt'
         'mingw-w64-glib2'
         'mingw-w64-graphite'
         'mingw-w64-freetype2')
makedepends=('mingw-w64-meson'
             'mingw-w64-cairo'
             'mingw-w64-icu'
             'python'
             'ragel'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://github.com/harfbuzz/harfbuzz.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd harfbuzz
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd harfbuzz
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-meson \
      -D b_lto=false \
      -D graphite=enabled \
      -D tests=disabled \
      -D docs=disabled \
      ..
    # fix linker selection error
    sed -i 's|: c_LINKER|: cpp_LINKER|g' build.ninja
    ninja
    popd
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-meson \
      --default-library static \
      -D c_args=-DGRAPHITE2_STATIC \
      -D cpp_args=-DGRAPHITE2_STATIC \
      -D b_lto=false \
      -D graphite=enabled \
      -D tests=disabled \
      -D docs=disabled \
      ..
    # fix linker selection error
    sed -i 's|: c_LINKER|: cpp_LINKER|g' build.ninja
    ninja
    popd
  done
}

package_mingw-w64-harfbuzz() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/harfbuzz/build-${_arch}-static"
    DESTDIR="${pkgdir}" ninja install
    cd "${srcdir}/harfbuzz/build-${_arch}-shared"
    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name '*.a' | xargs ${_arch}-strip -g

    mkdir -p hb-icu/usr/${_arch}/{bin,include/harfbuzz,lib/pkgconfig}; cd hb-icu
    mv "${pkgdir}"/usr/${_arch}/bin/libharfbuzz-icu* ./usr/${_arch}/bin
    mv "${pkgdir}"/usr/${_arch}/lib/libharfbuzz-icu* ./usr/${_arch}/lib
    mv "${pkgdir}"/usr/${_arch}/lib/pkgconfig/harfbuzz-icu.pc ./usr/${_arch}/lib/pkgconfig
    mv "${pkgdir}"/usr/${_arch}/include/harfbuzz/hb-icu.h ./usr/${_arch}/include/harfbuzz
  done
}

package_mingw-w64-harfbuzz-icu() {
  pkgdesc="OpenType text shaping engine (ICU integration, mingw-w64)"
  depends=('mingw-w64-harfbuzz'
           'mingw-w64-icu')
  for _arch in ${_architectures}; do
    cd "${srcdir}/harfbuzz/build-${_arch}-shared"
    mkdir -p "${pkgdir}/usr/${_arch}"
    mv hb-icu/usr/${_arch}/* "${pkgdir}/usr/${_arch}"
  done
}

# vim:set ts=2 sw=2 et:
