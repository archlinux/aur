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
# The provides list was taken from the Arch Linux package for ghc-8.2.2:
#
# https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/ghc&id=8dddaaf3736499eeaada061bb1af7ec60794078a
# https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/ghc&id=8dddaaf3736499eeaada061bb1af7ec60794078a
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
# This can be built by using GHC 8.2, this is noted by the apparent circular
# dependency on ghc8.2.  A binary version is provided by the AUR ghc8.2-bin
# package.
#
# Warning: GHC takes very long to compile, about 1 hour on a 3MHz machine.
#          Packaging also takes a considerable amound of time, 15 minutes.
#          (your mileage may vary.)
pkgname=ghc8.2
pkgver=8.2.2
pkgrel=1
pkgdesc='Legacy GHC (8.2 series).  Originally released on July 2017.'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('ghc8.2' 'perl' 'libxslt' 'docbook-xsl')
provides=('haskell-array=0.5.2.0'
          'haskell-base=4.10.1.0'
          'haskell-binary=0.8.5.1'
          'haskell-bytestring=0.10.8.2'
          'haskell-containers=0.5.10.2'
          'haskell-deepseq=1.4.3.0'
          'haskell-directory=1.3.0.2'
          'haskell-filepath=1.4.1.2'
          'haskell-ghc-boot=8.2.2'
          'haskell-ghc-boot-th=8.2.2'
          'haskell-ghc-compact=0.1.0.0'
          'haskell-ghc-prim=0.5.1.1'
          'haskell-haskeline=0.7.4.0'
          'haskell-hoopl=3.10.2.2'
          'haskell-hpc=0.6.0.3'
          'haskell-integer-gmp=1.0.1.0'
          'haskell-pretty=1.1.3.3'
          'haskell-process=1.6.1.0'
          'haskell-template-haskell=2.12.0.0'
          'haskell-terminfo=0.4.1.0'
          'haskell-time=1.8.0.2'
          'haskell-transformers=0.5.2.0'
          'haskell-unix=2.7.2.2'
          'haskell-xhtml=3000.2.2'
          'haskell-cabal=2.0.1.0')
replaces=('ghc8.2-bin'
          'haskell-array'
          'haskell-base'
          'haskell-binary'
          'haskell-bytestring'
          'haskell-containers'
          'haskell-deepseq'
          'haskell-directory'
          'haskell-filepath'
          'haskell-ghc-boot'
          'haskell-ghc-boot-th'
          'haskell-ghc-compact'
          'haskell-ghc-prim'
          'haskell-haskeline'
          'haskell-hoopl'
          'haskell-hpc'
          'haskell-integer-gmp'
          'haskell-pretty'
          'haskell-process'
          'haskell-template-haskell'
          'haskell-terminfo'
          'haskell-time'
          'haskell-transformers'
          'haskell-unix'
          'haskell-xhtml'
          'haskell-cabal')
install='ghc.install'
options=('staticlibs')
source=("https://downloads.haskell.org/~ghc/$pkgver/ghc-$pkgver-src.tar.xz")
noextract=("$pkgname-$pkgver-src.tar.xz")
md5sums=('cd25f62e85f4e0343fd4655bbd52f3e7')

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
    --with-ghc=ghc-8.2 \
    --docdir=/usr/share/doc/ghc-8.2 \
    --with-system-libffi \
    --with-ffi-includes=$(pkg-config --variable=includedir libffi)

  make
}

package() {
  cd ghc-$pkgver

  make DESTDIR="$pkgdir" install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-8.2
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-8.2
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-8.2
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-8.2
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-8.2
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-8.2
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-8.2
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-8.2
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-8.2 instead

  install -d            ${pkgdir}/usr/share/licenses/ghc-8.2
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-8.2
}
