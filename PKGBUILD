# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libopenmpt"
pkgname="lib32-${_name}"
pkgver=0.8.10
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
sha512sums=('c6eba868e1f9b65a1c8a4829b461ffe8a1411527336de31131e1f2494f271d2f364ec6f884cbcd93bea7dedb85e18a601fb4537ebdee8f7a3c1eb6116ca7d592')
b2sums=('64a287640f3aca1495a6f77391fdd7165c1b6c736bd7295595f9e7b8d3d0647c8c77eb9fc28427faa45541e178ad0a17f283770dd21882b2d9ed8e6d8759eb63')

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
