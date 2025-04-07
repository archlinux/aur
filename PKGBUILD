# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>

_gemname='actionpack'
pkgname="ruby-${_gemname}"
pkgver=8.0.2
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
sha512sums=('d359714b510efe2876b8c800cc1faba517f5586c50c755428b73bf8e659ba915d10390c9992bb2b6915b229ce86a801862d26bbd43be965e081cdb12c9bb8e21'
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
