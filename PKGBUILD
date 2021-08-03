# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='faraday-excon'
pkgname="ruby-${_gemname}"
pkgver=1.1.0
pkgrel=1
pkgdesc='Faraday adapter for Excon'
arch=('any')
url="https://github.com/lostisland/${_gemname}"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rspec')
checkdepends=('ruby-rspec' 'ruby-faraday' 'ruby-webmock' 'ruby-multipart-parser')
#checkdepends=('ruby-rspec' 'ruby-rack' 'ruby-webmock' 'ruby-httpclient' 'ruby-rspec-expectations' 'ruby-multipart-parser' 'ruby-rack-test')
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
sha512sums=('4296d94ccaa482b6c37e0e9596c4a4bdc809c899818d40e6a29adb64f49a75a76f107ac7082cdc3527e195b4fc6f2fbfc72ca46258fc595987eed73e2878130c')

prepare() {
  cd "${srcdir}/${_gemname}-${pkgver}"

  # drop broken/cirular dependencies
  sed --in-place '/add_development_dependency/d' "${_gemname}.gemspec"
}

build() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  gem build "${_gemname}.gemspec"
}

check() {
  cd "${srcdir}/${_gemname}-${pkgver}"
  # tests don't yet pass because excon is missing in the repos
  # we run the tests in ruby-faraday
  # rspec
}

package() {
cd "${srcdir}/${_gemname}-${pkgver}"
  local _gemdir="$(gem env gemdir)"
  gem install --verbose --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  rm -rf "${pkgdir}/${_gemdir}/cache"
}
