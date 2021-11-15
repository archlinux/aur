# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='actionpack'
pkgname="ruby-${_gemname}"
pkgver=6.1.4.1
pkgrel=4
pkgdesc='Web apps on Rails. Simple, battle-tested conventions for building and testing MVC web applications. Works with any Rack-compatible server'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-actionview' 'ruby-activesupport' 'ruby-rack' 'ruby-rack-test' 'ruby-rails-dom-testing' 'ruby-rails-html-sanitizer')
makedepends=('ruby-activemodel' 'ruby-rake')
checkdepends=('ruby-capybara' 'ruby-rack-cache' 'ruby-railties' 'ruby-rexml' 'ruby-selenium-webdriver')
source=(
    "https://github.com/rails/rails/archive/v${pkgver}/rails-${pkgver}.tar.gz"
    'fix_tests.patch'
)
sha512sums=('411d3fe21c7500e884edb86cc6728c4d3b7125d2e6ea913191437716f2be0d522252c55c25cb4c5221cc112b3ca5eeba690b0b0e59572fcc54ea42ba05ec4520'
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
