# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# From the Stan website, http://mc-stan.org/ :
#   ``Stan is a package for obtaining Bayesian inference using the No-U-Turn
# sampler, a variant of Hamiltonian Monte Carlo.'' (9/22/2013)

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.13.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('texlive-bin' 'texlive-core' 'doxygen')
options=('!libtool' '!strip' '!makeflags')
source=(https://github.com/stan-dev/cmdstan/releases/download/v$pkgver/cmdstan-$pkgver.tar.gz)
sha512sums=('a2b0698a28e568366876d34a052b9edb58a69e2b8d8bed9d54dcfbf786bd0219b19ad57e66982e54bc7714494d9577cad4253f832e5e3aa05af6adfc62c2ef24')

prepare() {
  cd "${srcdir}/cmdstan-${pkgver}"
  
}

build() {
  cd "${srcdir}/cmdstan-${pkgver}"
 
  make bin/stanc
  make bin/print
  
}

check() {
  cd "${srcdir}/cmdstan-${pkgver}"

  # There are tests for the CmdStan interface
  # make src/test/interface
}

package() {
  cd "${srcdir}/cmdstan-${pkgver}"
  
  # Stan's makefile doesn't have a make install command...
  # Install binaries:
  install -dm755                  "${pkgdir}/usr/bin"
  install -m755 bin/stanc         "${pkgdir}/usr/bin"
  install -Tm755 bin/print         "${pkgdir}/usr/bin/stanc-print"

  # Install static library:
  install -dm755                  "${pkgdir}/usr/lib"
  install -m644 bin/libstanc.a     "${pkgdir}/usr/lib"

  install -dm755                  "${pkgdir}/usr/include/stan"
  cd "stan_${pkgver}/src"
  find . -iregex './stan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ../.. 
 
  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/stan"
  cp -r "stan_${pkgver}/licenses/." "${pkgdir}/usr/share/licenses/stan/."

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/stan/api"
  install -m644 doc/*.pdf \
                                  "${pkgdir}/usr/share/doc/stan"
  cp -r "stan_${pkgver}/doc/api/." "${pkgdir}/usr/share/doc/stan/api/."
}
