# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# The provides list was taken from the Arch Linux package for ghc-8.2.2:
#
# https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/ghc&id=8dddaaf3736499eeaada061bb1af7ec60794078a
# https://git.archlinux.org/svntogit/community.git/plain/trunk/PKGBUILD?h=packages/ghc&id=8dddaaf3736499eeaada061bb1af7ec60794078a
pkgname=ghc8.2-bin
pkgver=8.2.2
pkgrel=1
pkgdesc='Binary version of legacy GHC (8.2 series).  Originally released on July 2017.'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('gcc' 'gmp' 'libffi' 'perl')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl' 'ncurses5-compat-libs')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc8.2'
          'haskell-array=0.5.2.0'
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
replaces=('haskell-array'
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
conflicts=('ghc8.2')
source_x86_64=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb8-linux.tar.xz")
source_i686=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-i386-deb8-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz")
md5sums_x86_64=('2a2a867da5fd0ea9ba6508932b3ae09d')
md5sums_i686=('0a448cc881b7b4483423cfc65063573a')

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-8.2",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-8.2
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-8.2
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-8.2
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-8.2
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-8.2
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-8.2
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-8.2
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-8.2
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-8.2
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-8.2 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-8.2.2

  install -d            ${pkgdir}/usr/share/licenses/ghc-8.2
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-8.2
}
