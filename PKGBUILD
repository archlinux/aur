# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libopenmpt"
pkgname="lib32-${_name}"
pkgver=0.8.8
pkgrel=1
pkgdesc="A library to render tracker music to a PCM audio stream (32-bit)"
arch=(
  'x86_64'
)
url="https://lib.openmpt.org/libopenmpt/"
license=(
  'BSD-3-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libogg' # required by pkgconf
  'lib32-libvorbis'
  'lib32-mpg123>=1.14.0'
  'lib32-zlib'
)
makedepends=(
  'autoconf-archive'
)
provides=(
  "${_name}.so"
)
_pkgsrc="${_name}-${pkgver}+release.autotools"
source=(
  "https://lib.openmpt.org/files/${_name}/src/${_pkgsrc}.tar.gz"
)
sha512sums=('10f84c68a02ab3ad292bce4ceef4d8c0afc5127e52164ebe9f96c26d3b4833e9fe25370341f98de6682053624a957a3e8d874a34d16b246cef6ba12d225c61a6')
b2sums=('0690b10136155d25966796a0d9dbdc11b566ae212a98eb7e65b302a4b269340816c567b3df69f8a964e4aa2df651b59522d72012dfcaf101cbb7d62cc114c6e6')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local configure_options=(
    --prefix='/usr'
    --program-suffix="-32"
    --lib{exec,}dir='/usr/lib32'
    --build=i686-pc-linux-gnu
    --disable-openmpt123
    --disable-examples
    # --without-vorbis
    # --without-vorbisfile
  )
  
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool'
  make
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
