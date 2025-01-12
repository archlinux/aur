# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="atkmm"
_name="${_basename}-2.36"
pkgname="lib32-${_name}"
pkgver=2.36.3
pkgrel=1
pkgdesc="C++ bindings for ATK (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}" 'lib32-at-spi2-core>=2.33.3' 'lib32-glib2' 'lib32-gcc-libs'
         'lib32-glibc' 'lib32-glibmm-2.68' 'lib32-libsigc++-3.0')
makedepends=('meson>=0.55' 'mm-common')
provides=("lib${_name}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('6ec264eaa0c4de0adb7202c600170bde9a7fbe4d466bfbe940eaf7faaa6c5974')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" "${_pkgsrc}/build" \
    --cross-file lib32 \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include"
}
