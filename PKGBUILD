# Maintainer: Hans-Nikolai Viessmann <hans AT viess.mn>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: jedbrown

pkgname=papi-cuda
pkgver=7.1.0
pkgrel=1
pkgdesc='Performance Application Programming Interface (with CUDA componet)'
arch=('x86_64')
url='http://icl.cs.utk.edu/papi/'
license=('BSD-3-Clause')
provides=("papi=${pkgver}")
conflicts=('papi' 'libpfm4')
depends=('cuda<12.5')
options=('staticlibs' '!lto')
makedepends=('gcc-fortran' 'cuda<12.5' 'openmpi')
optdepends=('openmpi: for MPI applications'
            'gcc-fortran: for Fortran applications')
source=("https://github.com/icl-utk-edu/papi/archive/refs/tags/papi-${pkgver//./-}-t.tar.gz"
        'alderlakex-support.patch'
        'cuda-component-build-targets.patch'
        '0001-Renaming-cupti_common.-to-papi_cupti_common.-to-avoi.patch'
        '0002-Adding-papi_cupti_common.c-and-papi_cupti_common.h.patch'
        'sde-ldflags.patch')
sha256sums=('9dafe864bc221e3717fc8880bde8bc8a301f097a3f81e5964c0ac71f3b34e7e9'
            'c1386a67c874b9088dc508b5dd6897202659ba7cca19e2ac441717a7098bd5c1'
            '9817b30a1fe1ef81c1b2a17845fbaa9fc1f4624c28e40d59b71252af02e6237c'
            '4d8d7e7adf391ddce222fc6da681b6a0070c60d696d8e4fbdc4a78429713b564'
            '52ff94ad9424994f8a3d6152fe037094d28a2cf750c113ef19f3ce03577df993'
            'f427fb3cd4287a5304cc2c639129d73b08fb2033fe285a380a042719f354cd20')

prepare() {
  cd "${srcdir}/papi-papi-${pkgver//./-}-t/src"

  # resolve issue with NVCC not understand `-Wl` flag
  patch -p1 < ${srcdir}/cuda-component-build-targets.patch

  # resolve CUDA >= 12.4 compilation issue (see https://github.com/icl-utk-edu/papi/pull/205)
  patch -p2 < ${srcdir}/0001-Renaming-cupti_common.-to-papi_cupti_common.-to-avoi.patch
  patch -p2 < ${srcdir}/0002-Adding-papi_cupti_common.c-and-papi_cupti_common.h.patch

  # fix missing LDFLAGS for SDE component (for full RELRO)
  patch -p1 < $srcdir/sde-ldflags.patch

  # Make configure use bash
  sed -i 's@#! /bin/sh@#!/bin/bash@g' configure

  # Patch for Alder Lake X support
  patch -Np1 -i ${srcdir}/alderlakex-support.patch
}

build() {
  cd "${srcdir}/papi-papi-${pkgver//./-}-t/src"

  # FIXME for the cuda component there are a few snprintf calls which
  #       trigger the format-security checks. I might try to write a
  #       patch for this, but for now we disable this check locally.
  export CFLAGS="-fPIC ${CFLAGS/-Werror=format-security/}"
  export CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  # set CUDA root path
  export PAPI_CUDA_ROOT=/opt/cuda

  # enforce specifc CC/FC (XXX this should be adapted for your system)
  export CC=gcc # for systems with other CC installed
  export F77=gfortran # for systems with other FC installed

  ./configure \
    --prefix=/usr \
    --with-static-lib=yes --with-shared-lib=yes \
    --mandir=/usr/share/man \
    --with-perf-events \
    --with-components="sde cuda"

  DBG="" make
}

check(){
  cd "${srcdir}/papi-papi-${pkgver//./-}-t/src"

  #make test
  ./run_tests.sh
}

package() {
  cd "${srcdir}/papi-papi-${pkgver//./-}-t/src"

  make DESTDIR="${pkgdir}" install
  chmod 644 ${pkgdir}/usr/share/papi/papi_events.csv
  install -Dm644 ${srcdir}/papi-papi-${pkgver//./-}-t/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
