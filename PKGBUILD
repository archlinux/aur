# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libcloudproviders"
pkgname="lib32-${_name}"
pkgver=0.3.6
pkgrel=2
pkgdesc="DBus API that allows cloud storage sync clients to expose their services (32-bit)"
url="https://gitlab.gnome.org/World/libcloudproviders"
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('lib32-gcc-libs' 'lib32-glib2>=2.56' 'lib32-glibc' "${_name}>=${pkgver}")
makedepends=('glib2-devel' 'meson>=0.54')
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('3b75110b3a4fdef4c5c5a440e48701fe054d2ae061d156c89136bb5ba05e74b7')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local meson_options=(
    "${_pkgsrc}"
    "${_pkgsrc}/build"
    --cross-file lib32
    -D enable-gtk-doc=false
    -D installed-tests=false
    -D introspection=false
    -D vapigen=false  
  )

  cd "${srcdir}"
  arch-meson "${meson_options[@]}"
  meson compile -C "${_pkgsrc}/build"
}

package() {
  cd "${srcdir}"
  meson install -C "${_pkgsrc}/build" --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include" "bin" "share"
}
