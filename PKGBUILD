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
pkgrel=2
pkgdesc='Legacy GHC 8.0 installed as /usr/bin/ghc-8.0 (May/2016 - Jan/2017).'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('ghc8.0' 'libxslt' 'docbook-xsl')
replaces=('ghc8.0-bin')
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
