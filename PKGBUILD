# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: josephgbr

_name="pangomm"
pkgname="lib32-${_name}"
pkgver=2.46.4
pkgrel=1
pkgdesc="C++ bindings for Pango (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=(LGPL-2.1-or-later)
depends=('lib32-cairomm' 'lib32-gcc-libs' 'lib32-glib2' 'lib32-glibc'
         'lib32-glibmm' 'lib32-libsigc++' 'lib32-pango' "${_name}")
makedepends=('meson>=0.55' 'mm-common')
provides=('libpangomm-1.4.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('b92016661526424de4b9377f1512f59781f41fb16c9c0267d6133ba1cd68db22')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" build \
    --cross-file lib32 \
    -D maintainer-mode=true \
    -D build-documentation=false
  meson compile -C build
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include"
}
