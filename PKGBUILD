_gemname='capybara'
pkgname="ruby-${_gemname}"
pkgver=3.40.0
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
sha512sums=('d4762a01b234a73c5bc1a36b91c4bc3b86c47656cac151bbf1fd86ed1febcfae52934e2270583f52d08af18c6468cf007a423bbd8c8b18c81a49f9c15d41507f')

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
