# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_name="netpbm"
pkgname="lib32-${_name}"
pkgver=10.86.44
pkgrel=3
pkgdesc="A toolkit for manipulation of graphic images (32-bit)"
arch=('x86_64')
license=('Artistic-1.0' 'GPL-2.0-only' 'LGPL-2.0-only' 'MIT')
url="https://${_name}.sourceforge.net"
depends=('lib32-glibc' "${_name}")
makedepends=('lib32-gcc-libs' 'lib32-jbigkit' 'lib32-libjpeg-turbo'
             'lib32-libpng' 'lib32-libtiff' 'lib32-libxml2' 'lib32-zlib')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::https://downloads.sourceforge.net/project/${_name}/super_stable/${pkgver}/${_pkgsrc}.tgz"
        "${_name}-security-code.patch"
        "${_name}_compiled_by_user.patch")
sha256sums=('e7b62782e675d262c69b9f8f6920c9e5e141f7890d13ae87fef8f5c86b6b6cd6'
            '698645215d46bcee515d75847fc550ce99c5fcb6fae63dacdba1d773f327c80e'
            '0384502da3d0c1e20aeaeaeade3b40a3198ae497c5bc0c2cbe0f4f14cdf8f92f')
prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${_name}-security-code.patch"
  patch -Np1 -i "${srcdir}/${_name}_compiled_by_user.patch"

  cp config.mk.in config.mk

  echo "CC = gcc -m32 ${CFLAGS} ${LDFLAGS}" >> config.mk
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

  # cd "lib"
  # sed -e 's|/lib|/lib32|' \
  #     -e 's|/sharedlink|/lib32|' \
  #     -e 's|/staticlink|/lib32|' \
  #     -i 'Makefile'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}/lib"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}/lib"
  # make pkgdir="${pkgdir}/usr" install.

  install -vDm644 "lib${_name}.so.11.86" "${pkgdir}/usr/lib32/lib${_name}.so.11.86"

  cd "${pkgdir}/usr/lib32"
  ln -s "lib${_name}.so.11.86" "lib${_name}.so.11"
  ln -s "lib${_name}.so.11.86" "lib${_name}.so"
}
