# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on official ArchLinux package for ghc-7.4.2, by:
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
# This can be built by using GHC 7.4, this is noted by the apparent circular
# dependency on ghc7.4.  A binary version is provided by the AUR ghc7.4-bin
# package.
#
# Warning: GHC takes very long to compile, about 1 hour on a 3MHz machine.
#          Packaging also takes a considerable amound of time, 15 minutes.
#          (your mileage may vary.)
pkgname=ghc7.4
pkgver=7.4.2
pkgrel=2
pkgdesc='Legacy GHC (7.4 series). Originally released on June 2012.'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp>=5.0' 'gcc')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('!makeflags')
provides=('haskell7.4-array=0.4.0.0'
          'haskell7.4-base=4.5.1.0'
          'haskell7.4-binary=0.5.1.0'
          'haskell7.4-bin-package-db=0.0.0.0'
          'haskell7.4-bytestring=0.9.2.1'
          'haskell7.4-containers=0.4.2.1'
          'haskell7.4-deepseq=1.3.0.0'
          'haskell7.4-directory=1.1.0.2'
          'haskell7.4-extensible-exceptions=0.1.1.4'
          'haskell7.4-filepath=1.3.0.0'
          'haskell7.4-ghc-prim=0.2.0.0'
          'haskell7.4-haskell2010=1.1.0.1'
          'haskell7.4-haskell98=2.0.0.1'
          'haskell7.4-hoopl=3.8.7.3'
          'haskell7.4-hpc=0.5.1.1'
          'haskell7.4-integer-gmp=0.4.0.0'
          'haskell7.4-old-locale=1.0.0.4'
          'haskell7.4-old-time=1.1.0.0'
          'haskell7.4-pretty=1.1.1.0'
          'haskell7.4-process=1.1.0.1'
          'haskell7.4-template-haskell=2.7.0.0'
          'haskell7.4-time=1.4'
          'haskell7.4-unix=2.5.1.1'
          'haskell7.4-cabal=1.14.0'
         )
replaces=('haskell7.4-array'
          'haskell7.4-base'
          'haskell7.4-binary'
          'haskell7.4-bin-package-db'
          'haskell7.4-bytestring'
          'haskell7.4-containers'
          'haskell7.4-deepseq'
          'haskell7.4-directory'
          'haskell7.4-extensible-exceptions'
          'haskell7.4-filepath'
          'haskell7.4-ghc-prim'
          'haskell7.4-haskell2010'
          'haskell7.4-haskell98'
          'haskell7.4-hoopl'
          'haskell7.4-hpc'
          'haskell7.4-integer-gmp'
          'haskell7.4-old-locale'
          'haskell7.4-old-time'
          'haskell7.4-pretty'
          'haskell7.4-process'
          'haskell7.4-template-haskell'
          'haskell7.4-time'
          'haskell7.4-unix'
          'haskell7.4-cabal'
          'ghc7.4-bin'
         )
source=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-src.tar.bz2"
        "http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-testsuite.tar.bz2"
        'build.mk'
        'silence-gen_contents_index.diff')
md5sums=('267462db5c5a7c245fb26361b77007c4'
         '528005749c761fe6c12a0079bd84fb90'
         '88ad4108c26f56fc38466d82aaf9a295'
         '2ac480d025b706fc47acc58c54b246bb')

build() {
  cd ghc-${pkgver}

  # Silence gen_contents_index for the common case.
  # http://hackage.haskell.org/trac/ghc/ticket/5992
  patch -Np1 -i ${srcdir}/silence-gen_contents_index.diff
  sed -i 's,"$bindir/ghc","$bindir/ghc-7.4",' utils/runghc/runghc.wrapper

  cp ${srcdir}/build.mk mk/build.mk

  ./configure \
    --prefix=/usr \
    --with-ghc=ghc-7.4 \
    --docdir=/usr/share/doc/ghc-7.4

  make
}

check() {
  cd ghc-${pkgver}

  # python2 rename
  sed -e 's/PYTHON = python/&2/' -i testsuite/mk/boilerplate.mk
  sed -e 's_#!/usr/bin/env python_&2_' -i testsuite/timeout/calibrate testsuite/timeout/timeout.py

  # note: there is one test failure on i686 only: http://hackage.haskell.org/trac/ghc/ticket/5856
  #make THREADS=9 test
  make test
  # might be some failures
  #make fulltest
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.4
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.4
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.4
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.4
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.4
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.4
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.4
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.4
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.4 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.4.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.4
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.4
}
