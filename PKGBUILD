# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
# This package can coexist with the latest version of GHC.
# If you would like to compile GHC yourself (AUR: ghc9.4),
# you can use this to bootstrap compilation.
pkgname=ghc9.4-bin
pkgver=9.4.5
pkgrel=2
pkgdesc='Legacy binary GHC 9.4 installed on /usr/bin/ghc-9.4 (Aug/2022 - Apr/2023).'
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('custom')
depends=('gcc' 'gmp' 'libffi' 'perl')
makedepends=('ghc' 'perl' 'libxslt' 'docbook-xsl')
checkdepends=('python2')
install='ghc.install'
options=('staticlibs')
provides=('ghc9.4')
conflicts=('ghc9.4')
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-x86_64-deb10-linux.tar.xz")
noextract=("ghc-${pkgver}-${CARCH}-deb10-linux.tar.xz")
sha256sums=('a44c39c4cc9a147de6dd31762995a9e47467cc91757800d80667b8cd60a9b226')

prepare() {
	# for some reason, bsdtar cannot unpack this file:
	tar -xf "ghc-${pkgver}-${CARCH}-deb10-linux.tar.xz"
	# see https://wiki.archlinux.org/index.php/PKGBUILD#noextract
}

build() {
  cd ghc-${pkgver}-x86_64-unknown-linux

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-9.4

  # Since ghc9.4 it is not shipped with a LICENSE file.
  # We build one now to use in package()
  grep -A1000 "The Glasgow Haskell Compiler License" doc/html/users_guide/_sources/intro.rst.txt >LICENSE
}

package() {
  cd ghc-${pkgver}-x86_64-unknown-linux

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-9.4
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-9.4
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-9.4
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-9.4
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-9.4
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-9.4
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-9.4
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-9.4
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-9.4 instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-9.4

  install -d            ${pkgdir}/usr/share/licenses/ghc-9.4
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-9.4
}
