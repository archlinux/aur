# Maintainer: Alonso Rodríguez <alonso.rodriguez (at) udc.es>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wuxb <wuxb45@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=papi
pkgver=7.2.0
pkgrel=1
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url="http://icl.cs.utk.edu/${pkgname}"
license=('BSD')
options=('staticlibs')
depends=('glibc' 'gcc-fortran')
optdepends=('python')
makedepends=('bash')
provides=('libpfm')
conflicts=('libpfm')
source=("http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz")
md5sums=('fc7f90ef8686d15261831fd35dfdbb1b')

prepare() {
  cd "${srcdir}"

  # Make configure use bash
  sed -i 's@#! /bin/sh@#!/bin/bash@g' ${pkgname}-${pkgver}/src/configure

  # It would be awesome to have a .a exported static library from libpfm.
  # Right now we just provide libpfm. Let's see what happens in the future.
  # cd "${pkgname}-${pkgver}/src/libpfm4/docs/man3"
  # local manprefix="papi_"
  # for file in *pfm*.3 *pfm*.3.gz; do
  #   if [[ -f "$file" ]]; then
  #     mv "$file" "${manprefix}${file}"
  #   fi
  # done

  # Patches here if needed
  # patch -Np1 -i your-patch-here.patch # Comment explaining
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  export CFLAGS="-fPIC ${CFLAGS}"
  ./configure \
    --prefix=/usr \
    --with-static-lib=yes \
    --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events

    # This would also be nice if libpfm4 distributed a .a library.
    # --with-pfm-incdir=/usr/include \
    # --with-pfm-libdir=/usr/lib \

  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  mkdir -p $pkgdir/usr/bin
  make DESTDIR="${pkgdir}" install

  chmod 644 $pkgdir/usr/share/papi/papi_events.csv

  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
