# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_name="libdvdcss"
pkgname="lib32-${_name}"
pkgver=1.5.0
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption (32 bit)"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=(
  "${_name}>=${pkgver}"
  'lib32-glibc' 
)
makedepends=(
  'lib32-gcc-libs'
  'meson>=0.60'
)
provides=(
  "${_name}.so"
)
_pkgsrc="${_name}-${pkgver}"
source=("https://code.videolan.org/videolan/${_name}/-/archive/${pkgver}/${_pkgsrc}.tar.bz2")
        # "https://download.videolan.org/pub/${_name}/${pkgver}/${_pkgsrc}.tar.bz2"
        # "https://download.videolan.org/pub/${_name}/${pkgver}/${_pkgsrc}.tar.bz2.asc")
sha256sums=('f204a9d8ac8a8414095d556373e5af9b95bb7cc72bf1467d936a48c961e8c474')
# validpgpkeys=('65F7C6B4206BD057A7EB73787180713BE58D1ADC') # VideoLAN Release Signing Key

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
    -D enable_examples=false
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
