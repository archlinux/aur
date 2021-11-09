# $Id$
# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# The provides and replaces list was taken from:
#   https://github.com/archhaskell/habs/blob/master/ghc/PKGBUILD
pkgname=ghc7.10-bin
pkgver=7.10.3
pkgrel=3
pkgdesc='Legacy binary GHC 7.10 installed on /usr/bin/ghc-7.10 (Mar/2015 - Dec/2015).'
arch=('i686' 'x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('perl' 'gmp' 'gcc' 'libffi' 'ncurses5-compat-libs')
makedepends=('ghc' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc7.10')
conflicts=('ghc7.10')
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb8-linux.tar.xz")
sha256sums=('b478e282afbf489614d0133ef698ba44e901eeb1794f4453c0fb0807cd271b96')
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

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-7.10

  install -d            ${pkgdir}/usr/share/licenses/ghc-7.10
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-7.10
}
