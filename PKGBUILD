# $Id$
# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# The provides and replaces list was taken from:
#   https://github.com/archhaskell/habs/blob/master/ghc/PKGBUILD
pkgname=ghc8.0-bin
pkgver=8.0.2
pkgrel=1
pkgdesc='The Glasgow Haskell Compiler'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi' 'ncurses5-compat-libs')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl' 'ncurses5-compat-libs')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc8.0'
          'haskell8.0-array=0.5.1.1'
          'haskell8.0-base=4.9.1.0'
          'haskell8.0-binary=0.8.3.0'
          'haskell8.0-bytestring=0.10.8.1'
          'haskell8.0-cabal=1.24.2.0'
          'haskell8.0-containers=0.5.7.1'
          'haskell8.0-deepseq=1.4.2.0'
          'haskell8.0-directory=1.3.0.0'
          'haskell8.0-filepath=1.4.1.1'
          'haskell8.0-ghc-boot-th=8.0.2'
          'haskell8.0-ghc-boot=8.0.2'
          'haskell8.0-ghc-prim=0.5.0.0'
          'haskell8.0-ghc=8.0.2'
          'haskell8.0-ghci=8.0.2'
          'haskell8.0-haskeline=0.7.3.0'
          'haskell8.0-hoopl=3.10.2.1'
          'haskell8.0-hpc=0.6.0.3'
          'haskell8.0-integer-gmp=1.0.0.1'
          'haskell8.0-pretty=1.1.3.3'
          'haskell8.0-process=1.4.3.0'
          'haskell8.0-rts=1.0'
          'haskell8.0-template-haskell=2.11.1.0'
          'haskell8.0-terminfo=0.4.0.2'
          'haskell8.0-time=1.6.0.1'
          'haskell8.0-transformers=0.5.2.0'
          'haskell8.0-unix=2.7.2.1'
          'haskell8.0-xhtml=3000.2.1')
replaces=('haskell8.0-array'
          'haskell8.0-base'
          'haskell8.0-binary'
          'haskell8.0-bytestring'
          'haskell8.0-cabal'
          'haskell8.0-containers'
          'haskell8.0-deepseq'
          'haskell8.0-directory'
          'haskell8.0-filepath'
          'haskell8.0-ghc-boot-th'
          'haskell8.0-ghc-boot'
          'haskell8.0-ghc-prim'
          'haskell8.0-ghc'
          'haskell8.0-ghci'
          'haskell8.0-haskeline'
          'haskell8.0-hoopl'
          'haskell8.0-hpc'
          'haskell8.0-integer-gmp'
          'haskell8.0-pretty'
          'haskell8.0-process'
          'haskell8.0-rts'
          'haskell8.0-template-haskell'
          'haskell8.0-terminfo'
          'haskell8.0-time'
          'haskell8.0-transformers'
          'haskell8.0-unix'
          'haskell8.0-xhtml')
conflicts=('ghc8.0')
source_x86_64=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb8-linux.tar.xz")
source_i686=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-i386-deb8-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz")
md5sums_x86_64=('aef13f66d94bd5a3bf12dff77279d3fb')
md5sums_i686=('aab715cf1e032d4c0a0ddfba90e0bf22')

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-8.0",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-8.0
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-8.0
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-8.0
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-8.0
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-8.0
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-8.0
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-8.0
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-8.0
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-8.0
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-8.0 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-8.0.2

  install -d            ${pkgdir}/usr/share/licenses/ghc-8.0
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-8.0
}
