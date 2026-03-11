# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sidney Kuyateh <autinerd-arch at kuyateh dot eu>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libbluray"
pkgname="lib32-${_name}"
pkgver=1.4.1
pkgrel=1
pkgdesc="Library to access Blu-Ray disks for video playback (32-bit)"
url="https://www.videolan.org/developers/libbluray.html"
arch=(
  'x86_64'
)
license=(
  'LGPL-2.1-only'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-fontconfig'
  'lib32-freetype2'
  'lib32-glibc'
  'lib32-libxml2'
)
makedepends=(
  'lib32-gcc-libs'

  'meson>=0.60.0'
)
provides=(
  "${_name}.so"
)
_pkgsrc="${_name}-${pkgver}"
source=(
  "https://download.videolan.org/pub/videolan/${_name}/${pkgver}/${_pkgsrc}.tar.xz"
)
sha256sums=('76b5dc40097f28dca4ebb009c98ed51321b2927453f75cc72cf74acd09b9f449')
sha512sums=('76d686260b7cceb9e9e0272e4b9c4a815511925240dc4b69107c0816131728912f5cf3d08d5eab769024e024377f6591d1bbd51a459039a521639d569473cec6')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    --cross-file lib32
    -D enable_docs=false
    -D enable_tools=false
    -D bdj_jar=disabled
  )

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" "${meson_options[@]}" 
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   meson test -C "${_pkgsrc}/build" --print-errorlogs
# }

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
