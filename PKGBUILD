# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="hyphen"
pkgname="lib32-${_name}"
pkgver=2.8.8
pkgrel=1
pkgdesc="Library for high quality hyphenation and justification (32-bit)"
arch=('x86_64')
url="https://hunspell.sf.net"
license=('GPL-2.0-only OR LGPL-2.1-or-later OR MPL-1.1')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/hunspell/${_pkgsrc}.tar.gz")
sha256sums=('304636d4eccd81a14b6914d07b84c79ebb815288c76fe027b9ebff6ff24d5705')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --program-suffix='-32'
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
  )

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make all
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
