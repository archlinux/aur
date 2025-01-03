# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Gicu Gorodenco <cyclopsihus 'at' gmail 'dot' com>
# Contributor: rafael ff1 (aka josephgbr)

_name="libsigc++"
pkgname="lib32-${_name}"
_commit="6bef4e0005f00f0844d917866aec7e3b2d829fdf" # 2.12.1
pkgver=2.12.1
pkgrel=1
pkgdesc="Callback Framework for C++ (32-bit)"
url="https://libsigcplusplus.github.io/libsigcplusplus"
_url="https://github.com/libsigcplusplus/libsigcplusplus"
arch=('x86_64')
license=('LGPL-3.0-or-later')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}")
makedepends=('meson>=0.55' 'mm-common')
provides=('lib32-libsigc++2.0' 'libsigc-2.0.so')
conflicts=('lib32-libsigc++2.0')
replaces=('lib32-libsigc++2.0')
_pkgsrc="libsigcplusplus-${_commit}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('8ab92f83a6f396a748d1eb908837c28d99e2647194a0867a25f7b3f09678f02d')

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
