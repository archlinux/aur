# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="atkmm"
pkgname="lib32-${_name}"
pkgver=2.28.4
pkgrel=1
pkgdesc="C++ bindings for ATK (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}" 'lib32-at-spi2-core>=2.12' 'lib32-glib2' 'lib32-gcc-libs'
         'lib32-glibc' 'lib32-glibmm>=2.46.2' 'lib32-libsigc++')
makedepends=('meson>=0.55' 'mm-common')
provides=("lib${_name}-1.6.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('0a142a8128f83c001efb8014ee463e9a766054ef84686af953135e04d28fdab3')

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
