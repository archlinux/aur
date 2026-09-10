# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sidney Kuyateh <autinerd-arch at kuyateh dot eu>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libbluray"
pkgname="lib32-${_name}"
pkgver=1.5.0
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
sha256sums=('f676408e91a5d321abf8b8d4dfdae36205c297dab5c54c3ec519639025f474a2')
sha512sums=('f35d89097ad0c263ffa2102aba0068e7fe9b85afe27b14cf3c34ed6eff5876d1528aa8a62c3941b767353be2e1de4ae765f1402bd44af4544d922ffb69cea354')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D enable_docs=false
    -D enable_tools=false
    -D bdj_jar=disabled
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}" 
  meson compile -C "${meson_options[1]}"
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
