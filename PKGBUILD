# $Id: 0de0f994bcc0ef7421088f82c6ffef3550d9bb11 $
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
pkgver=2.6.2
pkgrel=1
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('texlive-bin' 'texlive-core' 'doxygen')
options=('!libtool' '!strip' '!makeflags')
source=(https://github.com/stan-dev/cmdstan/releases/download/v2.6.2/cmdstan-$pkgver.tar.gz)
sha512sums=('d5de808f8c274f67baf2c9e3e3672468264d17319562e0cac4910b0d6cfe06efc353077cfdc0fe2f899ee7831f20f8dff3a172c7634bfcdb8fdaa1407ccf3bb2')

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
  cd stan/src
  find . -iregex './stan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ../.. 
 
  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/stan"
  cp -r stan/licenses/.                "${pkgdir}/usr/share/licenses/stan/."

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/stan/api"
  install -m644 doc/*.pdf \
                                  "${pkgdir}/usr/share/doc/stan"
  cp -r stan/doc/api/.                 "${pkgdir}/usr/share/doc/stan/api/."
}
