# Maintainer: Tim Meusel <tim@bastelfreak.de>

_gemname='faraday-em_http'
pkgname="ruby-${_gemname}"
pkgver=1.0.0
pkgrel=1
pkgdesc='About Faraday adapter for EventMachine::HttpRequest'
arch=('any')
url="https://github.com/lostisland/${_gemname}"
license=('MIT')
depends=('ruby')
checkdepends=('ruby-rspec' 'ruby-faraday' 'ruby-webmock' 'ruby-multipart-parser')
options=('!emptydirs')
source=("${url}/archive/v${pkgver}/${_gemname}-v${pkgver}.tar.gz")
sha512sums=('0b352b49cf04b32769959727fb445416ae4a325dfdcb7e3494cfad664dac40acd4e5202dd6e55caccf1b07e491dcd76b8e72a7cf3ba02986ef3e18200c596c14')

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
