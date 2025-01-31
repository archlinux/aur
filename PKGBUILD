# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gc"
pkgname="lib32-${_name}"
pkgver=8.2.8
pkgrel=2
pkgdesc="A garbage collector for C and C++ (32-bit)"
arch=('x86_64')
url="https://www.hboehm.info/gc"
_url="https://github.com/ivmai/bdwgc"
license=('LicenseRef-GC' 'MIT')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc')
provides=('libcord.so' "lib${_name}.so" 'libgccpp.so' 'libgctba.so')
_pkgsrc="bdwgc-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f8f85e2ad675375df37916826c70f80630b7cc4d3ae33c4447a72640641d224f')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu \
    --enable-cplusplus \
    --disable-static \
    --disable-docs
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' 'libtool' # Fix overlinking
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
