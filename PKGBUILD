# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_name="libgexiv2"
pkgname="lib32-${_name}"
pkgver=0.14.3
pkgrel=1
pkgdesc="GObject-based wrapper around the Exiv2 library (32-bit)"
url="https://wiki.gnome.org/Projects/gexiv2"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('lib32-exiv2>=0.26' 'lib32-gcc-libs' 'lib32-glib2>=2.46' 'lib32-glibc'
         "${_name}>=${pkgver}")
makedepends=('glib2-devel' 'meson>=0.51')
provides=("${_name}.so")
_pkgsrc="gexiv2-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/gexiv2/${pkgver%.*}/${_pkgsrc}.tar.xz"
        "${_name}_32bit_long_to_int64_t.patch")
sha512sums=('24c97fa09b9ee32cb98da4637ea78eb72ae7e2d1792f9ebb31d63e305b3e0e1f6935b8647589c76c39ba631a15c1d8d2f3879c7dff81433786e9533b6348b6a0'
            '6208952fd6babbf58f057764ba6e5beb97bc8c0a4495b6937374177fb53d4274192376548b35d9ff70beabc565c45dafa5ab9e5b246401b3ff461159bee7faec')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -p1 -i "${srcdir}/${_name}_32bit_long_to_int64_t.patch"
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    --cross-file lib32
    -D tests=true
    -D gtk_doc=false
    -D introspection=false
    -D vapi=false
    -D tools=false
    -D python3=false
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
  rm -rf "include"
}
