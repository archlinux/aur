# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_name="netpbm"
pkgname="lib32-${_name}"
pkgver=10.86.44
pkgrel=2
pkgdesc="A toolkit for manipulation of graphic images (32-bit)"
arch=('x86_64')
license=('Artistic-1.0' 'GPL-2.0-only' 'LGPL-2.0-only' 'MIT')
url="https://${_name}.sourceforge.net"
depends=('lib32-glibc')
makedepends=('lib32-gcc-libs' 'lib32-jbigkit' 'lib32-libjpeg-turbo'
             'lib32-libpng' 'lib32-libtiff' 'lib32-libxml2' 'lib32-zlib')
provides=('libnetpbm.so.11.86')
# options=(!makeflags)
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/project/${_name}/super_stable/${pkgver}/${_pkgsrc}.tgz"
        "${_name}-security-code.patch"
        "${_name}-CVE-2017-2587.patch"
        "${_name}_compiled_by_user.patch"
        "${_name}-CAN-2005-2471.patch"
        "${_name}-security-scripts.patch")
sha256sums=('e7b62782e675d262c69b9f8f6920c9e5e141f7890d13ae87fef8f5c86b6b6cd6'
            '698645215d46bcee515d75847fc550ce99c5fcb6fae63dacdba1d773f327c80e'
            '6a903007f90dabe69909dcec556b9a4b00d5b4102816d8d31bf1a1ec1166680b'
            '0384502da3d0c1e20aeaeaeade3b40a3198ae497c5bc0c2cbe0f4f14cdf8f92f'
            '7348274b72b8285add042d0f45d124c9833206ee3440bd1846cfc792b9b4d5e5'
            '5ee27b4187577cbb9e85f6b36c5e5a421e03927f9195f888be7be2b647a5ac9d')
prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}-security-code.patch"
  patch -Np1 -i "${srcdir}/${_name}-CVE-2017-2587.patch"
  patch -Np1 -i "${srcdir}/${_name}_compiled_by_user.patch"
  patch -Np1 -i "${srcdir}/${_name}-CAN-2005-2471.patch"
  patch -Np1 -i "${srcdir}/${_name}-security-scripts.patch"

  cp config.mk.in config.mk

  echo "CC = gcc -m32" >> config.mk
  echo "STATICLIB_TOO = N" >> config.mk
  echo "WANT_SSE = N" >> config.mk
  echo "CFLAGS_FOR_BUILD = ${CFLAGS}" >> config.mk
  echo "LDFLAGS_FOR_BUILD = ${LDFLAGS}" >> config.mk
  echo "PKG_CONFIG = i686-pc-linux-gnu-pkg-config" >> config.mk
  echo "CFLAGS_SHLIB = -fPIC" >> config.mk # x64?
  echo 'TIFFLIB = libtiff.so' >> config.mk
  echo 'JPEGLIB = libjpeg.so' >> config.mk
  echo 'PNGLIB = libpng.so' >> config.mk
  echo 'ZLIB = libz.so' >> config.mk
  # echo 'JBIGLIB = /usr/lib/libjbig.a' >> config.mk
  echo 'JBIGLIB = libjbig.so' >> config.mk

  sed -i 's|misc|share/netpbm|' common.mk
  sed -e 's|/sharedlink|/lib|' -e 's|/staticlink|/lib|' -i lib/Makefile
  sed -i 's|install.manwebmain install.manweb install.man|install.man|' GNUmakefile
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make pkgdir="${pkgdir}/usr" install.lib

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
  mv -f "lib" "lib32"

  cd "lib32"
  rm -f "libnetpbm.so.11"
  ln -s "libnetpbm.so.11.86" "libnetpbm.so.11"
}
