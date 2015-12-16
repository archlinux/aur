# $Id$
# Maintainer: Tristan Rice <rice@fn.lc>
# This is based on the aur package ghc7.6 and the standard ghc package.
# Special note for devs looking to upgrade this package:
#   ghc places a unique hash for each library when it is built.
#   Libraries depend on versions specified by those hashes.
#   This implies that all libraries need to be rebuilt when ghc is rebuilt.

# use the following command to print out packages that need to get rebuilt
# grep -r ghc /var/abs/ | awk -F '/' '{ print $5; }' | sort -u

pkgname=ghc7.8-bin
pkgver=7.8.4
pkgrel=1
pkgdesc='The Glasgow Haskell Compiler'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi' 'libtinfo')
makedepends=('perl' 'libxslt' 'docbook-xsl')
# will hopefully be able to depend on python 3 in a future version
# https://ghc.haskell.org/trac/ghc/ticket/9184
# title: Allow the use of Python 3 when building GHC
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc7.8'
          'haskell7.8-array=0.5.0.0'
          'haskell7.8-base=4.7.0.2'
          'haskell7.8-binary=0.7.1.0'
          'haskell7.8-bin-package-db=0.0.0.0'
          'haskell7.8-bytestring=0.10.4.0'
          'haskell7.8-containers=0.5.5.1'
          'haskell7.8-deepseq=1.3.0.2'
          'haskell7.8-directory=1.2.1.0'
          'haskell7.8-filepath=1.3.0.2'
          'haskell7.8-ghc-prim=0.3.1.0'
          'haskell7.8-haskeline=0.7.1.2'
          'haskell7.8-haskell2010=1.1.2.0'
          'haskell7.8-haskell98=2.0.0.3'
          'haskell7.8-hoopl=3.10.0.1'
          'haskell7.8-hpc=0.6.0.1'
          'haskell7.8-integer-gmp=0.5.1.0'
          'haskell7.8-old-locale=1.0.0.6'
          'haskell7.8-old-time=1.1.0.2'
          'haskell7.8-pretty=1.1.1.1'
          'haskell7.8-process=1.2.0.0'
          'haskell7.8-template-haskell=2.9.0.0'
          'haskell7.8-terminfo=0.4.0.0'
          'haskell7.8-time=1.4.2'
          'haskell7.8-transformers=0.3.0.0'
          'haskell7.8-unix=2.7.0.1'
          'haskell7.8-xhtml=3000.2.1'
          'haskell7.8-cabal=1.18.1.5'
          )
replaces=('haskell7.8-array'
          'haskell7.8-base'
          'haskell7.8-binary'
          'haskell7.8-bin-package-db'
          'haskell7.8-bytestring'
          'haskell7.8-containers'
          'haskell7.8-deepseq'
          'haskell7.8-directory'
          'haskell7.8-filepath'
          'haskell7.8-ghc-prim'
          'haskell7.8-haskeline'
          'haskell7.8-haskell2010'
          'haskell7.8-haskell98'
          'haskell7.8-hoopl'
          'haskell7.8-hpc'
          'haskell7.8-integer-gmp'
          'haskell7.8-old-locale'
          'haskell7.8-old-time'
          'haskell7.8-pretty'
          'haskell7.8-process'
          'haskell7.8-template-haskell'
          'haskell7.8-terminfo'
          'haskell7.8-time'
          'haskell7.8-transformers'
          'haskell7.8-unix'
          'haskell7.8-xhtml'
          'haskell7.8-cabal'
          )
conflicts=('ghc7.8')
source_x86_64=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-unknown-linux-deb7.tar.bz2")
source_i686=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-i386-unknown-linux-deb7.tar.bz2")
noextract=("ghc-${pkgver}-x86_64-unknown-linux-deb7.tar.bz2"
           "ghc-${pkgver}-i386-unknown-linux-deb7.tar.bz2")
md5sums_x86_64=('b74ecb4b8d626555ae78d0b23cc3a452')
md5sums_i686=('d029463f15cf0df1d50b1fa22e827657')
prepare() {
  tar xf "ghc-${pkgver}-x86_64-unknown-linux-deb7.tar.bz2" || tar xf "ghc-${pkgver}-i386-unknown-linux-deb7.tar.bz2"
}
build() {

  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-7.8",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-7.8
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-7.8
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-7.8
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-7.8
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-7.8
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-7.8
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-7.8
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-7.8
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-7.8 instead

  mv ${pkgdir}/usr/share/doc/ghc  ${pkgdir}/usr/share/doc/ghc-7.8
  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.8.1

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.8
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.8
}
