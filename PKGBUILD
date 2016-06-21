# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on official ArchLinux package for ghc-7.10.3, by:
#   Felix Yan <felixonmars@archlinux.org>
#   Thomas Dziedzic <gostrc@gmail.com>
#   Vesa Kaihlavirta <vesa@archlinux.org>
#
# Special note for devs looking to upgrade this package:
#   ghc places a unique hash for each library when it is built.
#   Libraries depend on versions specified by those hashes.
#   This implies that all libraries need to be rebuilt when ghc is rebuilt.
#
# Please consider using the newer GHCs.
#
# This can be built by using GHC 7.10, this is noted by the apparent circular
# dependency on ghc7.10.  A binary version is provided by the AUR ghc7.10-bin
# package.
#
# Warning: GHC takes very long to compile, about 1 hour on a 3MHz machine.
#          Packaging also takes a considerable amound of time, 15 minutes.
#          (your mileage may vary.)
pkgname=ghc7.10
pkgver=7.10.3
pkgrel=1
pkgdesc='Legacy GHC (7.10 series).  Originally released on December 2015.'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('ghc7.10' 'perl' 'libxslt' 'docbook-xsl')
provides=('haskell7.10-array=0.5.1.0'
          'haskell7.10-base=4.8.2.0'
          'haskell7.10-binary=0.7.5.0'
          'haskell7.10-bin-package-db=0.0.0.0'
          'haskell7.10-bytestring=0.10.6.0'
          'haskell7.10-cabal=1.22.5.0'
          'haskell7.10-containers=0.5.6.2'
          'haskell7.10-deepseq=1.4.1.1'
          'haskell7.10-directory=1.2.2.0'
          'haskell7.10-filepath=1.4.0.0'
          'haskell7.10-ghc-prim=0.4.0.0'
          'haskell7.10-haskeline=0.7.2.1'
          'haskell7.10-hoopl=3.10.0.2'
          'haskell7.10-hpc=0.6.0.2'
          'haskell7.10-integer-gmp=1.0.0.0'
          'haskell7.10-pretty=1.1.2.0'
          'haskell7.10-process=1.2.3.0'
          'haskell7.10-template-haskell=2.10.0.0'
          'haskell7.10-terminfo=0.4.0.1'
          'haskell7.10-time=1.5.0.1'
          'haskell7.10-transformers=0.4.2.0'
          'haskell7.10-unix=2.7.1.0'
          'haskell7.10-xhtml=3000.2.1')
replaces=('haskell7.10-array'
          'haskell7.10-base'
          'haskell7.10-binary'
          'haskell7.10-bin-package-db'
          'haskell7.10-bytestring'
          'haskell7.10-cabal'
          'haskell7.10-containers'
          'haskell7.10-deepseq'
          'haskell7.10-directory'
          'haskell7.10-filepath'
          'haskell7.10-ghc-prim'
          'haskell7.10-haskeline'
          'haskell7.10-hoopl'
          'haskell7.10-hpc'
          'haskell7.10-integer-gmp'
          'haskell7.10-pretty'
          'haskell7.10-process'
          'haskell7.10-template-haskell'
          'haskell7.10-terminfo'
          'haskell7.10-time'
          'haskell7.10-transformers'
          'haskell7.10-unix'
          'haskell7.10-xhtml'
          'ghc7.10-bin')
install='ghc.install'
options=('staticlibs')
source=("https://downloads.haskell.org/~ghc/$pkgver/ghc-$pkgver-src.tar.xz")
noextract=("$pkgname-$pkgver-src.tar.xz")
md5sums=('00104e629bfda9f956c23752b5f38613')

prepare() {
  # Need to extract this tarball with a UTF-8 locale instead of a chroot's "C"
  # locale; otherwise we get:
  #   bsdtar: Pathname can't be converted from UTF-8 to current locale.
  LANG=en_US.UTF-8 bsdtar xf ghc-$pkgver-src.tar.xz

  cd ghc-$pkgver

  # We select the following build profile:
  #   Full build with max optimisation and everything enabled (very slow build)
  cp mk/build.mk{.sample,}
  sed -i '1iBuildFlavour = perf' mk/build.mk
}

build() {
  cd ghc-$pkgver

  ./configure \
    --prefix=/usr \
    --with-ghc=ghc-7.10 \
    --docdir=/usr/share/doc/ghc-7.10 \
    --with-system-libffi \
    --with-ffi-includes=$(pkg-config --variable=includedir libffi)

  make
}

package() {
  cd ghc-$pkgver

  make DESTDIR="$pkgdir" install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.10
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.10
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.10
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.10
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.10
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.10
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.10
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.10
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.10 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.10.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.10
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.10
}
