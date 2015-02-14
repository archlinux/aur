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
pkgver=2.6.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('texlive-bin' 'texlive-core' 'doxygen')
options=('!libtool' '!strip' '!makeflags')
source=(https://github.com/stan-dev/stan/archive/v${pkgver}.tar.gz
        makefile-add-bin-to-libstan-target.patch)
sha512sums=('10ea577bd197a456b6a89446f1ab1b0e1deff8b3d1de6d63ceb88f69ae72483ce7dc7673801f7e5031dcde99467c37e761bfeaf1daa0cff5d0b1da2306ed0434'
            'd8ffd7ebcbe019117027097c3f135a9ec267b3fd6aac81a37035dcacfcf034cc1ccbcc98d6f07a783d09e41dbb90b1e3fa7d4601c7ab270f5e089c06d2434d43')

prepare() {
  cd "${srcdir}/stan-${pkgver}"
  
  #patch makefile "${srcdir}/makefile-add-bin-to-libstan-target.patch"
}

build() {
  cd "${srcdir}/stan-${pkgver}"
  
  make bin/libstan.a
  make bin/libstanc.a
  make bin/stanc
}

check() {
  cd "${srcdir}/stan-${pkgver}"

  #make test-all
}

package() {
  cd "${srcdir}/stan-${pkgver}"
  
  # Stan's makefile doesn't have a make install command...
  # Install binaries:
  install -dm755                  "${pkgdir}/usr/bin"
  install -m755 bin/stanc         "${pkgdir}/usr/bin"
  install -Tm755 bin/print         "${pkgdir}/usr/bin/stanc-print"

  # Install static library:
  install -dm755                  "${pkgdir}/usr/lib"
  install -m644 bin/libstan.a     "${pkgdir}/usr/lib"
  install -m644 bin/libstanc.a    "${pkgdir}/usr/lib"

  # Install header files:
  install -dm755                  "${pkgdir}/usr/include/stan"
  cd src
  find . -iregex './stan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd .. 
 
  # Copy RStan:
  install -dm755                  "${pkgdir}/usr/share/doc/stanc/rstan"
  cp -r rstan/.                   "${pkgdir}/usr/share/doc/stanc/rstan/."

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/stanc"
  cp -r licenses/.                "${pkgdir}/usr/share/licenses/stanc/."

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/stanc/api"
  install -m644 doc/stan-reference-1.3.0.pdf \
                                  "${pkgdir}/usr/share/doc/stanc"
  cp -r doc/api/.                 "${pkgdir}/usr/share/doc/stanc/api/."
}
