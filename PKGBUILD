# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Sidney Kuyateh <autinerd-arch at kuyateh dot eu>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Tod Jackson <tod.jackson@gmail.com>
# Contributor: Michael Armbruster <michael at armbrust dot me>
# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libbluray"
pkgname="lib32-${_name}"
pkgver=1.5.1
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
  'git'
  'lib32-gcc-libs'
  'meson>=0.60.0'
)
provides=(
  "${_name}.so"
)
# _pkgsrc="${_name}-${pkgver}"
_pkgsrc="${_name}"
source=(
  "git+https://code.videolan.org/videolan/libbluray.git#tag=${pkgver}"
  "git+https://code.videolan.org/videolan/libudfread.git"
  # "https://download.videolan.org/pub/videolan/${_name}/${pkgver}/${_pkgsrc}.tar.xz"
  # "https://download.videolan.org/pub/videolan/${_name}/${pkgver}/${_pkgsrc}.tar.xz.asc"
)
sha256sums=('054d1f5872ad0af36abbf75195d56c1d4b41f3a1cae28a25ff99501f9629fee1'
            'SKIP')
sha512sums=('fab707e998572c32ea1d9f64a72647563a8c210a02c6f8abd64d13a392b4015c5e3c6ab154d6cb27deb534c2f859c1edff661405b3997672cb12828fd0da6b7e'
            'SKIP')
validpgpkeys=(
  '65F7C6B4206BD057A7EB73787180713BE58D1ADC' # VideoLAN Release Signing Key (2018)
)

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  git submodule init contrib/libudfread
  git config submodule.contrib/libudfread.url "${srcdir}/libudfread"
  git -c protocol.file.allow=always submodule update "contrib/libudfread"
}

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
