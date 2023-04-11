# Maintainer: sukanka <su975853527 [AT] gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.32.0_rc1
pkgrel=2
arch=('i686' 'x86_64')
url='https://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('texlive-bin' 'texlive-core' 'doxygen'
# needed if compile against system library
'gtest' 'benchmark' 'sundials' 'boost' 'eigen' 'stanmath'
'python-cpplint' 'opencl-headers' 'rapidjson'
# 'cli11'
# 'tbb': no  <tbb/tbb_stddef.h>
)
provides=("cmdstan")
source=(https://github.com/stan-dev/cmdstan/releases/download/v${pkgver/_/-}/cmdstan-${pkgver/_/-}.tar.gz
local
)
sha512sums=('6e734ce47561bf9b2d8674bedd0ddd1e22f476d324ac546a368e0ee925ebcb02f1c3da6d8bdc65fcbca15133f2a19c5a4ce46defee1a1b7264b458f76a151a87'
            '94f898b78f66e517b61d6ce2295e72a07e0a9154852c8b8607600fcb968bf106870f3dcde94ae32d7d8f6663e69cfaa021cdea9a2dc88a96479e86686e126950')

prepare(){
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  cp ${srcdir}/local make/local
  cp ${srcdir}/local stan/make/local
  # sed -i 's|CLI11/CLI11.hpp|CLI/CLI.hpp|g' src/cmdstan/stansummary.cpp
}
build() {
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  cd stan/lib/stan_math/lib/tbb_2020.3/
  mkdir ${srcdir}/tbb
  make tbb
  find build -type f -executable -exec install -DTm644 "{}" "${srcdir}/tbb/{}" \;
  mv build/*_release/*.so* ${srcdir}/tbb/
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  export LDFLAGS="-L${srcdir}/tbb -ltbb -Wl,-rpath,/usr/lib/stan"
  export CXXFLAGS="-fPIC -Isrc -Istan/src -I/usr/include/eigen3 -Istan/lib/stan_math/lib/tbb_2020.3/include/ -D_REENTRANT -Ilib/CLI11-1.9.1/"
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
  install -Dm755 ${srcdir}/tbb/*.so*  -t "${pkgdir}/usr/lib/stan"
}
