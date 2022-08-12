# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='capybara'
pkgname="ruby-${_gemname}"
pkgver=3.37.1
pkgrel=1
pkgdesc="An integration testing tool for rack based web applications. It simulates how a user would interact with a website"
arch=('any')
url='https://github.com/teamcapybara/capybara'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
depends=('ruby-addressable' 'ruby-mini_mime' 'ruby-nokogiri' 'ruby-rack' 'ruby-rack-test' 'ruby-regexp_parser' 'ruby-xpath')
makedepends=('ruby-rake' 'ruby-rspec')
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('8cac60f6c919a2d05e974ecb384c8ebebc28ecfdf827ebfeb8f0fef106562cfc4ecadbaa4e8dbb499c491a4bff4a90362ddf5ef10128b3c21e643f5bb1804ca1')

prepare() {
  cd "${_gemname}-${pkgver}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
}

build() {
  cd "${_gemname}-${pkgver}"

  gem build "${_gemname}.gemspec"
}

package() {
  cd "${_gemname}-${pkgver}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CONTRIBUTING.md README.md UPGRADING.md --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
