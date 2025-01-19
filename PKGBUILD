# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="pangomm"
_name="${_basename}-2.48"
pkgname="lib32-${_name}"
pkgver=2.56.1
pkgrel=1
pkgdesc="C++ bindings for Pango (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=('lib32-cairomm-1.16' 'lib32-gcc-libs' 'lib32-glib2>=2.68' 'lib32-glibc'
         'lib32-glibmm-2.68' 'lib32-libsigc++-3.0' 'lib32-pango>=1.56' "${_name}")
makedepends=('meson>=0.62' 'mm-common')
provides=("lib${_name}.so")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_basename}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d')

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
