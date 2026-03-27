# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libopenmpt"
pkgname="lib32-${_name}"
pkgver=0.8.6
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
sha512sums=('a9c813f80d2a688d52b161996ff7efab4a7d954ba177e2d2b3541bd9e7e246019510ea4f9027cbcb4e8ef50a21e633aa5fbe796435392e37383900b320fca03f')
b2sums=('44e326d8f8da088cd0353926c80726de6b81b428c79157785c7bb80ebc26d812c08e2463df12d8624a5d1430677cd0b502988ee3b9974b61a72497e9f53ba14a')

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
