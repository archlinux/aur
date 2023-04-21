# Maintainer: sukanka <su975853527 [AT] gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.32.0
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
source=(https://github.com/stan-dev/cmdstan/releases/download/v${pkgver/_/-}/cmdstan-${pkgver/_/-}.tar.gz
local
cli11.patch
)
sha512sums=('ac7b6b7527d4e6ac63c4ed0d17e19021ac2cb1e3f290744bdced017e1c5282285f52a5d4fc72bcf06dd6cb4efb2432d53b76afc73b59fa46ba31682c33214a9d'
            '0e446a71eee57f3e793f6b649b62641634676fc41642f3766157537248ac3595458bd87d6b1f2b3e7be6d8f197336278e16c84626d43a4d240707bd0e871b59d'
            'fff32eedf0f2044c3ffdd0e6e83927d1b6b535f7d2f960ff20a2f6e84b5b825ec90ea3db5c7bd5cf67f6b2079fe1a7fac2529d5379af931175cefac44681700b')

prepare(){
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
