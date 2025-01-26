# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Daniel Isenmann <daniel@archlinux.org>

_name="babl"
pkgname="lib32-${_name}"
pkgver=0.1.110
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
sha512sums=('266e63c5bfd7372b804f7b3c2e610a55043a6b9bcadef5d677991d4864f26dab180d8bf82e2998d111f763b470b6484aa0dd3fc85706f66752f87cd340a52e88')

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
    --cross-file lib32
    -D with-docs=false
    -D enable-gir=false
    -D enable-vapi=false
    -D gi-docgen=disabled
  )

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" "${meson_options[@]}"
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
  rm -rf "bin" "include"
}
