# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 (aka josephgbr)

_name="libsigc++"
pkgname="lib32-${_name}"
pkgver=2.12.1
pkgrel=1
pkgdesc="Callback Framework for C++ (32-bit)"
url="https://libsigcplusplus.github.io/libsigcplusplus"
# _url="https://github.com/libsigcplusplus/libsigcplusplus"
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}")
makedepends=('meson>=0.55' 'mm-common')
provides=('lib32-libsigc++2.0' 'libsigc-2.0.so')
conflicts=('lib32-libsigc++2.0')
replaces=('lib32-libsigc++2.0')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.xz::https://download.gnome.org/sources/${_name}/${pkgver%.*}/${_pkgsrc}.tar.xz")
sha256sums=('a9dbee323351d109b7aee074a9cb89ca3e7bcf8ad8edef1851f4cf359bd50843')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}"
  arch-meson "${_pkgsrc}" build \
    --cross-file lib32 \
    -D maintainer-mode=true \
    -D benchmark=false \
    -D build-examples=false \
    -D build-documentation=false \
    -D build-pdf=false \
    -D validation=false
  meson compile -C build
}

check() {
  cd "${srcdir}"
  meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${pkgdir}/usr"
  rm -rf "include"
}
