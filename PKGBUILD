# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on official ArchLinux package for ghc-7.8.4, by:
#
# Maintainer: Thomas Dziedzic <gostrc@gmail.com>
# Maintainer: Vesa Kaihlavirta <vesa@archlinux.org>
#
# Special note for devs looking to upgrade this package:
#   ghc places a unique hash for each library when it is built.
#   Libraries depend on versions specified by those hashes.
#   This implies that all libraries need to be rebuilt when ghc is rebuilt.
#
# Please consider using the newer GHCs.
#
# This can be built by using GHC 7.8, this is noted by the apparent circular
# dependency on ghc7.8.  A binary version is provided by the AUR ghc7.8-bin
# package.  According to the GHC manual, it may be possible to build this using
# GHC 7.6 also?: it is as of now untested.
#
# Warning: GHC takes very long to compile, about 1 hour on a 3MHz machine.
#          Packaging also takes a considerable amound of time, 15 minutes.
#          (your mileage may vary.)
pkgname=ghc7.8
pkgver=7.8.4
pkgrel=1
pkgdesc='Legacy GHC. Compatible with Haskell Platform 2014.2'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('ghc7.8' 'perl' 'libxslt' 'docbook-xsl')
# will hopefully be able to depend on python 3 in a future version
# https://ghc.haskell.org/trac/ghc/ticket/9184
# title: Allow the use of Python 3 when building GHC
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('haskell7.8-array=0.5.0.0'
          'haskell7.8-base=4.7.0.2'
          'haskell7.8-binary=0.7.1.0'
          'haskell7.8-bin-package-db=0.0.0.0'
          'haskell7.8-bytestring=0.10.4.0'
          'haskell7.8-containers=0.5.5.1'
          'haskell7.8-deepseq=1.3.0.2'
          'haskell7.8-directory=1.2.1.0'
          'haskell7.8-filepath=1.3.0.2'
          'haskell7.8-ghc-prim=0.3.1.0'
          'haskell7.8-haskeline=0.7.1.2'
          'haskell7.8-haskell2010=1.1.2.0'
          'haskell7.8-haskell98=2.0.0.3'
          'haskell7.8-hoopl=3.10.0.1'
          'haskell7.8-hpc=0.6.0.1'
          'haskell7.8-integer-gmp=0.5.1.0'
          'haskell7.8-old-locale=1.0.0.6'
          'haskell7.8-old-time=1.1.0.2'
          'haskell7.8-pretty=1.1.1.1'
          'haskell7.8-process=1.2.0.0'
          'haskell7.8-template-haskell=2.9.0.0'
          'haskell7.8-terminfo=0.4.0.0'
          'haskell7.8-time=1.4.2'
          'haskell7.8-transformers=0.3.0.0'
          'haskell7.8-unix=2.7.0.1'
          'haskell7.8-xhtml=3000.2.1'
          'haskell7.8-cabal=1.18.1.5'
          )
replaces=('haskell7.8-array'
          'haskell7.8-base'
          'haskell7.8-binary'
          'haskell7.8-bin-package-db'
          'haskell7.8-bytestring'
          'haskell7.8-containers'
          'haskell7.8-deepseq'
          'haskell7.8-directory'
          'haskell7.8-filepath'
          'haskell7.8-ghc-prim'
          'haskell7.8-haskeline'
          'haskell7.8-haskell2010'
          'haskell7.8-haskell98'
          'haskell7.8-hoopl'
          'haskell7.8-hpc'
          'haskell7.8-integer-gmp'
          'haskell7.8-old-locale'
          'haskell7.8-old-time'
          'haskell7.8-pretty'
          'haskell7.8-process'
          'haskell7.8-template-haskell'
          'haskell7.8-terminfo'
          'haskell7.8-time'
          'haskell7.8-transformers'
          'haskell7.8-unix'
          'haskell7.8-xhtml'
          'haskell7.8-cabal'
		  'ghc7.8-bin'
          )
source=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-src.tar.xz"
        "http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-testsuite.tar.xz"
        'build.mk')
md5sums=('91f74cf9d813603cc3145528db4bbead'
         '3cc3353d99518be7e7b2d78ebd5460b5'
         'c367ef26300648ee9b8aca3dee5c9669')

build() {
  cd ghc-${pkgver}

  cp ${srcdir}/build.mk mk/build.mk

  ./configure \
    --prefix=/usr \
    --with-system-libffi \
    --with-ffi-includes=/usr/lib/libffi-3.2.1/include \
	--with-ghc=ghc-7.8 \
	--docdir=/usr/share/doc/ghc-7.8

  make
}

check() {
  # keep this otherwise a lot of tests will show as unexpected failures... need to investigate why using -jn for n > 1 does this...
  unset MAKEFLAGS

  cd ghc-${pkgver}

  # python2 rename
  sed -e 's_#!/usr/bin/env python_&2_' -i testsuite/timeout/calibrate testsuite/timeout/timeout.py

  # Unexpected failures:
  #    codeGen/should_run     T8256 [exit code non-0] (normal)
  #    concurrent/should_run  T9379 [exit code non-0] (normal)
  #    perf/compiler          T3064 [stat not good enough] (normal)
  #    perf/compiler          T4801 [stat not good enough] (normal)
  #    perf/compiler          T6048 [stat not good enough] (optasm)
  #    roles/should_compile   T8958 [stderr mismatch] (normal)
  make test

  # enabling threads to speed up
  # causes more failures than make test, need to investigate
  # upstream known failures on both i686 and x86_64:
  #    perf/compiler             parsing001 [stat not good enough] (normal)
  #    simplCore/should_compile  spec-inline [stderr mismatch] (optasm)
  # upstream known failures on i686 only:
  #    numrun012 test fails on i686 works on x86_64 - http://hackage.haskell.org/trac/ghc/ticket/5856
  #make THREADS=9 test

  # will most likely cause lots of failures
  # enable this when upstream has 0 test failures from a simple 'make test'
  # zero unexpected failures on all tier 1 platforms - http://hackage.haskell.org/trac/ghc/ticket/5757
  #make fulltest
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.8
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.8
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.8
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.8
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.8
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.8
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.8
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.8
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.8 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.8.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.8
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.8
}
