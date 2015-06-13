# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on official ArchLinux package for ghc-7.6.3, by:
#   Thomas Dziedzic <gostrc@gmail.com>
#   Vesa Kaihlavirta <vesa@archlinux.org>
#
# Special note for devs looking to upgrade this package:
#   ghc places a unique hash for each library when it is built.
#   Libraries depend on versions specified by those hashes.
#   This implies that all libraries need to be rebuilt when ghc is rebuilt.
#
#
# Please consider using the newer GHCs.
#
# This can be built by using GHC 7.6, this is noted by the apparent circular
# dependency on ghc7.6.  A binary version is provided by the AUR ghc7.6-bin
# package.  According to the GHC manual, it may be possible to build this using
# GHC 7.4 also: it is as of now untested.
#
# Warning: GHC takes very long to compile, about 1 hour on a 3MHz machine.
#          Packaging also takes a considerable amound of time, 15 minutes.
#          (your mileage may vary.)
pkgname=ghc7.6
pkgver=7.6.3
pkgrel=2
pkgdesc='Legacy GHC. Compatible with Haskell Platform 2013.2'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
# libffi might be needed in the future: http://hackage.haskell.org/trac/ghc/ticket/4496
depends=('perl' 'gmp>=5.0' 'gcc') # 'libffi')
makedepends=('ghc7.6' 'perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
# keep this otherwise a lot of tests will show as unexpected failures... need to investigate why using -jn for n > 1 does this...
#options=('!makeflags')
options=('staticlibs')
# missing rtl?
provides=('haskell7.6-array=0.4.0.1'
          'haskell7.6-base=4.6.0.1'
          'haskell7.6-binary=0.5.1.1'
          'haskell7.6-bin-package-db=0.0.0.0'
          'haskell7.6-bytestring=0.10.0.2'
          'haskell7.6-containers=0.5.0.0'
          'haskell7.6-deepseq=1.3.0.1'
          'haskell7.6-directory=1.2.0.1'
          'haskell7.6-filepath=1.3.0.1'
          'haskell7.6-ghc-prim=0.3.0.0'
          'haskell7.6-haskell2010=1.1.1.0'
          'haskell7.6-haskell98=2.0.0.2'
          'haskell7.6-hoopl=3.9.0.0'
          'haskell7.6-hpc=0.6.0.0'
          'haskell7.6-integer-gmp=0.5.0.0'
          'haskell7.6-old-locale=1.0.0.5'
          'haskell7.6-old-time=1.1.0.1'
          'haskell7.6-pretty=1.1.1.0'
          'haskell7.6-process=1.1.0.2'
          'haskell7.6-template-haskell=2.8.0.0'
          'haskell7.6-time=1.4.0.1'
          'haskell7.6-unix=2.6.0.1'
          'haskell7.6-cabal=1.16.0'
         )
replaces=('haskell7.6-array<0.4.0.1'
          'haskell7.6-base<4.6.0.1'
          'haskell7.6-binary<0.5.1.1'
          'haskell7.6-bin-package-db<0.0.0.0'
          'haskell7.6-bytestring<0.10.0.2'
          'haskell7.6-containers<0.5.0.0'
          'haskell7.6-deepseq<1.3.0.1'
          'haskell7.6-directory<1.2.0.1'
          'haskell7.6-filepath<1.3.0.1'
          'haskell7.6-ghc-prim<0.3.0.0'
          'haskell7.6-haskell2010<1.1.1.0'
          'haskell7.6-haskell98<2.0.0.2'
          'haskell7.6-hoopl<3.9.0.0'
          'haskell7.6-hpc<0.6.0.0'
          'haskell7.6-integer-gmp<0.5.0.0'
          'haskell7.6-old-locale<1.0.0.5'
          'haskell7.6-old-time<1.1.0.1'
          'haskell7.6-pretty<1.1.1.0'
          'haskell7.6-process<1.1.0.2'
          'haskell7.6-template-haskell<2.8.0.0'
          'haskell7.6-time<1.4.0.1'
          'haskell7.6-unix<2.6.0.1'
          'haskell7.6-cabal<1.16.0'
          'ghc7.6-bin'
         )
source=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-src.tar.bz2"
        "http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-testsuite.tar.bz2"
        'build.mk')
md5sums=('986d1f90ca30d60f7b2820d75c6b8ea7'
         '66aa6177a31cc4b9d7eeb55cb1514918'
         'c367ef26300648ee9b8aca3dee5c9669')

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.6",' utils/runghc/runghc.wrapper

  cp ${srcdir}/build.mk mk/build.mk

  ./configure \
    --prefix=/usr \
	--with-ghc=ghc-7.6

  make
}

check() {
  # keep this otherwise a lot of tests will show as unexpected failures... need to investigate why using -jn for n > 1 does this...
  unset MAKEFLAGS

  cd ghc-${pkgver}

  # python2 rename
  sed -e 's/PYTHON = python/&2/' -i testsuite/mk/boilerplate.mk
  sed -e 's_#!/usr/bin/env python_&2_' -i testsuite/timeout/calibrate testsuite/timeout/timeout.py

  # upstream known failures on both i686 and x86_64:
  #    ghci.debugger/scripts     break011 [bad stderr] (ghci)
  #    perf/compiler             parsing001 [stat not good enough] (normal)
  #    simplCore/should_compile  spec-inline [stderr mismatch] (optasm)
  # upstream known failures on i686 only:
  #    numrun012 test fails on i686 works on x86_64 - http://hackage.haskell.org/trac/ghc/ticket/5856
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

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.6
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.6
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.6
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.6
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.6
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.6
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.6
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.6
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.6 instead

  mv ${pkgdir}/usr/share/doc/ghc  ${pkgdir}/usr/share/doc/ghc-7.6
  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.6.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.6
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.6
}
