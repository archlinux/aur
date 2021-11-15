# Maintainer: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname='actionview'
pkgname="ruby-${_gemname}"
pkgver=6.1.4.1
pkgrel=4
pkgdesc='Simple, battle-tested conventions and helpers for building web pages'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activesupport' 'ruby-builder' 'ruby-erubi' 'ruby-rails-dom-testing' 'ruby-rails-html-sanitizer')
makedepends=('ruby-rake')
checkdepends=('ruby-activemodel' 'ruby-actionpack' 'ruby-railties' 'ruby-sqlite3')
source=("https://github.com/rails/rails/archive/v${pkgver}/rails-${pkgver}.tar.gz")
sha512sums=('411d3fe21c7500e884edb86cc6728c4d3b7125d2e6ea913191437716f2be0d522252c55c25cb4c5221cc112b3ca5eeba690b0b0e59572fcc54ea42ba05ec4520')

prepare() {
  cd "rails-${pkgver}/${_gemname}"

  # update gemspec/Gemfile to allow newer version of the dependencies
  sed --in-place --regexp-extended 's|~>|>=|g' "${_gemname}.gemspec"
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
  install -Dm 644 CHANGELOG.md README.rdoc RUNNING_UJS_TESTS.rdoc RUNNING_UNIT_TESTS.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
