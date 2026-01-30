# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libopenmpt"
pkgname="lib32-${_name}"
pkgver=0.8.4
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
sha512sums=('23abe582996431a9129b7119e89bfda62d5f69427aa192081574e5fc4f491a63dccce3343b104cf005a402c4484cea4642e7856c156a19d41504e4f854d72af9')
b2sums=('0e7fa957e9e9ce16d478dee079cc368f320f268020f454380e9e0c968820669dcaeb05012d5fe857762132a01dd950fa637208d9e2a611f140434630164bbb89')

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
