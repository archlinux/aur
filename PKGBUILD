# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on official ArchLinux package for ghc-7.10.3, by:
#   Felix Yan <felixonmars@archlinux.org>
#   Thomas Dziedzic <gostrc@gmail.com>
#   Vesa Kaihlavirta <vesa@archlinux.org>
#
# https://git.archlinux.org/svntogit/community.git/tree/ghc/trunk/PKGBUILD?id=9efcfe334efdf5bbcf687101330fd78b54b00280
# https://git.archlinux.org/svntogit/community.git/plain/ghc/trunk/PKGBUILD?id=9efcfe334efdf5bbcf687101330fd78b54b00280
#
# The provides list was taken from the Arch Linux package for ghc-8.0.2:
#
# https://git.archlinux.org/svntogit/community.git/tree/ghc/trunk/PKGBUILD?id=0ecccf9ae079090def3e1b844c6d1dba35fcc6a0
# https://git.archlinux.org/svntogit/community.git/plain/ghc/trunk/PKGBUILD?id=0ecccf9ae079090def3e1b844c6d1dba35fcc6a0
#
# This is packaged in the old-style.  This installs static and dynamic
# libraries alongside.
#
# Special note for devs looking to upgrade this package:
#   ghc places a unique hash for each library when it is built.
#   Libraries depend on versions specified by those hashes.
#   This implies that all libraries need to be rebuilt when ghc is rebuilt.
#
# Please consider using the newer GHCs.
#
# This can be built by using GHC 8.0, this is noted by the apparent circular
# dependency on ghc8.0.  A binary version is provided by the AUR ghc8.0-bin
# package.
#
# Warning: GHC takes very long to compile, about 1 hour on a 3MHz machine.
#          Packaging also takes a considerable amound of time, 15 minutes.
#          (your mileage may vary.)
pkgname=ghc8.0
pkgver=8.0.2
pkgrel=1
pkgdesc='Legacy GHC (8.0 series).  Originally released on January 2017.'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('ghc8.0' 'perl' 'libxslt' 'docbook-xsl')
provides=('haskell8.0-array=0.5.1.1'
          'haskell8.0-base=4.9.1.0'
          'haskell8.0-binary=0.8.3.0'
          'haskell8.0-bytestring=0.10.8.1'
          'haskell8.0-containers=0.5.7.1'
          'haskell8.0-deepseq=1.4.2.0'
          'haskell8.0-directory=1.3.0.0'
          'haskell8.0-filepath=1.4.1.1'
          'haskell8.0-ghc-boot=8.0.2'
          'haskell8.0-ghc-boot-th=8.0.2'
          'haskell8.0-ghc-prim=0.5.0.0'
          'haskell8.0-haskeline=0.7.3.0'
          'haskell8.0-hoopl=3.10.2.1'
          'haskell8.0-hpc=0.6.0.3'
          'haskell8.0-integer-gmp=1.0.0.1'
          'haskell8.0-pretty=1.1.3.3'
          'haskell8.0-process=1.4.3.0'
          'haskell8.0-template-haskell=2.11.1.0'
          'haskell8.0-terminfo=0.4.0.2'
          'haskell8.0-time=1.6.0.1'
          'haskell8.0-transformers=0.5.2.0'
          'haskell8.0-unix=2.7.2.1'
          'haskell8.0-xhtml=3000.2.1'
          'haskell8.0-cabal=1.24.2.0')
replaces=('haskell8.0-array'
          'haskell8.0-base'
          'haskell8.0-binary'
          'haskell8.0-bytestring'
          'haskell8.0-containers'
          'haskell8.0-deepseq'
          'haskell8.0-directory'
          'haskell8.0-filepath'
          'haskell8.0-ghc-boot'
          'haskell8.0-ghc-boot-th'
          'haskell8.0-ghc-prim'
          'haskell8.0-haskeline'
          'haskell8.0-hoopl'
          'haskell8.0-hpc'
          'haskell8.0-integer-gmp'
          'haskell8.0-pretty'
          'haskell8.0-process'
          'haskell8.0-template-haskell'
          'haskell8.0-terminfo'
          'haskell8.0-time'
          'haskell8.0-transformers'
          'haskell8.0-unix'
          'haskell8.0-xhtml'
          'haskell8.0-cabal'
          'ghc8.0-bin')
install='ghc.install'
options=('staticlibs')
source=("https://downloads.haskell.org/~ghc/$pkgver/ghc-$pkgver-src.tar.xz")
noextract=("$pkgname-$pkgver-src.tar.xz")
md5sums=('d0afb5ec441b14527a53d2445cc26ec3')

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
    --with-ghc=ghc-8.0 \
    --docdir=/usr/share/doc/ghc-8.0 \
    --with-system-libffi \
    --with-ffi-includes=$(pkg-config --variable=includedir libffi)

  make
}

package() {
  cd ghc-$pkgver

  make DESTDIR="$pkgdir" install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-8.0
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-8.0
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-8.0
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-8.0
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-8.0
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-8.0
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-8.0
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-8.0
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-8.0 instead

  install -d            ${pkgdir}/usr/share/licenses/ghc-8.0
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-8.0
}
