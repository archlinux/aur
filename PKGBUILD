# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Andreas 'Segaja' Schleifer <archlinux at segaja dot de>
# Contributor: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_gemname='actionview'
pkgname="ruby-${_gemname}"
pkgver=8.0.2
pkgrel=2
pkgdesc='Simple, battle-tested conventions and helpers for building web pages'
arch=('any')
url='https://rubyonrails.org'
license=('MIT')
options=(!emptydirs)
depends=('ruby' 'ruby-activesupport' 'ruby-builder' 'ruby-erubi' 'ruby-rails-dom-testing' 'ruby-rails-html-sanitizer')
makedepends=('ruby-rake')
checkdepends=('ruby-activemodel' 'ruby-actionpack' 'ruby-railties' 'ruby-sqlite3' 'ruby-rack-session' 'ruby-useragent' 'ruby-rackup' 'ruby-irb' 'ruby-matrix')
source=("https://github.com/rails/rails/archive/v${pkgver}/rails-${pkgver}.tar.gz")
sha512sums=('d359714b510efe2876b8c800cc1faba517f5586c50c755428b73bf8e659ba915d10390c9992bb2b6915b229ce86a801862d26bbd43be965e081cdb12c9bb8e21')

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
  install -Dm 644 CHANGELOG.md README.rdoc RUNNING_UNIT_TESTS.rdoc --target-directory "${pkgdir}/usr/share/doc/${pkgname}"
}
