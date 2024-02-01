# Maintainer: Rudy Matela <rudy@matela.com.br>
#
# Contributor: Rudy Matela <rudy@matela.com.br>
#
#
# This package can coexist with the latest version of GHC provided in the
# standard Arch Linux repositories.  This package is useful for:
#
# * testing for forwards/backwards compatibility this specific GHC branch;
# * compiling programs that only work with this specific GHC branch;
# * as a dependency to packages that can only be compiled with this branch.
#
# If you would like to compile GHC yourself,
# you can use this package to bootstrap compilation.
#
#
# https://ghc.gitlab.haskell.org/ghc/doc/users_guide/intro.html#ghc-version-numbering-policy
# https://www.haskell.org/ghc/download.html
# https://www.haskell.org/ghc/download_ghc_7_6_3.html
#
#
# After installing runghc-7.6 and ghci-7.6 work fine out of the box:
#
# $ cat hello.hs
# main = putStrLn "hello"
#
# $ runghc-7.6 hello.hs
# hello
#
# $ ghci-7.6
# > putStrLn "hello"
# hello
#
# However compiling binaries requires either `-optl -no-pie` or `-dynamic`:
#
# $ ghc-7.6 -optl -no-pie hello.hs
#
# $ ghc-7.6 -dynamic hello.hs

pkgname=ghc7.6-bin
pkgver=7.6.3
pkgrel=7
_ver_branch=7.6
pkgdesc="Binary GHC ${_ver_branch} installed on /usr/bin/ghc-${_ver_branch}"
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('BSD-3-Clause')
depends=('gcc' 'gmp4' 'libffi5' 'perl' 'ncurses5-compat-libs')
makedepends=('ghc' 'libxslt' 'docbook-xsl')
install='ghc.install'
provides=("ghc${_ver_branch}")
conflicts=("ghc${_ver_branch}")
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-${CARCH}-unknown-linux.tar.bz2")
sha256sums=('398dd5fa6ed479c075ef9f638ef4fc2cc0fbf994e1b59b54d77c26a8e1e73ca0')

build() {
  cd ghc-${pkgver}

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-${_ver_branch}
}

package() {
  cd ghc-${pkgver}

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

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-${_ver_branch}

  install -d            ${pkgdir}/usr/share/licenses/ghc-${_ver_branch}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/ghc-${_ver_branch}
}
