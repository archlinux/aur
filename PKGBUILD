# $Id$
# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# The provides and replaces list was taken from:
#   https://github.com/archhaskell/habs/blob/master/ghc/PKGBUILD
pkgname=ghc7.10-bin
pkgver=7.10.3
pkgrel=2
pkgdesc='Binary version of legacy GHC (7.10).  Originally released on December 2015.'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc7.10'
          'haskell7.10-array=0.5.1.0'
          'haskell7.10-base=4.8.1.0'
          'haskell7.10-binary=0.7.5.0'
          'haskell7.10-bin-package-db=0.0.0.0'
          'haskell7.10-bytestring=0.10.6.0'
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
          'haskell7.10-xhtml=3000.2.1'
          'haskell7.10-cabal=1.22.4.0')
replaces=('haskell7.10-array'
          'haskell7.10-base'
          'haskell7.10-binary'
          'haskell7.10-bin-package-db'
          'haskell7.10-bytestring'
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
          'haskell7.10-cabal')
conflicts=('ghc7.10')
source_x86_64=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb8-linux.tar.xz")
source_i686=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-i386-deb8-linux.tar.xz")
md5sums_x86_64=('c9ea458e25a90bcce5fe1269e014bfed')
md5sums_i686=('e695560e45251e70ae1fd433044ae120')
noextract=("ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz")

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.10",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-7.10
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

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
