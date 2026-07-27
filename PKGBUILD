# Maintainer: Sylvainb
# Adapted from ghc9.12-bin by Rudy Matela <rudy@matela.com.br>
#
# This package coexists with the system GHC (currently 9.6 on Arch Linux).
# Binaries are installed as ghc-9.14, ghci-9.14, ghc-pkg-9.14, etc.
#
# https://www.haskell.org/ghc/download_ghc_9_14_1.html

pkgname=ghc9.14-bin
pkgver=9.14.1
pkgrel=2
_ver_branch=9.14
pkgdesc="Binary GHC ${_ver_branch} installed on /usr/bin/ghc-${_ver_branch}"
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('BSD-3-Clause')
depends=('gcc' 'ncurses' 'libffi' 'gmp')
install='ghc.install'
provides=("ghc${_ver_branch}")
conflicts=("ghc${_ver_branch}")
source=("https://downloads.haskell.org/~ghc/${pkgver}/ghc-${pkgver}-${CARCH}-deb12-linux.tar.xz")
sha256sums=('60f7ab75f28df892729fbaff3a54f58ee3ad7e731929f1b2f3eb0208f73de841')
options=(!strip !debug)


prepare() {
  cd ghc-${pkgver}-${CARCH}-unknown-linux

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-${_ver_branch}
}

build() {
  cd ghc-${pkgver}-${CARCH}-unknown-linux

  # GHC 9.14 ships without a standalone LICENSE file — extract it from the docs
  grep -A1000 "The Glasgow Haskell Compiler License" \
    doc/html/users_guide/_sources/intro.rst.txt >LICENSE 2>/dev/null || \
  echo "BSD 3-Clause License — see https://www.haskell.org/ghc/license.html" >LICENSE
}

package() {
  cd ghc-${pkgver}-${CARCH}-unknown-linux

  make DESTDIR=${pkgdir} install

  mv ${pkgdir}/usr/bin/ghc        ${pkgdir}/usr/bin/ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/ghci       ${pkgdir}/usr/bin/ghci-${_ver_branch}
  mv ${pkgdir}/usr/bin/ghc-pkg    ${pkgdir}/usr/bin/ghc-pkg-${_ver_branch}
  mv ${pkgdir}/usr/bin/haddock    ${pkgdir}/usr/bin/haddock-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/hp2ps      ${pkgdir}/usr/bin/hp2ps-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/hpc        ${pkgdir}/usr/bin/hpc-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/hsc2hs     ${pkgdir}/usr/bin/hsc2hs-ghc-${_ver_branch}
  mv ${pkgdir}/usr/bin/runghc     ${pkgdir}/usr/bin/runghc-${_ver_branch}
  rm ${pkgdir}/usr/bin/runhaskell # use runghc-${_ver_branch} instead

  mv ${pkgdir}/usr/share/man/man1/ghc.1 \
     ${pkgdir}/usr/share/man/man1/ghc-${_ver_branch}.1

  install -d            ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
