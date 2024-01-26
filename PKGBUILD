# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
# This package can coexist with the latest version of GHC.
# If you would like to compile GHC yourself (AUR: ghc9.8),
# you can use this to bootstrap compilation.
#
# https://www.haskell.org/ghc/download.html
#
# 9.8 series:
#
# https://www.haskell.org/ghc/download_ghc_9_8_1.html
pkgname=ghc9.8-bin
pkgver=9.8.1
pkgrel=1
pkgdesc='Binary GHC 9.8 installed on /usr/bin/ghc-9.8 (Oct/2023).'
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('gcc' 'gmp' 'libffi' 'perl')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc9.8')
conflicts=('ghc9.8')
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb12-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb12-linux.tar.xz")
sha256sums=('92c79d502c946463d2dd3c63dfd1d6d1ddda139d0b2654c2ce5e56ab8b045e06')

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb12-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}-x86_64-unknown-linux

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-9.8

  # Since ghc9.8 it is not shipped with a LICENSE file.
  # We build one now to use in package()
  grep -A1000 "The Glasgow Haskell Compiler License" doc/html/users_guide/_sources/intro.rst.txt >LICENSE
}

package() {
  cd ghc-${pkgver}-x86_64-unknown-linux

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-9.8
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-9.8
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-9.8
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-9.8
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-9.8
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-9.8
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-9.8
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-9.8
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-9.8 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-9.8

  install -d            ${pkgdir}/usr/share/licenses/ghc-9.8
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-9.8
}
