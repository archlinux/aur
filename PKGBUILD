# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="vapoursynth"
pkgname="lib32-${_name}"
pkgver=73
pkgrel=1
pkgdesc="A video processing framework with the future in mind (32-bit)"
url="https://www.vapoursynth.com"
_url="https://github.com/${_name}/${_name}"
arch=(
  'x86_64'
)
license=(
  'LGPL-2.1-or-later'
  'custom:OFL'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-zimg>=3.0.5'
)
makedepends=(
  'meson>=0.63.0'
)
# provides=(
#   "lib${_name}.so"
#   "lib${_name}-script.so"
# )
_pkgsrc="${_name}-R${pkgver}"
source=(
  "${_url}/archive/refs/tags/R${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('8620fe17c6d50d29aca959f01c55f8b625cf83801d6395db00801caa7643975f908699847e62cabfde282e4e9ef8446fbab0bbf521a987c35f01432b7e5715ad')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    --cross-file lib32
    -D enable_vsscript=false
    -D enable_vspipe=false
    -D enable_python_module=false
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
