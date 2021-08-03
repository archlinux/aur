# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='faraday-em_synchrony'
pkgname="ruby-${_gemname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='Faraday adapter for EM::Synchrony'
arch=('any')
url="https://github.com/lostisland/${_gemname}"
license=('MIT')
depends=('ruby')
makedepends=('ruby-rspec')
#checkdepends=('ruby-rspec' 'ruby-rack' 'ruby-webmock' 'ruby-httpclient' 'ruby-rspec-expectations' 'ruby-multipart-parser' 'ruby-rack-test')
checkdepends=('ruby-faraday' 'ruby-webmock' 'ruby-multipart-parser')
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
sha512sums=('c9f4751c08d45f8c9a0342c978dc9459b396f7f1fe9729915e5a614060900be9d7a285b607871547ee66ac13a1aba2169b2e436ef7791656842a0536fd70fd10')

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
  # tests don't yet pass because some em-http is missing in the repos
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
