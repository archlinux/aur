# Maintainer: sukanka <su975853527 [AT] gmail.com>
# Contributor: Ido Rosen <ido@kernel.org>

pkgname='stanc'
pkgdesc="A package for obtaining Bayesian inference using the No-U-Turn sampler, a variant of Hamiltonian Monte Carlo."
pkgver=2.35.0
_mathver=4.9.0
pkgrel=3
arch=('i686' 'x86_64' 'aarch64')
url='https://mc-stan.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=(
  # needed if compile against system library
  'sundials'
  'eigen'
  'rapidjson'
  'boost'
  'cli11'
  'tbb'
  # needed to make doc
  'doxygen'
  'stanmath'
)
provides=("cmdstan")
source=("stanc-${pkgver}.tar.gz::https://github.com/stan-dev/cmdstan/archive/refs/tags/v${pkgver}.tar.gz"
  "stan-${pkgver}.tar.gz::https://github.com/stan-dev/stan/archive/refs/tags/v${pkgver}.tar.gz"
  cli11.patch
  local
)
sha512sums=('6d4305abcab29bb352530795f32f9a85d6f85dc9373059ea14782272f6ac92dd13cfcb1f13f6af79514d51566c1e7bb64d62ff58d26118d62c53c2df1f3c41d8'
  '36a6694c7fbebb3e7bb659ba754ae7a95703750a23b6ec1a0130cf39d251bae68662da74dd21e687bb81d9d2881cdbc5688973af103ae7fcf769f2c0aeb4eec3'
  'c9ad30e8dcb9264315c7078f8f4495417e6937b0207b043776e1fab2acd10704d5518ae04aa535827d17178311014bbe1555692aec0833b7c039e9af1e6c5ad5'
  'b0ed660067f8266adc4eff0c8ef50ef2da0bdb4c161a82e02b6898b84a81740ca6968ec686b4a13140102a57aee23f9b3df1208ca460120db9e3325e1903c7b4')

prepare() {
  cp -rf "${srcdir}/stan-${pkgver/_/-}"/* "${srcdir}/cmdstan-${pkgver/_/-}/stan/"

  cd "${srcdir}/cmdstan-${pkgver/_/-}"

  cp ${srcdir}/local make/local
  cp ${srcdir}/local stan/make/local
  patch --strip=1 <${srcdir}/cli11.patch
  sed -i 's|CLI11/CLI11.hpp|CLI/CLI.hpp|g' src/cmdstan/stansummary.cpp

  # to use stanmath
  sed -i '/include $(MATH)/d' stan/makefile makefile
}
build() {
  cd "${srcdir}/cmdstan-${pkgver/_/-}"
  make build
  cd stan
  make doxygen
}

package() {
  cd "${srcdir}/cmdstan-${pkgver/_/-}"

  # Stan's makefile doesn't have a make install command...
  # Install binaries:
  install -dm755 "${pkgdir}/usr/bin"
  install -m755 bin/stanc "${pkgdir}/usr/bin"
  ln -s /usr/bin/stanc "${pkgdir}/usr/bin/cmdstan"
  install -Tm755 bin/diagnose "${pkgdir}/usr/bin/standiagnose"
  install -Tm755 bin/print "${pkgdir}/usr/bin/stanprint"
  install -Tm755 bin/stansummary "${pkgdir}/usr/bin/stansummary"
  install -d ${pkgdir}/usr/share/doc

  cp -rf stan/doc ${pkgdir}/usr/share/doc/stan

  install -d "${pkgdir}/usr/include/stan"
  install -d "${pkgdir}/usr/include/cmdstan"
  cd "stan/src"
  find . -iregex './stan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ../..
  cd "src"
  find . -iregex './cmdstan.*.hpp$' -type f -exec install -DTm644 "{}" "${pkgdir}/usr/include/{}" \;
  cd ..

  # Install LICENSE file:
  install -dm755 "${pkgdir}/usr/share/licenses/stan"
  cp -r "stan/licenses/." "${pkgdir}/usr/share/licenses/stan/."
}
