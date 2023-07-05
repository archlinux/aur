# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
# This package can coexist with the latest version of GHC.
# If you would like to compile GHC yourself (AUR: ghc9.6),
# you can use this to bootstrap compilation.
#
# https://www.haskell.org/ghc/download.html
#
# 9.6 series:
#
# https://www.haskell.org/ghc/download_ghc_9_6_1.html
# https://www.haskell.org/ghc/download_ghc_9_6_2.html
pkgname=ghc9.6-bin
pkgver=9.6.2
pkgrel=1
pkgdesc='Legacy binary GHC 9.6 installed on /usr/bin/ghc-9.6 (Mar/2023 - May/2023).'
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('gcc' 'gmp' 'libffi' 'perl')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc9.6')
conflicts=('ghc9.6')
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb10-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb10-linux.tar.xz")
sha256sums=('63d4bbcee19a343bcdb7bc7c6ca85b1f666a26c7a64fba9014d2160ec3d4ad20')

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb10-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}-x86_64-unknown-linux

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-9.6

  # Since ghc9.6 it is not shipped with a LICENSE file.
  # We build one now to use in package()
  grep -A1000 "The Glasgow Haskell Compiler License" doc/html/users_guide/_sources/intro.rst.txt >LICENSE
}

package() {
  cd ghc-${pkgver}-x86_64-unknown-linux

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-9.6
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-9.6
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-9.6
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-9.6
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-9.6
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-9.6
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-9.6
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-9.6
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-9.6 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-9.6

  install -d            ${pkgdir}/usr/share/licenses/ghc-9.6
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-9.6
}
