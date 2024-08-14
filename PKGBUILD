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
# https://www.haskell.org/ghc/download_ghc_9_6_6.html

pkgname=ghc9.6-bin
pkgver=9.6.6
pkgrel=1
_ver_branch=9.6
pkgdesc="Binary GHC ${_ver_branch} installed on /usr/bin/ghc-${_ver_branch}"
arch=('x86_64')
url='http://www.haskell.org/ghc/'
license=('BSD-3-Clause')
depends=('gcc' 'ncurses' 'libffi' 'gmp')
install='ghc.install'
provides=("ghc${_ver_branch}")
conflicts=("ghc${_ver_branch}")
source=("https://www.haskell.org/ghc/dist/${pkgver}/ghc-${pkgver}-${CARCH}-deb11-linux.tar.xz")
sha256sums=('a34bdfc1f65b000135d9c8eb12d69670026a64043a8b33ef5ba24b0f8e28d046')

build() {
  cd ghc-${pkgver}-${CARCH}-unknown-linux

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/ghc-${_ver_branch}

  # Since GHC it is not shipped with a LICENSE file.
  # We build one now to use in package()
  grep -A1000 "The Glasgow Haskell Compiler License" doc/html/users_guide/_sources/intro.rst.txt >LICENSE
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

  mv ${pkgdir}/usr/share/man/man1/ghc.1 ${pkgdir}/usr/share/man/man1/ghc-${_ver_branch}.1

  install -d            ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}
