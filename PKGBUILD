# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Based on upstream ArchLinux version for ghc-7.8, by:
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
# This package is nevertheless useful for testing for backwards compatibility.
#
#
# This package only works for compiling with the -dynamic flag
# so please add it to your calls to ghc-7.6.

pkgname=ghc7.6-bin
pkgver=7.6.3
pkgrel=6
pkgdesc='Binary GHC 7.6 installed on /usr/bin/ghc-7.6 (compatible w/ Haskell Platform 2013.2)'
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
# libffi might be needed in the future: http://hackage.haskell.org/trac/ghc/ticket/4496
depends=('perl' 'gmp4' 'gcc' 'ncurses5-compat-libs' 'libffi5')
makedepends=('perl' 'libxslt' 'docbook-xsl' 'ncurses5-compat-libs')
install='ghc.install'
options=('staticlibs')
provides=('ghc7.6')
conflicts=('ghc7.6')
source=("http://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-unknown-linux.tar.bz2")
sha256sums=('398dd5fa6ed479c075ef9f638ef4fc2cc0fbf994e1b59b54d77c26a8e1e73ca0')

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.6",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-7.6
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

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.6.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.6
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.6
}
