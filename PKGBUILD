# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libopenmpt"
pkgname="lib32-${_name}"
pkgver=0.8.7
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
sha512sums=('f0284238a0c1a7892ef948d1a719a13ce817bd0bd0c28a01e92263ca1511442ec836958186fa36c546cc9ca60453f714f9453e0774d910b79233c8698446073d')
b2sums=('ef97f94e46b40cfc2087550659e13a6354abc7f85ac8ffa664414eb52011f4f6bce4fa5088d2ea0bf02c3193a78c6963f418d9b3a976c9c5699289dca18cb04e')

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
