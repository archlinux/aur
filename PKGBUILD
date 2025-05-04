# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="tinysparql"
pkgname="lib32-${_name}"
pkgver=3.9.2
pkgrel=2
pkgdesc="Low-footprint RDF triple store with SPARQL 1.1 interface (32-bit)"
arch=('x86_64')
url="https://tinysparql.org"
license=('GPL-2.0-or-later')
depends=("${_name}>=${pkgver}" 'lib32-avahi' 'lib32-glib2>=2.52' 'lib32-glibc'
         'lib32-icu' 'lib32-json-glib>=1.4' 'lib32-libsoup3' 'lib32-libstemmer'
         'lib32-libxml2>=2.6' 'lib32-sqlite>=3.20')
makedepends=('glib2-devel' 'lib32-gcc-libs' 'meson>=0.62' 'python-tappy') # 'python-gobject'
provides=("lib32-tracker3=${pkgver}" "lib${_name}-${pkgver%%.*}.0.so")
replaces=('lib32-tracker3<=3.7.3-2')
conflicts=('lib32-tracker3<=3.7.3-2')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('14ce039024135e181022bcce4b1aad2e00377dd9c7d812b98391ccfc756dad8e')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D docs=false 
    -D man=false 
    -D bash_completion=false 
    -D tests=false
    # -D tests_tap_protocol=true 
    -D introspection=disabled 
    -D vapi=disabled 
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

# check() {
#   cd "${srcdir}"
#   dbus-run-session meson test -C "${_pkgsrc}/build" --print-errorlogs -t 3
# }

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "lib" "share"
}
