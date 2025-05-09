# Maintainer: Alonso Rodríguez <alonso.rodriguez (at) udc.es>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: wuxb <wuxb45@gmail.com>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=papi
pkgver=7.1.0
pkgrel=3
pkgdesc="Performance Application Programming Interface"
arch=('x86_64' 'i686')
url="http://icl.cs.utk.edu/${pkgname}"
license=('BSD')
options=('staticlibs')
depends=('glibc' 'gcc-fortran')
optdepends=('python')
source=("http://icl.cs.utk.edu/projects/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz"
        'alderlakex-support.patch'
        'gcc-15.patch')
sha512sums=('6e427505b9237a2165dee8c198708a26f4b366ca31a424340206d29c56d04b13405d20a734f311a1f18cbbbc1b940eb5c93535cd734b0c796459623e93624219'
            '6da4732f9fb87bad0359f1526bcfe00f8ea00ba47df0cabbf35a3324a5e309f9967a18bf9c9855d1cb753f5468161893f1ff8a37cf5114320a9e8466898c700d'
            'fe45004b45dc280725661fb092b592251b6af2c5eb004e3cd58de444b2f21c2581817f6dfdcc144e8e527f3317baf2e460345d80fe87342cb12c82d42fce31b7')

prepare() {
  cd "${srcdir}"

  # Make configure use bash
  sed -i 's@#! /bin/sh@#!/bin/bash@g' ${pkgname}-${pkgver}/src/configure

  # Patch for Alder Lake X support
  patch -Np1 -i alderlakex-support.patch
  patch -Np1 -i gcc-15.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/src"

  export CFLAGS="-fPIC ${CFLAGS}"
  ./configure \
    --prefix=/usr \
    --with-static-lib=yes --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events

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
