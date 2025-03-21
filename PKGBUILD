# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_name="netpbm"
pkgname="lib32-${_name}"
pkgver=10.86.44
pkgrel=4
pkgdesc="A toolkit for manipulation of graphic images (32-bit)"
arch=('x86_64')
license=('Artistic-1.0' 'GPL-2.0-only' 'LGPL-2.0-only' 'MIT')
url="https://${_name}.sourceforge.net"
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('lib32-gcc-libs')
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
  # echo "HAVE_INT64 = N" >> config.mk # x64?
  # echo "WANT_SSE = N" >> config.mk
  echo "CFLAGS_FOR_BUILD = ${CFLAGS}" >> config.mk
  echo "LDFLAGS_FOR_BUILD = ${LDFLAGS}" >> config.mk
  echo "STRIPFLAG = " >> config.mk
  echo "PKG_CONFIG = i686-pc-linux-gnu-pkg-config" >> config.mk
  echo "CFLAGS_SHLIB = -fPIC" >> config.mk # x64?
  echo "TIFFLIB = NONE" >> config.mk
  echo "TIFFHDR_DIR = " >> config.mk
  echo "JPEGLIB = NONE" >> config.mk
  echo "JPEGHDR_DIR = " >> config.mk
  echo "PNGLIB = NONE" >> config.mk
  echo "PNGHDR_DIR = " >> config.mk
  echo "ZLIB = NONE" >> config.mk
  echo "ZHDR_DIR = " >> config.mk
  echo "JBIGLIB = NONE" >> config.mk
  echo "JBIGHDR_DIR = " >> config.mk
  echo "JASPERLIB = NONE" >> config.mk
  echo "JASPERHDR_DIR = " >> config.mk
  echo "URTLIB = NONE" >> config.mk
  echo "URTHDR_DIR = " >> config.mk
  echo "X11LIB = NONE" >> config.mk
  echo "X11HDR_DIR = " >> config.mk
  echo "LINUXSVGALIB = NONE" >> config.mk
  echo "LINUXSVGAHDR_DIR = " >> config.mk
  # echo "STATICLIB_TOO = N" >> config.mk

  find . -type f \( -name '*Makefile*' -o -name '*makefile*' -o -name '*.mk' \) -exec \
    sed -e 's| $(PKGDIR)/lib| $(PKGDIR)/lib32|g' \
        -e 's|$(SYMLINK) ../lib|$(SYMLINK) .|g' \
        -e 's|/sharedlink|/lib32|g' \
        -e 's|/staticlink|/lib32|g' \
        -i "{}" +
  sed -i 's|PKGSUBDIRS =|PKGSUBDIRS = lib32|g' 'common.mk'
}

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}/lib"
  make pkgdir="${pkgdir}/usr"
}

package() {
  cd "${srcdir}/${_pkgsrc}/lib"
  make pkgdir="${pkgdir}/usr" install.staticlib install.lib install.sharedlibstub
}
