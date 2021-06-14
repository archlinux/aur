# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
# This package can coexist with the latest version of GHC.
# If you would like to compile GHC yourself (AUR: ghc8.10),
# you can use this to bootstrap compilation.
pkgname=ghc8.10-bin
pkgver=8.10.4
pkgrel=1
pkgdesc='Legacy binary GHC 8.10 installed on /usr/bin/ghc-8.10 (Mar/2020 - Feb/2021).'
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('gcc' 'gmp' 'libffi' 'perl')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl' 'ncurses5-compat-libs')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc8.10')
conflicts=('ghc8.10')
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb10-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb10-linux.tar.xz")
sha256sums=('816365565e9927459b035515a7db6a0db62f9796f327389b6f8a0035d12fbda0')

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb10-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}

  sed -i 's,"$bindir/ghc","$bindir/ghc-8.10",' utils/runghc/runghc.wrapper

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-8.10
}

package() {
  cd ghc-${pkgver}

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-8.10
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-8.10
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-8.10
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-8.10
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-8.10
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-8.10
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-8.10
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-8.10
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-8.10 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-8.10.4

  install -d            ${pkgdir}/usr/share/licenses/ghc-8.10
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-8.10
}
