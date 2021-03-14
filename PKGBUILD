# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>

_gemname='capybara'
pkgname="ruby-${_gemname}"
pkgver=3.35.3
pkgrel=1
pkgdesc="An integration testing tool for rack based web applications. It simulates how a user would interact with a website."
arch=('any')
url='https://github.com/teamcapybara/capybara'
license=('MIT')
options=(!emptydirs)
depends=('ruby')
depends=('ruby-addressable' 'ruby-mini_mime' 'ruby-nokogiri' 'ruby-rack' 'ruby-rack-test' 'ruby-regexp_parser' 'ruby-xpath')
makedepends=('ruby-rake' 'ruby-rspec')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('7777f3a45b59b16be79ffa32e46d8bb39c7e63f52c878e09df392573e53a6476f1423c02f258a43158cc0ea8eaf3b0f4ddbd1f60abcdc29cc8f88e172edab427')

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
