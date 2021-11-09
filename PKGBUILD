# $Id$
# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# The provides and replaces list was taken from:
#   https://github.com/archhaskell/habs/blob/master/ghc/PKGBUILD
pkgname=ghc8.0-bin
pkgver=8.0.2
pkgrel=1
pkgdesc='The Glasgow Haskell Compiler'
pkgdesc='Legacy binary GHC 8.0 installed as /usr/bin/ghc-8.0 (May/2016 - Jan/2017).'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi' 'ncurses5-compat-libs')
makedepends=('ghc' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc8.0')
conflicts=('ghc8.0')
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb8-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb8-linux.tar.xz")
sha256sums=('5ee68290db00ca0b79d57bc3a5bdce470de9ce9da0b098a7ce6c504605856c8f')

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
