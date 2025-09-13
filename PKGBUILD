# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Schala Zeal < schalaalexiazeal at gmail dot com >

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgbase=mingw-w64-harfbuzz
pkgname=('mingw-w64-harfbuzz' 'mingw-w64-harfbuzz-icu')
pkgver=11.5.0
pkgrel=1
pkgdesc="OpenType text shaping engine (mingw-w64)"
arch=('any')
url="https://harfbuzz.github.io/"
license=('MIT')
depends=('mingw-w64-crt'
         'mingw-w64-glib2'
         'mingw-w64-graphite'
         'mingw-w64-freetype2')
makedepends=('glib2-devel'
             'mingw-w64-meson'
             'mingw-w64-cairo'
             'mingw-w64-icu'
             'python'
             'ragel'
             'git')
options=('!strip' 'staticlibs' '!buildflags')
source=("git+https://github.com/harfbuzz/harfbuzz?signed#tag=$pkgver")
b2sums=('21d3a5b26df7c7e22e8f665af9160e828ada9c8b7f8670bf6df75e59719d5623a6f61223ea55485106f2fef605604750b0dc8c3c277f35853bf818b045a016ac')
validpgpkeys=(
  053D20F17CCCA9651B2C6FCB9AB24930C0B997A2 # Khaled Hosny <khaled@aliftype.com> (@khaledhosny)
  9F377DDB6D3153A48EB3EB1E63CC496475267693 # Caleb Maclennan <caleb@alerque.com> (@alerque)
  2277650A4E8BDFE4B7F6BE419FEE04E5D3531115 # Ebrahim Byagowi <ebrahim@gnu.org> (@ebraminio)
  EACF64F53455E2771BA661A4803B21859F015E4E # Behdad Esfahbod <behdad@behdad.org> (@behdad)
)

build() {
  cd harfbuzz
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-meson \
      -D b_lto=false \
      -D graphite=enabled \
      -D tests=disabled \
      -D docs=disabled \
      -D cpp_std=c++17 \
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
      -D cpp_std=c++17 \
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
    cp "${srcdir}/harfbuzz/src/hb-ft.h" "${pkgdir}/usr/${_arch}/include/harfbuzz/"
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
