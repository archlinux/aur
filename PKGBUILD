# Maintainer: sukanka <su975853527 [AT] gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.33.0
pkgrel=1
arch=('i686' 'x86_64')
url='https://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('texlive-bin' 'texlive-core' 'doxygen'
# needed if compile against system library
'gtest' 'benchmark' 'sundials' 'boost' 'eigen' 'stanmath'
'python-cpplint' 'opencl-headers' 'rapidjson'
'cli11' 'tbb'
'inetutils'
)
provides=("cmdstan")
source=("stanc-${pkgver}.tar.gz::https://github.com/stan-dev/cmdstan/archive/refs/tags/v${pkgver}.tar.gz"
"stan-${pkgver}.tar.gz::https://github.com/stan-dev/stan/archive/refs/tags/v${pkgver}.tar.gz"
local
cli11.patch
)
sha512sums=('7c2580a5abdaf27522fb3d2db2a851e1c642424438ab41942ddd7b5cc81975b6bb5955536c784c0a39df8e80785260ed2e20e99fbcca7568d3e154cca295bfc5'
            '6e7541e9688eab98e7c92cb10e5ef741d361d8c4f879fccdf784f2d492652454cf44a1331122529d7d344d3252520966d344dec0e14934458c7d5bfa8139530d'
            '83d164dc8ac6f53980874ee2654dc5a88610ec58763624534cdd169cec0e1639875a2eb470bbf00c4ad5073dc37aea070f87c137c8f080d817fd0983f262acd6'
            'fff32eedf0f2044c3ffdd0e6e83927d1b6b535f7d2f960ff20a2f6e84b5b825ec90ea3db5c7bd5cf67f6b2079fe1a7fac2529d5379af931175cefac44681700b')

prepare(){
  cp -rf "${srcdir}/stan-${pkgver/_/-}"/* "${srcdir}/cmdstan-${pkgver/_/-}/stan/"
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  patch --strip=1 < ../cli11.patch
  cp ${srcdir}/local make/local
  cp ${srcdir}/local stan/make/local
  sed -i 's|CLI11/CLI11.hpp|CLI/CLI.hpp|g' src/cmdstan/stansummary.cpp
}
build() {
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  export LDFLAGS="-ltbb"
  export CXXFLAGS="-fPIC -Isrc -Istan/src -I/usr/include/eigen3 -D_REENTRANT -DTBB_INTERFACE_NEW"
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

  install -d                  "${pkgdir}/usr/include/stan"
  install -d                 "${pkgdir}/usr/include/cmdstan"
  cd "stan/src"
  find . -iregex './stan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ../..
  cd "src"
  find . -iregex './cmdstan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ..

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/stan"
  cp -r "stan/licenses/." "${pkgdir}/usr/share/licenses/stan/."
}
