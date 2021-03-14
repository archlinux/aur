# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='actionpack'
pkgname="ruby-${_gemname}"
pkgver=6.1.3
pkgrel=2
pkgdesc='Web apps on Rails. Simple, battle-tested conventions for building and testing MVC web applications. Works with any Rack-compatible server.'
arch=('any')
url='http://www.rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionview' 'ruby-activesupport' 'ruby-rack' 'ruby-rack-test' 'ruby-rails-dom-testing' 'ruby-rails-html-sanitizer')
makedepends=('ruby-activemodel' 'ruby-rake')
checkdepends=('ruby-capybara' 'ruby-rack-cache' 'ruby-railties' 'ruby-selenium-webdriver')
source=(
    "rails-${pkgver}.tar.gz::https://github.com/rails/rails/archive/v${pkgver}.tar.gz"
    'fix_tests.patch'
)
sha512sums=('ec6e871e3226c3efa5dc7f59cbd1819b45ab0d1a21b39b8c2d76022fff761fb268f79c7b560b987af245d9e305ecc4517379de3769d468b5a548005f8533044a'
            'e25704542301f41fc81fa28c084f45646970a0308eaf9773920b67f09991d02cb822c0193eb7cb03b90a8967129296dabca2229c0869f7dfd13d583a5950a664')

prepare() {
  cd "rails-${pkgver}/${_gemname}"

  # update gemspec to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"

  patch --strip=1 --input=../../fix_tests.patch
}

build() {
  cd "rails-${pkgver}/${_gemname}"

  gem build "${_gemname}.gemspec"
}

check() {
  cd "rails-${pkgver}/${_gemname}"

  rake test
}

package() {
  cd "rails-${pkgver}/${_gemname}"

  local _gemdir="$(gem env gemdir)"

  gem install --ignore-dependencies --no-user-install --install-dir "${pkgdir}/${_gemdir}" --bindir "${pkgdir}/usr/bin" "${_gemname}-${pkgver}.gem"

  rm "${pkgdir}/${_gemdir}/cache/${_gemname}-${pkgver}.gem"

  install -Dm 644 MIT-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 CHANGELOG.md README.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
