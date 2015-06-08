
pkgname=psp-libmikmod
pkgver=3.2.0
pkgrel=1
pkgdesc="A portable sound library (psp)"
arch=('any')
url="http://mikmod.shlomifish.org/"
license=('GPL, LGPL')
depends=('psp-sdk')
makedepends=('psp-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=("http://sourceforge.net/projects/mikmod/files/libmikmod-${pkgver}.tar.gz"
        "libmikmod-${pkgver}-PSP.patch")
md5sums=('96e9820d72a41fe27ff304071739696c'
         'ea462ae2c54448718648986150287476')

prepare() {
  cd libmikmod-$pkgver
  rm -f drivers/drv_psp.c
  patch -Np1 -i "$srcdir"/libmikmod-${pkgver}-PSP.patch
}

build() {
  cd libmikmod-$pkgver
  aclocal --force
  libtoolize --force
  aclocal --force
  autoconf --force
  autoheader --force
  automake --add-missing
  export LDFLAGS="-L$(psp-config --pspsdk-path)/lib -L$(psp-config --psp-prefix)/lib -lc -lpspuser"
  export LIBS="-lc -lpspuser"
  mkdir -p build-psp && pushd build-psp
  ../configure --prefix=/usr/psp --host=psp --disable-esd
  
  # FIXME: AC_REPLACE_FUNCS(strcasecmp strdup strstr) in configure.in results in .lo.o files added to LIBOBJS
  sed -i "s|LIBOBJS= \${LIBOBJDIR}strcasecmp.lo\$U.o \${LIBOBJDIR}strdup.lo\$U.o \${LIBOBJDIR}strstr.lo\$U.o|LIBOBJS= \${LIBOBJDIR}strcasecmp.lo \${LIBOBJDIR}strdup.lo \${LIBOBJDIR}strstr.lo|g" libmikmod/Makefile

  make
}

package() {
  cd libmikmod-$pkgver/build-psp
  make DESTDIR="$pkgdir" install
  rm -r "$pkgdir"/usr/psp/share/{info,man}
}
