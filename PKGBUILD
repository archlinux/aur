# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gtkmm3"
pkgname="lib32-${_name}"
pkgver=3.24.9
pkgrel=1
pkgdesc="C++ bindings for GTK+ 3 (32-bit)"
url="https://www.gtkmm.org"
arch=('x86_64')
license=('LGPL-2.1-or-later')
depends=("${_name}" 'lib32-atkmm>=2.24.2' 'lib32-cairomm>=1.12' 'lib32-gcc-libs'
         'lib32-gdk-pixbuf2>=2.35.5' 'lib32-glib2' 'lib32-glibc' 'lib32-glibmm>=2.54'
         'lib32-gtk3>=3.24' 'lib32-libsigc++' 'lib32-pangomm>=2.38.2')
makedepends=('meson>=0.56' 'mm-common')
checkdepends=('xorg-server-xvfb')
provides=('lib'{gdk,gtk}'mm-3.0.so')
_pkgsrc="${_name//3/}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name//3/}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('30d5bfe404571ce566a8e938c8bac17576420eb508f1e257837da63f14ad44ce')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" build \
    --cross-file lib32 \
    -D maintainer-mode=true \
    -D build-documentation=false \
    -D build-demos=false
  meson compile -C build
}

check() {
  cd "${srcdir}"
  xvfb-run -s '-nolisten local' meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include" "share"
}
