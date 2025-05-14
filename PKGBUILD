# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

_name="babl"
pkgname="lib32-${_name}"
pkgver=0.1.114
pkgrel=1
pkgdesc="Dynamic, any to any, pixel format conversion library (32-bit)"
arch=('x86_64')
url="https://gegl.org/babl"
_url="https://gitlab.gnome.org/GNOME/${_name}"
license=('LGPL-3.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-glibc' 'lib32-lcms2>=2.8')
makedepends=('meson>=0.55')
provides=("lib${_name}-${pkgver%.*}.so")
_pkgsrc="${_name}-${_name^^}_${pkgver//./_}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/${_name^^}_${pkgver//./_}/${_pkgsrc}.tar.gz")
sha512sums=('c050c35f13551b0495f3a5615dff1066f0e71b51fcaf9d44e91cb6b231f062caf713d61d269066f5d38461f9668c08fa9625b24feffcf0df35834381dd66fe3a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i "s|type\: \'feature\'|type\: \'boolean\'|g" 'meson.build'

  cp "git-version.h.in" "git-version.h"
  sed -i "s/@BABL_GIT_VERSION@/${pkgver}/g" "git-version.h"
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
    -D with-docs=false
    -D enable-gir=false
    -D enable-vapi=false
    -D gi-docgen=disabled
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

check() {
  cd "${srcdir}"
  meson test -C "${_pkgsrc}/build" --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
