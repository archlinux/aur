# Maintainer: sukanka <su975853527 [AT] gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.31.0_rc1
pkgrel=1
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
source=(https://github.com/stan-dev/cmdstan/releases/download/v${pkgver/_/-}/cmdstan-${pkgver/_/-}.tar.gz)
sha512sums=('65f4b4d6768f7cca953c8aa4e18aa9e6ccc905d7db648e427d211f806b923f0d58f49887f38b12a21dce4ed0b9c35f4a893b60351675582f6fb85000c7933660')

build() {
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  make build
}

package() {
  cd "${srcdir}/cmdstan-${pkgver/_/-}"

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
