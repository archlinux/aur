# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libaudclient"
pkgname="lib32-${_name}"
pkgver=3.5rc2
_pkgver="${pkgver//rc/-rc}"
pkgrel=1
pkgdesc="Legacy D-Bus client library for Audacious (32-bit)"
arch=('x86_64')
url="https://audacious-media-player.org"
license=('BSD-2-Clause')
depends=('lib32-dbus-glib>=0.60' 'lib32-glib2' 'lib32-glibc' "${_name}")
provides=("${_name}.so")
_pkgsrc="${_name}-${_pkgver}"
source=("${_pkgsrc}.tar.bz2::https://distfiles.audacious-media-player.org/${_pkgsrc}.tar.bz2")
sha256sums=('57b59936adee309308bebe6d37709ea7e833e53529164cca0720a337c17f175a')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  # ./autogen.sh
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "include"
}
