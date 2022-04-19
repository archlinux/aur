# Maintainer: sukanka <su975853527 [AT] gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.29.2
pkgrel=2
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('texlive-bin' 'texlive-core' 'doxygen' 
# needed if compile against system library

# 'gtest' 'benchmark' 'sundials' 'boost' 'eigen' 'tbb' 'stanmath'
# 'python-cpplint' 'opencl-headers' 'rapidjson' 'cli11'
)
provides=("cmdstan")
source=(https://github.com/stan-dev/cmdstan/releases/download/v$pkgver/cmdstan-$pkgver.tar.gz)
sha512sums=('8b1485c8832fa283307b87c491f259432a7284f4975d21e5424f3b1be0ca9bf1012443c0be1b01b09aecbff40f3d1bb6031abe3bb89d8e64380f61ed9d1ffec3')

build() {
  cd "${srcdir}/cmdstan-${pkgver}"
  make build
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
  ln -s /usr/bin/stanc             "${pkgdir}/usr/bin/cmdstan"
  install -Tm755 bin/diagnose      "${pkgdir}/usr/bin/standiagnose"
  install -Tm755 bin/print         "${pkgdir}/usr/bin/stanprint"
  install -Tm755 bin/stansummary   "${pkgdir}/usr/bin/stansummary"

  install -dm755                  "${pkgdir}/usr/include/stan"
  cd "stan/src"
  find . -iregex './stan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ../.. 
 
  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/stan"
  cp -r "stan/licenses/." "${pkgdir}/usr/share/licenses/stan/."
}
