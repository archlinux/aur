# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libmanette"
pkgname="lib32-${_name}"
pkgver=0.2.12
pkgrel=1
pkgdesc="Simple GObject game controller library (32-bit)"
url="https://gnome.pages.gitlab.gnome.org/libmanette"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=('lib32-gcc-libs' 'lib32-glib2>=2.50' 'lib32-glibc' 'lib32-hidapi'
         'lib32-libevdev>=1.4.5' 'lib32-libgudev>=1' "${_name}>=${pkgver}")
makedepends=('glib2-devel' 'meson>=0.53')
provides=("${_name}-${pkgver%.*}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('48b349267180f1dc34d405a9e1e90ba16f054a19ce907930e679493d911ea1d8')
b2sums=('63c40d7acebdbc90c4f1d0663ae9f17bdb78dd9968007181654d6bca81f1c9a7516b73d5afa0bd8dc31f8d843a62fd8a66e82f2880c0eb76974f01a1596872d5')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D demos=false  
    -D build-tests=true  
    -D install-tests=false  
    -D doc=false  
    -D introspection=false  
    -D vapi=false  
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

  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
